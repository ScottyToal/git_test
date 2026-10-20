This is ScottyToal's first git project

## Elderwild (working title): fantasy race RPG for Roblox

- [Market research](docs/fantasy-race-rpg/RESEARCH.md): Blox Fruits, Shindo Life, Slayers 2, Deepwoken, Arcane Odyssey, and the fantasy gap
- [Concept bible](docs/fantasy-race-rpg/GAME_DESIGN.md): world, map, races, Shards, weapons, animation budget, mobs, bosses, dungeon
- `src/`: early code sketch from v0.1. **Outdated** (still has element fusions); it gets rewritten once the concept is locked (synced into Studio with [Rojo](https://rojo.space) via `default.project.json`)
  - `src/shared/RaceData.luau`: race definitions and roll odds
  - `src/shared/ElementData.luau`: elements, moves and fusions
  - `src/server/RaceRoller.luau`: server-side race spins with pity
