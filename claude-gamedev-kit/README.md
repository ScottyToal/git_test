# Claude Code Game-Dev Kit

A ready-to-install setup for using Claude Code as a game-dev assistant: skills, subagents, CLAUDE.md templates, token-saving settings, plus Blender, Obsidian and engine integrations. Researched Oct 2026 against the official Claude Code docs and the current GitHub ecosystem.

---

## 1. Install (5 minutes)

```bash
git clone <this repo> && cd <repo>/claude-gamedev-kit
./install.sh --project ~/path/to/MyGame --vault ~/path/to/ObsidianVault
```
On Windows run it from Git Bash or WSL, or copy the folders by hand: `global/*` → `%USERPROFILE%\.claude\`.
The installer never overwrites files you already have.

Then:
1. Fill the `<PLACEHOLDERS>` in `~/.claude/CLAUDE.md` (engine, vault path) and in `MyGame/CLAUDE.md`. Delete lines that don't apply. **Shorter is better.**
2. Edit `MyGame/.claude/settings.json` and delete deny rules for engines you don't use.
3. Restart Claude Code. Type `/` to see the skills, and `/agents` to see the subagents.
4. Optional: install the official Anthropic skills: `/plugin marketplace add anthropics/skills`, then `/plugin install example-skills@anthropic-agent-skills`. Useful ones: `frontend-design`, `canvas-design`, `algorithmic-art`, `skill-creator`.

## 2. What's in the kit

**Skills** live in `~/.claude/skills/`. Only each skill's one-line description sits in context; the body loads when you ask for that kind of work, so they're cheap to keep installed.

| Skill | Triggers on |
|---|---|
| `vfx` | particles, explosions, hit effects, Niagara/VFX Graph/GPUParticles |
| `game-ui` | HUD, menus, gamepad nav, scaling, accessibility, UMG/UI Toolkit/Control nodes |
| `shaders` | toon, outline, dissolve, water, wind, HLSL/Shader Graph/gdshader |
| `game-feel` | "feels floaty/stiff", coyote time, hitstop, screen shake, squash & stretch |
| `perf-profiling` | low FPS, stutter, GC spikes, draw calls |
| `blender` | .blend inspect/export, LODs, batch jobs, Blender MCP. **Includes 2 tested headless scripts.** |
| `obsidian-vault` | notes, GDD, devlog, "write this down" |

**Subagents** live in `~/.claude/agents/`. Each runs in its own context window and returns only a summary, which keeps your main conversation small.

| Agent | Model | Use for |
|---|---|---|
| `scout` | Haiku (cheap) | "where is X / how does Y work" |
| `log-scanner` | Haiku | 5,000-line Editor/build/crash logs → 10 unique errors |
| `asset-auditor` | Haiku | oversized textures, files missing LFS, duplicates |
| `game-code-reviewer` | Sonnet | delta-time bugs, per-frame allocs, destroyed-object access |
| `design-keeper` | Sonnet | keep the Obsidian GDD and the code in sync |

**Project template** (`project-template/`):
- `CLAUDE.md`: skeleton, under 50 lines.
- `.claude/settings.json`: **deny rules so Claude never reads Library/, .godot/, Intermediate/, .fbx/.blend/.wav and similar**. This is the single biggest token saver for game projects.
- `.claude/rules/*.md`: instructions that load *only* when Claude touches shader or scene files.
- `.mcp.json.example`: Blender + Godot MCP config.

## 3. Token-saving rules (the habits matter more than the files)

1. **`/clear` between unrelated tasks.** It's free. A long chat re-sends everything on every message. If you've corrected Claude twice on the same thing, `/clear` and write a better prompt.
2. **Be specific.** Say "fix the double-jump in `@Scripts/Player/PlayerMove.cs` `HandleJump()`", not "fix the jump". Use `@file` to point at files.
3. **Delegate exploration.** Say "use scout to find how damage is applied". The file dumps stay in the subagent.
4. **Model choice.** Use Sonnet for most work. `/model opusplan` uses Opus to plan and Sonnet to execute. Subagents already use Haiku. `/effort low` is enough for simple edits.
5. **Plan mode (Shift+Tab)** for multi-file features; skip it for small fixes.
6. **Keep CLAUDE.md under ~100 lines.** Move anything file-type-specific into `.claude/rules/` with `paths:` and anything workflow-specific into a skill. Note that `@imports` still load at startup, so they don't save tokens.
7. **Watch it.** `/context` shows what's eating context, and `/usage` shows token spend. `/compact focus on <task>` when a session must continue. `/btw` asks a side question without adding it to history.
8. **Few MCP servers.** Turn off ones you aren't using with `/mcp`. Prefer CLIs (`blender -b`, `git`, `ffprobe`) over MCP when they do the job.
9. **Give Claude a way to check its work** (a test, a build exit code, a screenshot) so it doesn't loop.
10. `.claudeignore` **does not exist**. Use the `permissions.deny` rules in settings.json (already set up).

## 4. Integrations: what to install

| Tool | Recommended | Install | Notes |
|---|---|---|---|
| **Blender** | headless `blender -b` + this kit's `blender` skill | already included | cheapest; no screenshots in context |
| | live: [ahujasid/mcp-for-blender](https://github.com/ahujasid/mcp-for-blender) (~31k★) | `claude mcp add blender uvx mcp-for-blender` then `uvx mcp-for-blender install-addon` → enable addon → N panel → Start MCP Server | runs arbitrary Python (`BLENDER_MCP_SAFE_MODE=1` restricts it); telemetry on unless `DISABLE_TELEMETRY=true`; Poly Haven CC0 assets, Sketchfab, AI 3D gen |
| **Obsidian** | run `claude` in the vault folder (it's just markdown) | `--vault` option of install.sh | zero MCP cost |
| | in-app: [YishenTu/claudian](https://github.com/YishenTu/claudian) (~15k★) | Obsidian Community Plugins | Claude Code inside Obsidian; an `ANTHROPIC_API_KEY` env var can override your subscription |
| | live app state: [obsidian-local-rest-api](https://github.com/coddingtonbear/obsidian-local-rest-api) (has built-in MCP) | `claude mcp add --transport http obsidian https://127.0.0.1:27124/mcp/ --header "Authorization: Bearer <key>"` | only if you need the active file/commands |
| **Unity** | [CoplayDev/unity-mcp](https://github.com/CoplayDev/unity-mcp) (~15k★) | Package Manager → git URL `https://github.com/CoplayDev/unity-mcp.git?path=/MCPForUnity#main` → Window › MCP for Unity › Configure All Detected Clients | official Unity MCP exists for Unity 6 + AI Assistant (unverified details) |
| **Godot** | [hi-godot/godot-ai](https://github.com/hi-godot/godot-ai) (editor, Godot 4.7+) or [Coding-Solo/godot-mcp](https://github.com/Coding-Solo/godot-mcp) (lighter) | `claude mcp add godot -e GODOT_PATH=/path/to/godot -- npx @coding-solo/godot-mcp` | godot-ai telemetry on by default |
| **Unreal** | Epic's experimental MCP plugin in UE 5.8 (unverified), else [chongdashu/unreal-mcp](https://github.com/chongdashu/unreal-mcp) | see repo | all options are still experimental |
| **Figma (UI)** | official | `claude mcp add --transport http figma https://mcp.figma.com/mcp` | free tiers get very few calls |
| **Pixel art** | [willibrandon/pixel-plugin](https://github.com/willibrandon/pixel-plugin) / [diivi/aseprite-mcp](https://github.com/diivi/aseprite-mcp) | see repo | small projects |
| **Audio** | ElevenLabs hosted MCP `https://api.elevenlabs.io/v1/mcp` | `claude mcp add --transport http elevenlabs <url>` | the old elevenlabs-mcp repo was archived Aug 2026 |
| **Big assets** | Git LFS | `git lfs install && git lfs track "*.blend" "*.fbx" "*.png" "*.wav" "*.psd"` | commit `.gitattributes` |

Worth knowing about, but young or unproven: [htdt/godogen](https://github.com/htdt/godogen) (builds whole games autonomously), [scenario-labs/skills](https://github.com/scenario-labs/skills) (about 90 art-pipeline skills, paid generation), [arjun988/blender-skills](https://github.com/arjun988/blender-skills). Curated list: [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code).

## 5. REA (morluto/rea): what it actually is

**"Reverse Engineer Anything"** is an MCP server plus CLI (npm package `rea-agents`, MIT, about 3 months old) that lets Claude inspect compiled software. It drives existing tools: Ghidra, IDA, Hopper, Rizin, JADX, Frida and others. It also has its own parsers for **Unity IL2CPP metadata, Godot .pck files, .NET assemblies, Electron/JS apps**, Go/Rust binaries and more. It returns evidence (pseudocode, strings, cross-references) and explains how a feature works.

**Reality check**
- "Anything" is marketing. Native-code results are only as good as Ghidra or IDA, which you install yourself (IDA is paid), and decompiled output is often wrong or incomplete.
- It recovers structure and names, **not clean source code**. It doesn't unpack or de-obfuscate, and its own policy refuses DRM, anti-cheat, cheats and "copying proprietary code/assets".
- The README claims 300k stars on a 3-month-old repo. Treat that as unverified. The project moves very fast, is likely heavily AI-generated, and has about 40 runtime dependencies.

**Legal (not legal advice)**
- Game EULAs usually ban reverse engineering.
- DMCA §1201 (US) bans bypassing protection.
- The EU allows decompiling only for interoperability.
- Copying another game's code or art into yours is infringement however you extracted it.
- Safe pattern: **learn how it works, then build your own version from scratch** (a "clean-room" rewrite).

**Where it's genuinely useful for you**
- **Your own builds**: see what players can extract from your Unity/Godot game, and catch leaked debug symbols, API keys or unencrypted assets before shipping.
- Building **mod support** or documenting your own file formats.
- Debugging closed-source plugins or middleware you've licensed.
- Diffing your release builds.
- Checking suspicious downloaded tools for malware.

**Safe install** (isolated profile, pinned version, ideally a VM or a separate user account):
```bash
CLAUDE_CONFIG_DIR=~/.claude-rea npx rea-agents@6.7.0 setup --client claude_code --dry-run   # review the changes
CLAUDE_CONFIG_DIR=~/.claude-rea npx rea-agents@6.7.0 setup --client claude_code
CLAUDE_CONFIG_DIR=~/.claude-rea claude                                                       # separate "RE" profile
```
Install only from `morluto/rea` or npm `rea-agents`; the README itself warns that lookalike repos exist. Decompiled code you analyze gets sent to the model, so don't point it at anything under NDA.

## 6. Making your own skills

Your own skills will beat generic ones because they hold your project's conventions. The pattern that works:
1. Do a task with Claude once and correct it until it's right.
2. Say: "Turn what we just did into a skill." Or use `/plugin install` → `skill-creator` from anthropics/skills.
3. Keep `SKILL.md` under about 500 lines. Put big references or scripts in sibling files that SKILL.md points to; they load only when needed.
4. The `description` is what triggers the skill. State what it does **and** when to use it, with the words you'd actually type.
5. For actions with side effects (build, export, deploy), add `disable-model-invocation: true` so they only run when you type `/name`.

Good next skills to write once you've settled your pipeline: `build-and-release` (your exact build and upload steps), `level-design` (your grid/metrics/encounter rules), `audio-implementation` (your mixer and naming conventions), and `<engine>-conventions` (your architecture).
