---
paths: ["**/*.shader", "**/*.hlsl", "**/*.cginc", "**/*.shadergraph", "**/*.gdshader", "**/*.usf", "**/*.ush"]
---
# Shader rules for this project
- Render pipeline: <URP 17 / Godot Forward+ / UE5 Lumen>. Use only that pipeline's includes and macros.
- Every tweakable value is a material property with a range; no magic numbers in the body.
- Unity: keep properties inside `CBUFFER_START(UnityPerMaterial)` (SRP Batcher compatibility).
- Prefer `shader_feature_local` over `multi_compile`.
- Load the `shaders` skill for recipes and the perf checklist.
