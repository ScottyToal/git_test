---
name: game-feel
description: Add game feel and juice, such as responsive controls (coyote time, input buffering, acceleration curves), hitstop, screen shake, squash and stretch, camera smoothing, tweening/easing, knockback, and audio variation. Use when movement or combat feels floaty, stiff, or unsatisfying, or when asked to make something feel better or more juicy.
---
# Game Feel

Always expose these as tunable parameters (config/data asset/exported vars). Starting values below are proven defaults; tune by playing.

## Platformer / character control
| Technique | Default | Notes |
|---|---|---|
| Coyote time | 0.08–0.12s | still allow jump after leaving a ledge |
| Jump buffer | 0.1–0.15s | jump pressed slightly before landing still fires |
| Variable jump | cut upward velocity ×0.5 on release | short hop vs full jump |
| Fall gravity | 1.5–2.5× rise gravity | snappy arcs; clamp terminal velocity |
| Apex hang | gravity ×0.5 when \|vy\| small | floaty peak for control |
| Accel / decel | reach max speed in 0.05–0.15s, stop in 0.03–0.1s | separate air values (≈50–65%) |
| Corner correction | nudge 2–6px around ceiling corners | prevents head-bonk frustration |

## Combat / impact
- **Hitstop**: freeze attacker+target (or timescale ~0) for 40–100ms on hit; scale with damage. Don't freeze UI/audio.
- **Screen shake**: trauma-based. `trauma += 0.3` on hit (clamp 0–1), `shake = trauma²`, offset/rotation from Perlin noise × shake × max (e.g. 0.5 units / 3°), trauma decays ~1.5/s. Always provide a "reduce shake" option.
- **Knockback**: impulse away from hit direction + brief control lock (0.1–0.2s).
- **Flash**: hit object flashes white for 1–3 frames (shader param), then optional red tint fade.
- **Camera kick**: small FOV punch or offset toward impact.
- Damage numbers, particles (see `vfx` skill), rumble on gamepad.

## Animation & motion
- **Squash & stretch**: preserve volume (`scale.x = 1/scale.y`). Stretch on jump (0.8, 1.2), squash on land (1.25, 0.75), return over 0.1–0.15s with ease-out-back/elastic.
- **Easing**: UI and pops → ease-out-back; movement settle → ease-out-cubic; never linear for anything the player watches.
- **Framerate-independent smoothing**: `current = lerp(current, target, 1 - exp(-sharpness * dt))` (sharpness ~8–20). Never `lerp(a, b, 0.1)` per frame.
- **Camera**: look-ahead in move direction, dead zone, vertical damping stronger than horizontal, snap on respawn.

## Audio feel
Pitch randomize ±5–10% and volume ±10% on repeated SFX; layer (transient + body + tail); slight delay-free response (<50ms). Rising pitch for combos/pickup chains.

## Process
1. Ask (or infer) what feels wrong: input latency, floatiness, weightless hits, stiffness.
2. Add **one** technique at a time behind a toggle, so before/after can be compared.
3. Report the parameters added and where to tweak them.
