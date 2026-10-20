---
name: perf-profiling
description: Diagnose and fix game performance problems, such as low FPS, stutter/hitches, GC spikes, long load times, high memory, and too many draw calls, using the Unity Profiler, Godot Profiler/Monitors, or Unreal Insights/stat commands. Use when the game runs slow, hitches, or before optimizing anything.
---
# Performance Profiling

## Rule 0: measure before changing anything
Never optimize from guesses. Ask for (or tell me how to capture) a profile of the slow case on the **target hardware**, in a **development build** (not the editor, which adds overhead).

## 1. Budget
60fps = 16.6ms, 30fps = 33.3ms, 120fps = 8.3ms per frame. Find which side is over:
- **CPU-bound**: main/game thread or render thread time ≈ frame time.
- **GPU-bound**: GPU time ≈ frame time; lowering resolution raises FPS → GPU (fill-rate/pixel) bound.
- **Hitches** (spikes, not low average): GC, asset loading/instantiation, shader compilation, physics spikes.

## 2. Capture by engine
- **Unity**: Profiler (Deep Profile only for short captures), Frame Debugger for draw calls, Memory Profiler package. Look at GC Alloc column per frame (target 0 B in gameplay), `Physics.Simulate`, `Camera.Render`, `Canvas.SendWillRenderCanvases`.
- **Godot**: Debugger → Profiler & Monitors (FPS, process/physics time, draw calls, objects, nodes). `--print-fps`, Visual Profiler for GPU. Watch for orphan nodes growth (leaks).
- **Unreal**: `stat unit`, `stat fps`, `stat gpu`, `stat scenerendering`, Unreal Insights (`-trace=cpu,gpu,frame`), `ProfileGPU`.

## 3. Common culprits → fix
| Symptom | Likely cause | Fix |
|---|---|---|
| Steady GC spikes | allocs per frame (strings, LINQ, lambdas, new arrays) | cache, pool, reuse buffers, non-alloc APIs |
| Spike on spawn | Instantiate / scene load | object pooling, async load, pre-warm |
| First-time hitch per effect | shader compilation | shader warmup / PSO cache / variant collection |
| High draw calls | many materials/meshes | batching (SRP Batcher, GPU instancing, MultiMesh), atlases, merge static meshes |
| GPU bound | overdraw, expensive post, shadows, resolution | reduce transparent layers, shadow distance/cascades, dynamic resolution/upscaling |
| Many scripts ticking | per-object Update/_process/Tick | manager-driven updates, disable when offscreen, lower tick rate |
| Physics heavy | mesh colliders, too many contacts | primitive colliders, layers/collision matrix, lower fixed rate |

## 4. Process
1. Reproduce and capture. 2. Name the single biggest cost with numbers. 3. Fix only that. 4. Re-measure and report before/after ms. 5. Repeat if still over budget.
Use the `log-scanner` agent if the profile is exported as a long text dump.
