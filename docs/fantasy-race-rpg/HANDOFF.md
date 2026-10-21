# Handoff: Elderwild concept conversation (cloud session → desktop session)

This file carries the full context of the planning conversation Scotty had with Claude in a cloud session, so the Claude Code session on Scotty's computer can continue without starting over. Read this first, then `GAME_DESIGN.md` and `RESEARCH.md` in this folder.

## Who Scotty is and what they want
- A Roblox developer. Plan: make simpler "slop-ish" games (like *Scare a Kid*, *Push a Mountain*) to gain traction and Robux, then build a **top home-page game that lasts for years**. The smaller games haven't taken off yet.
- Friends suggested a **fantasy game with fairies**, and said they'd play it. Scotty loves the idea: an old-fashioned fantasy action RPG with races (elves, dragons, fairies, dwarves, gnomes, golems, angels, demons, humans), powers, weapons and endless grind progression, in the style of **Slayers 2, Shindo Life and Blox Fruits**.
- **Goal:** build the whole game with Claude Code, using Scotty's desktop: Blender (models), Roblox Studio (game + animation on a Roblox rig), ChatGPT (icons and images), plus apps for VFX and cutscenes. Scotty wants it to be **magnificent, not AI slop**, and to prove what AI can do.
- **Budget: $0.** No paid animators or modelers. **Time: 8+ hours every day.** PC is high-end. Blender, Studio and the MCP setup are believed to be already installed.
- Scotty usually prompts **from their phone**, so keep replies readable and skimmable.

## Current stage: CONCEPT ONLY. Do not start building.
Scotty explicitly said: understand how these games are made and lock the concept first, so the production work is productive. Early on, Claude wrote some code too soon (`src/`), and that code is **outdated**: it still has element fusions and 19 elements. Don't build on it; it gets rewritten once the concept is locked.

## Research done (details in RESEARCH.md)
- **Blox Fruits:** ~60B visits, 200K–400K players online. Races V1→V4 with awakening trials.
- **Shindo Life:** ~2.7B visits. Bloodline spins with pity at 80; declined without fresh content.
- **Slayers 2:** launched Sept 18, 2026 at ~205K–216K players online. Race → clan spins → breathing; gear "series"; custom character creator.
- **Fantasy gap is real:** the big grind RPGs are all anime-themed. Fantasy ones are hardcore (Deepwoken, Rogue Lineage), roleplay-only (Kingdom Life II, Winx Fairy Guardians ~38M visits) or dead (Vesteria).
- Caveats already discussed: survivorship bias, the genre needs a lot of content, combat feel is make-or-break, and Roblox requires visible odds on paid random items.

## Decisions Scotty made (all reflected in GAME_DESIGN.md as ✅)
- **One progressive system, not lots of separate systems.** Every activity feeds another; race evolution is the goal that needs all of them.
- **Style:** in between bright and dark (kid-appealing but with mood). Faces in between anime and Western fantasy.
- **Main loop:** NPC quests gated by level unlock the next quests and areas.
- **Bosses:** the first kill is a quest; then repeatable for exclusive drops only available from that boss.
- **Dungeon:** drops on milestone floors (every 5/10) **and** dungeon points spent at a lobby shop for dungeon-only items.
- **Fishing/mining:** optional, safe, AFK-friendly layer for later-game players. Fishing gives **fish** (sold to the dock merchant) **and items** (crafting materials). AFK earns less than active play.
- **Powers ("elements", needs a better name):** **one at a time**; to change you reset it and go get a new one. **Mastery levels** unlock moves (like Blox Fruits). **Race has mastery too.**
- **Status effects:** NOT on every move (fire doesn't automatically burn). Reactions only when **two different players** combine their effects on one target. No unique fusion moves for every element pair: Scotty pointed out that's 19×19 possibilities, each needing animations and ultimates.
- **Races:** 9 at launch. Each has **key visual features** (elf ears, small dwarves, angel wings + halo, demon horns (+ wings later), golem stone texture, scales for lizard/fish-type races). Old-fashioned fantasy. **Each race has its own idle + run animation; dash and combat animations are shared.**
- **Wings/evolution (flexible ideas):** Fairy and Angel start with wings; Dragon grows wings after an evolution and gets faster; Demon is a super-fast runner and grows wings eventually.
- **Each realm/biome belongs to a race**, and that race gets better stats in its home biome.
- **Race expansion is needed** (games add races over time). Scotty's ideas: High Demon / High Angel evolutions, and **crafting races** (e.g. Lizard at max level + max Fire → Dragon).
- **World Tree** in the middle of the map that **changes its look based on the player's progression.** Scotty liked the "ancient world tree" story.
- **Character creator like Slayers 2:** a custom shared body (not the Roblox avatar), ~30 options each for eyes, mouths, scars, clothes, shoes, hair, all colorable, plus skin tones. Scotty suggested using **Roblox catalog/website hair (and maybe faces/clothes)** if a wide enough variety in one consistent style can be found.

## Claude's proposals awaiting Scotty's answer (💡 in GAME_DESIGN.md)
Map of 9 race realms around the Eldertree hub (Angel realm in the sky, Demon realm under the roots); "Shards" as the name for powers; Saurian (lizardfolk) rollable at launch with **Dragonborn as a Forged Race**; Ascensions per race; unicorn as a mount instead of a race; 12 launch Shards with move lists on 10 shared cast animations; 7 weapon classes, ~42 weapons; ~230-animation budget; named mobs and bosses per realm; Ignarax dragon world boss; the Spire dungeon inside the tree's trunk.

**Open questions (end of GAME_DESIGN.md):**
1. Name "Shards"?
2. Dragon forged-only or also rollable?
3. Shard mastery remembered when switching?
4. 9 realms + level cap 500 at launch, or smaller? (flagged as the biggest scope risk)
5. Trading at launch?
6. Unicorn mount?
7. PvP style?
8. Boss and realm names?

## How Claude and Scotty agreed to work
- **Scotty = creative director and playtester; Claude = builder.** Claude can't feel game timing, so Scotty watches animations and combat at full speed and gives notes, and Claude iterates.
- **Prefer MCP/code over mouse clicking:** Roblox Studio MCP for scripts and playtests, Blender MCP (Python) for models, keyframes by code, then screenshots/renders so Claude can see the result. Computer use is slow and uses a lot of Claude usage, so save it for visual checks.
- **Balancing research plan:** Claude can't watch YouTube videos. Use wikis for exact numbers (XP tables, drop rates); Scotty can log milestone timestamps from free-to-play "noob to pro" videos in a template Claude makes (watch out for 2x XP gamepasses and edited footage). Real balancing comes from our own playtest analytics later.
- **Pre-build checklist:** lock pillars, the system-connection diagram, the first 30 minutes of play, and an art style guide (used for every AI image prompt so icons match).
- **First build step when the time comes:** a gray-box combat prototype (one sword, fairy flight, two Shards, training dummies). Don't move on until it feels great.

## Where things live
- Repo: `ScottyToal/git_test`, branch `claude/fantasy-fairy-roblox-game-5tqm7n`
- `docs/fantasy-race-rpg/GAME_DESIGN.md`: concept doc v0.2 (current source of truth)
- `docs/fantasy-race-rpg/RESEARCH.md`: market research + sources
- `src/` + `default.project.json`: outdated v0.1 code sketch (Rojo layout)

## Suggested next step
Ask Scotty the open questions above, update GAME_DESIGN.md with the answers, then work through: the first 30 minutes of play → art style guide → balancing research template.
