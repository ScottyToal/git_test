"""Inspect a .blend file for game-readiness.

Usage:
  blender -b file.blend --python inspect_blend.py [-- --json]
"""
import json
import sys

import bmesh
import bpy

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
as_json = "--json" in argv


def mesh_stats(obj, depsgraph):
    eval_obj = obj.evaluated_get(depsgraph)
    me = eval_obj.to_mesh()
    bm = bmesh.new()
    bm.from_mesh(me)
    stats = {
        "verts": len(bm.verts),
        "tris": sum(len(f.verts) - 2 for f in bm.faces),
        "ngons": sum(1 for f in bm.faces if len(f.verts) > 4),
        "open_or_nonmanifold_edges": sum(1 for e in bm.edges if not e.is_manifold),
        "uv_layers": [uv.name for uv in obj.data.uv_layers],
    }
    bm.free()
    eval_obj.to_mesh_clear()
    return stats


def issues_for(obj, info):
    issues = []
    if any(abs(s - 1.0) > 1e-4 for s in obj.scale):
        issues.append("unapplied scale")
    if any(abs(r) > 1e-4 for r in obj.rotation_euler):
        issues.append("unapplied rotation")
    if obj.type == "MESH":
        if not info["uv_layers"]:
            issues.append("no UVs")
        if not info["materials"]:
            issues.append("no material")
        if info["ngons"] and any(m.type == "ARMATURE" for m in obj.modifiers):
            issues.append("ngons on skinned mesh")
        if info["open_or_nonmanifold_edges"]:
            issues.append(f"{info['open_or_nonmanifold_edges']} open/non-manifold edges")
    return issues


depsgraph = bpy.context.evaluated_depsgraph_get()
report = {"file": bpy.data.filepath, "unit_scale": bpy.context.scene.unit_settings.scale_length, "objects": []}
total_tris = 0

for obj in bpy.context.scene.objects:
    info = {
        "name": obj.name,
        "type": obj.type,
        "parent": obj.parent.name if obj.parent else None,
        "dimensions_m": [round(d, 3) for d in obj.dimensions],
        "modifiers": [m.type for m in obj.modifiers],
        "materials": [s.material.name for s in obj.material_slots if s.material],
    }
    if obj.type == "MESH":
        info.update(mesh_stats(obj, depsgraph))
        total_tris += info["tris"]
    info["issues"] = issues_for(obj, info)
    report["objects"].append(info)

report["total_tris"] = total_tris
report["images"] = [
    {"name": img.name, "size": list(img.size), "packed": img.packed_file is not None}
    for img in bpy.data.images if img.type == "IMAGE"
]

if as_json:
    print(json.dumps(report, indent=1))
else:
    print(f"FILE {report['file']}  unit_scale={report['unit_scale']}  total_tris={total_tris}")
    for o in report["objects"]:
        line = f"- {o['name']} [{o['type']}] dims={o['dimensions_m']}"
        if o["type"] == "MESH":
            line += f" tris={o['tris']} uv={len(o['uv_layers'])} mats={len(o['materials'])}"
        if o["modifiers"]:
            line += f" mods={','.join(o['modifiers'])}"
        if o["issues"]:
            line += f"  !! {'; '.join(o['issues'])}"
        print(line)
    for img in report["images"]:
        w, h = img["size"]
        pot = (w & (w - 1) == 0) and (h & (h - 1) == 0)
        print(f"  img {img['name']} {w}x{h}{'' if pot else ' (non-power-of-two)'}{' packed' if img['packed'] else ''}")
