---
name: shaders
description: Write and debug game shaders and materials, such as toon/cel shading, outlines, dissolve, fresnel/rim, hologram, water, vertex wind/sway, scrolling UVs, triplanar, and post-processing, in HLSL, Unity Shader Graph/URP/HDRP, Godot shading language, or Unreal materials. Use for any shader, material, or rendering-look request.
---
# Shaders

## 1. Identify the pipeline first (wrong pipeline = pink/magenta material)
- Unity: Built-in vs **URP** vs HDRP (check `GraphicsSettings`/Packages/manifest.json for `com.unity.render-pipelines.*`). URP HLSL uses `Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl`, `TEXTURE2D/SAMPLER` macros, `CBUFFER_START(UnityPerMaterial)` (required for SRP Batcher).
- Godot 4: `shader_type spatial | canvas_item | particles | sky | fog`; renderer Forward+ / Mobile / Compatibility (Compatibility = GLES3 limits).
- Unreal: material graph (prefer) or Custom HLSL node; Material Functions for reuse, Material Instances for variation.

## 2. Workflow
1. Write the smallest version that shows *something* (output a solid color, then UVs as color).
2. Add one feature at a time; expose every magic number as a property/uniform with a sensible range.
3. Debug by outputting intermediates as color (`return float4(n * 0.5 + 0.5, 1)` for normals).
4. When you can't see the result, tell me exactly what it should look like so I can check.

## 3. Recipe cheatsheet (core math)
- **Fresnel/rim**: `pow(1 - saturate(dot(N, V)), power)`.
- **Toon ramp**: `NdotL = dot(N, L)`; `step(threshold, NdotL)` or sample a 1D ramp texture at `NdotL * 0.5 + 0.5`. Add rim + specular step for anime look.
- **Outline**: inverted hull (second pass, extrude along normal in clip space, cull front) for meshes; or a post-process edge detect on depth/normals for full-screen.
- **Dissolve**: `clip(noise - _Cutoff)`; edge glow where `noise - _Cutoff < _EdgeWidth`.
- **Scrolling UV**: `uv + _Speed * _Time.y` (Unity) / `TIME` (Godot) / `Time` node (Unreal).
- **Vertex wind**: offset `sin(_Time * freq + worldPos.x * k) * amp * vertexColor.r` (paint vertex color for sway weight; 0 at trunk/roots).
- **Triplanar**: blend 3 planar samples by `pow(abs(N), sharpness)` normalized.
- **Depth fade / soft intersection** (water shore, soft particles): `saturate((sceneDepth - fragDepth) / distance)`.
- **Hologram**: fresnel + scanlines `frac(worldPos.y * density + time)` + flicker + additive.

## 4. Performance
- Fragment cost scales with screen pixels × overdraw. Keep transparent shaders cheap.
- Avoid dynamic branches on per-pixel data in mobile; prefer `lerp/step`. Texture samples in loops are expensive.
- Use `half` precision on mobile where safe (colors, UVs within 0–1), `float` for world positions/depth.
- Pack masks into RGBA channels of one texture.
- Keyword/variant explosion (Unity `multi_compile`): prefer `shader_feature_local`; each keyword doubles variants.

## 5. Deliver
The shader/material file, the properties to tweak with recommended values, the pipeline/renderer it targets, and how to apply it (material setup steps).
