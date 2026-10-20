---
name: vfx
description: Design and build real-time game VFX (hits, explosions, magic, muzzle flashes, trails, pickups, ambient effects) with particle systems and effect shaders in Unity (VFX Graph/Shuriken), Godot (GPUParticles) or Unreal (Niagara). Use when asked to create, improve, or optimize a visual effect.
---
# Game VFX

## 1. Pin down the brief (ask only if not inferable)
Effect purpose (feedback / spectacle / ambience), art style (stylized/toon, realistic, pixel), camera distance, max simultaneous instances, target platform.

## 2. Structure every one-shot effect in 3 beats
| Beat | Duration | Job | Typical layers |
|---|---|---|---|
| Anticipation | 0–0.15s | telegraph | charge glow, inward particles, light ramp |
| Impact | 1–3 frames peak | readability | **core flash** (big, bright, very short), shape (ring/star/slash), sparks, point light pulse |
| Dissipation | 0.3–1.5s | aftermath | smoke/dust, embers, decal, lingering glow fading |
Sell the impact with non-VFX too: hitstop (40–100ms), screen shake, camera kick, SFX. See the `game-feel` skill.

## 3. Layer recipe (build in this order, test after each)
1. **Core/flash**: additive, 1–3 particles, lifetime 0.05–0.15s, size burst then shrink.
2. **Shape/silhouette**: shockwave ring (mesh or billboard, scale up with ease-out, alpha fade), or slash/flipbook.
3. **Secondary**: sparks (stretched billboards / velocity-aligned, gravity, drag), debris (mesh particles, collision optional).
4. **Tertiary**: smoke (alpha-blended, soft particles, slow rotation, size-over-life growing, lit or with fake lighting), embers.
5. **Extras**: point light (intensity curve, short), distortion/heat haze, decal, camera shake.

## 4. Craft rules
- **Value & color**: hot core near-white, outer hue saturated, smoke desaturated. Read the effect in grayscale; if it reads, color is a bonus.
- **Curves over constants**: size-over-life, alpha-over-life, color gradient. Ease-out for expansion, fast-in/slow-out alpha.
- **Randomize** lifetime ±20%, size ±30%, rotation 0–360°, and slight color variation. Uniform particles look fake.
- **Shape language** must match the game: sharp angular shapes for aggressive, round for friendly/magic.
- Timing beats texture quality. Get timing right with plain circles first.
- Flipbooks: 4×4 or 8×8, play at 24–30fps; use motion vectors/frame blending if the frame rate is low.

## 5. Performance budget
- **Overdraw** is the #1 VFX cost: big alpha-blended quads stacked on screen. Fewer, smaller, more opaque particles. Trim quads to the texture (Unity: custom vertex streams / mesh shape; Unreal: cutout).
- Prefer GPU particles for counts > ~500; CPU for few particles needing gameplay collision/events.
- Cap max particles; set bounds (Unity VFX Graph/Godot visibility AABB) so culling works.
- Pool effect instances; don't Instantiate/queue_free per hit.
- LOD: fewer particles / no lights / no distortion at distance or on low settings.

## 6. Engine notes
- **Unity**: VFX Graph (URP/HDRP, GPU, big counts) vs Particle System/Shuriken (all pipelines, CPU, easier events). Use Shader Graph for custom particle shaders (dissolve, erosion via alpha-threshold on noise). Soft particles need a depth texture enabled in URP.
- **Godot 4**: GPUParticles3D/2D with ParticleProcessMaterial; `one_shot = true`, `explosiveness = 1.0` for bursts; sub-emitters for trails/sparks; custom look via `shader_type spatial` with `render_mode unshaded, blend_add`. CPUParticles for compatibility renderer/mobile.
- **Unreal**: Niagara. Start from templates (Fountain, Simple Sprite Burst), then add modules: Scale Color/Sprite Size by curve, Curl Noise Force, Drag. Use material parameter collections or User params for gameplay hooks; Niagara scalability settings for LOD.

## 7. Deliver
State: layers built, key parameters (lifetimes, counts), how to trigger it from code (one call), and the perf cost (max particles, blend modes). If you can't view it, say so and list what I should eyeball.
