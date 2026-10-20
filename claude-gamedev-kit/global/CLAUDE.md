# About me
Indie game developer. Main tools: <ENGINE: Unity / Godot / Unreal>, Blender, Obsidian (design docs + notes).
Platforms I ship to: <PC / console / mobile>.

# How to work with me
- Be concise. No preamble, no recap of what I just said.
- Multi-file change → give a 3–5 line plan first. One-line fix → just do it.
- Edit existing files over creating new ones. Don't add docs/READMEs I didn't ask for.
- Gameplay numbers (speeds, damage, timings, cooldowns) go in config/data assets, never hardcoded.
- Everything frame-dependent uses delta time. Physics code goes in the fixed/physics step.
- When done, say how you verified it (ran build, test, scene, screenshot), or say plainly you couldn't.

# Token discipline
- Never Read binary or huge generated files (.blend .fbx .psd .wav .ogg .uasset .umap, Library/, .godot/, Intermediate/).
  Inspect them with CLI tools instead: `file`, `ffprobe`, `identify`, or `blender --background --python`.
- Broad "where is X / how does Y work" searches → delegate to the `scout` subagent.
- Build/editor/crash logs → delegate to the `log-scanner` subagent; I only want the unique errors.
- Read only the line range you need from big scripts/scenes.

# Design docs
My Obsidian vault is at <ABSOLUTE PATH TO VAULT>. Game design docs live in `<vault>/Games/<GameName>/`.
When implementing a feature, check its design note first; if code and note disagree, ask which wins.
