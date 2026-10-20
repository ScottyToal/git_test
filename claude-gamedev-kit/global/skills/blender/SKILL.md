---
name: blender
description: Work with Blender for game assets, including inspecting .blend files, exporting FBX/glTF with correct engine settings (Unity/Godot/Unreal), batch processing, LODs, renders/thumbnails, collision naming, and modeling via Blender's Python API or the Blender MCP. Use whenever a .blend file, 3D model, export, or Blender task is involved.
---
# Blender for game assets

## Pick the mode (cheapest first)
1. **Headless bpy (default)**: `blender --background <file.blend> --python <script.py> -- <args>`. No UI, no screenshots in context, perfect for inspect/export/batch. Use the bundled scripts below.
2. **Blender MCP (live)**: only for interactive modeling/scene-building where seeing the viewport matters. Requires Blender open with the "MCP for Blender" addon server started (N panel → Start MCP Server). Ask for screenshots sparingly; each one costs tokens.

Never Read a .blend file; it's binary.

## Bundled scripts (in this skill's `scripts/` folder)
- `inspect_blend.py`: per-object report: type, tris, verts, materials, UV layers, modifiers, unapplied transforms, open/non-manifold edges, dimensions. Add `--json` for machine output.
  `blender -b asset.blend --python ~/.claude/skills/blender/scripts/inspect_blend.py`
- `export_game_asset.py`: export with engine-correct settings.
  `blender -b asset.blend --python ~/.claude/skills/blender/scripts/export_game_asset.py -- --engine unity --out Assets/Models/crate.fbx [--objects Crate,Crate_LOD1] [--apply-transforms]`
  Engines: `unity` (FBX), `unreal` (FBX), `godot` (GLB). `--format glb|fbx` overrides.
Run `inspect_blend.py` before exporting and report problems (unapplied scale, missing UVs, n-gons in skinned meshes, non-manifold) to the user. Don't silently fix the source file.

## Export conventions
| Engine | Format | Key settings | Collision naming |
|---|---|---|---|
| Unity | FBX | Apply Scalings: FBX All, Forward -Z, Up Y, Apply Transform on, no leaf bones | `*_col` meshes or add colliders in Unity |
| Unreal | FBX | defaults (cm handled by importer), smoothing: Face, no leaf bones | `UCX_<Mesh>_01` (convex), `UBX_` box, `USP_` sphere; LODs `<Mesh>_LOD1` |
| Godot 4 | GLB (or import .blend directly) | +Y up, apply modifiers | name suffix `-col` (trimesh), `-convcol`, `-colonly`, `-noimp` to skip |

Always: apply scale/rotation (1,1,1 / 0,0,0), origin at the pivot the game needs (feet for characters, base for props), real-world scale (1 unit = 1 m), triangulate in engine or on export consistently.
Sanity check: a 1 m cube should import as exactly 1 unit.

## Writing new bpy scripts
- Start from `import bpy, sys; argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []`.
- In background mode there's no viewport/context. Avoid `bpy.ops` that need an area; prefer data API (`bpy.data`, `obj.modifiers.new`, `bmesh`).
- Never `bpy.ops.wm.save_mainfile()` on the user's source file unless asked. Save to a new path.
- Print a compact summary at the end (counts, output paths). That's all that should come back into context.
- Useful batch jobs: decimate LODs (`modifiers.new(type='DECIMATE')`, ratios 0.5/0.25/0.1), render 512px thumbnails (Eevee, transparent film), rename by convention, bake/pack textures, apply all modifiers.

## Blender MCP (if installed)
Tools include scene info, object info, execute Python, viewport screenshot, Poly Haven (CC0 HDRIs/textures/models; request 1k–2k to avoid freezes), Sketchfab, and AI 3D generation (Hyper3D/Hunyuan3D/Tripo/Meshy). Prefer `get_scene_info` over screenshots. Assets from Sketchfab/generation: check the license before shipping.
