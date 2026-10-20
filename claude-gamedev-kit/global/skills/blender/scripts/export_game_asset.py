"""Export objects from a .blend with engine-correct settings. Never saves the .blend.

Usage:
  blender -b file.blend --python export_game_asset.py -- \
      --engine unity|unreal|godot --out path/to/file.fbx|.glb \
      [--format fbx|glb] [--objects A,B] [--apply-transforms]
"""
import argparse
import os
import sys

import bpy
from mathutils import Matrix

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
parser = argparse.ArgumentParser()
parser.add_argument("--engine", required=True, choices=["unity", "unreal", "godot"])
parser.add_argument("--out", required=True)
parser.add_argument("--format", choices=["fbx", "glb"])
parser.add_argument("--objects", help="comma-separated object names (default: all mesh/armature/empty)")
parser.add_argument("--apply-transforms", action="store_true",
                    help="bake rotation/scale into unparented, single-user meshes (in memory only)")
args = parser.parse_args(argv)

fmt = args.format or ("glb" if args.engine == "godot" else "fbx")
out = os.path.abspath(args.out)
os.makedirs(os.path.dirname(out), exist_ok=True)

scene_objs = bpy.context.scene.objects
if args.objects:
    names = [n.strip() for n in args.objects.split(",")]
    missing = [n for n in names if n not in scene_objs]
    if missing:
        sys.exit(f"ERROR missing objects: {missing}")
    targets = [scene_objs[n] for n in names]
else:
    targets = [o for o in scene_objs if o.type in {"MESH", "ARMATURE", "EMPTY"}]

for o in scene_objs:
    o.select_set(o in targets)

if args.apply_transforms:
    for o in targets:
        if o.type == "MESH" and o.parent is None and not o.children and o.data.users == 1:
            loc = o.location.copy()
            o.data.transform(o.matrix_basis)
            o.matrix_basis.identity()
            # Keep the object where it was; only rotation/scale get baked into the mesh.
            o.data.transform(Matrix.Translation(-loc))
            o.location = loc
        elif o.type == "MESH":
            print(f"WARN skipped apply-transforms on {o.name} (parented, has children, or shared mesh)")

if fmt == "fbx":
    common = dict(
        filepath=out,
        use_selection=True,
        object_types={"MESH", "ARMATURE", "EMPTY"},
        use_mesh_modifiers=True,
        mesh_smooth_type="FACE",
        add_leaf_bones=False,
        bake_anim=True,
        path_mode="COPY",
        embed_textures=False,
    )
    if args.engine == "unity":
        common.update(apply_scale_options="FBX_SCALE_ALL", axis_forward="-Z", axis_up="Y",
                      bake_space_transform=True)
    bpy.ops.export_scene.fbx(**common)
else:
    bpy.ops.export_scene.gltf(
        filepath=out,
        export_format="GLB",
        use_selection=True,
        export_apply=True,
        export_yup=True,
        export_animations=True,
    )

tris = 0
for o in targets:
    if o.type == "MESH":
        tris += sum(len(p.vertices) - 2 for p in o.data.polygons)
print(f"EXPORTED {len(targets)} objects ({tris} tris, pre-modifier) -> {out} [{args.engine}/{fmt}]")
