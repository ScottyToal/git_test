# <GAME NAME>
<One line: genre, camera, core loop.> Design docs: `<vault>/Games/<GameName>/` (Obsidian).

## Stack
- Engine: <Unity 6.x URP | Godot 4.x (GDScript/C#) | Unreal 5.x (C++/Blueprints)>
- Key packages/plugins: <Input System, Cinemachine, DOTween, ...>
- Target: <platforms, target FPS, min spec>

## Commands
- Run tests: `<e.g. unity -batchmode -runTests -projectPath . -testPlatform EditMode | godot --headless -s addons/gut/gut_cmdln.gd>`
- Build: `<command>`
- Lint/format: `<dotnet format | gdformat . | clang-format>`

## Layout
- `<Assets/_Game/Scripts/>`: gameplay code, one folder per system (Player/, Combat/, UI/)
- `<Assets/_Game/Data/>`: tuning values (ScriptableObjects / .tres / DataAssets). **All gameplay numbers live here.**
- `<Assets/_Game/Art/>`: binary assets; never Read these.

## Conventions (only what differs from engine defaults)
- <e.g. Systems talk via event bus `GameEvents`; no FindObjectOfType at runtime.>
- <e.g. Naming: PascalCase scenes, `SFX_`, `T_`, `M_`, `SM_` asset prefixes.>
- <e.g. New scripts get a namespace `MyGame.<System>`.>

## Gotchas
- <e.g. Scene files are YAML; don't hand-edit GUIDs.>
- <e.g. Physics runs at 50Hz; character controller is kinematic.>

## Compact instructions
When compacting, keep: current task goal, files changed, failing test names, open decisions. Drop: file dumps, log output.
