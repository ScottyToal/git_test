---
name: game-ui
description: Design and implement game UI/UX, including HUDs, menus, inventories, dialogue boxes, settings screens, tooltips, controller/gamepad navigation, resolution scaling, and accessibility, in Unity (UI Toolkit/uGUI), Godot (Control nodes/Themes) or Unreal (UMG/CommonUI). Use for any in-game interface work or UI feedback/juice.
---
# Game UI

## 1. Before building
- What must the player know **at a glance** vs **on demand**? At-a-glance → HUD. On demand → menus/tooltips.
- Input methods: mouse, gamepad, touch? **Gamepad navigation is designed in from day one**, never retrofitted.
- Target resolutions/aspects (16:9, 16:10, 21:9, Steam Deck 1280×800, mobile notches).

## 2. Layout rules
- Design at a reference resolution (1920×1080), scale by height (or match 0.5 width/height), anchor to corners/edges, never absolute pixel positions.
- Respect safe areas (TV ~5% margin, mobile notches). Keep critical HUD in corners and center clear.
- Visual hierarchy: one primary element per screen. Size > contrast > color > position.
- Leave **+30–40% text space** for localization (German/French run long). Use auto-size/wrapping, no text baked into images.
- Minimum readable text: ~28px at 1080p for TV/handheld, ~18–20px for desktop. Test on Steam Deck if shipping there.

## 3. Interaction & feel
- Every interactive element has **4 states**: normal, hover/focused, pressed, disabled. The focused state must be obvious on gamepad (outline/scale 1.05, not just a color shift).
- Feedback within 100ms: tween scale (1→1.08→1, 0.1s ease-out-back), sound, small particle for rewards.
- Menu transitions 0.15–0.3s; never block input for long animations. Allow skip.
- Confirm/cancel are consistent everywhere (gamepad South = confirm, East = back). Back always works.
- Numbers that change (HP, gold) animate/count up, with color flash on change. Damage numbers pop and float, slight random offset.

## 4. Accessibility checklist (cheap wins)
Text size slider, colorblind-safe (never color alone; add icon/shape), subtitle size + background, full input remapping, hold-to-toggle options, reduce screen shake/flash option, UI scale slider.

## 5. Architecture
- Separate UI from game logic: UI listens to events/signals or binds to a view-model; game code never references UI widgets directly.
- One screen/stack manager handles open/close/back and input focus; don't scatter `SetActive`/`visible` calls.
- Pause/input: when a menu is open, gameplay input is blocked by the input system's context/action map, not by `if (menuOpen)` checks everywhere.

## 6. Engine notes
- **Unity**: UI Toolkit (UXML/USS, good for menus/tools, flexbox) or uGUI (Canvas, best for world-space and heavy animation). Canvas Scaler = Scale With Screen Size. Split static and frequently-changing elements into separate Canvases (a change rebuilds the whole canvas). Use the Input System UI module + `EventSystem.SetSelectedGameObject` for gamepad focus. TextMeshPro for text.
- **Godot 4**: Control nodes + Containers (VBox/HBox/Grid/Margin) for layout, never manual positions. A shared `Theme` resource for fonts/styles. Project Settings → Display → Stretch mode `canvas_items`, aspect `expand`. Gamepad: `grab_focus()` on open, set `focus_neighbor_*` where automatic navigation fails. Tweens via `create_tween()`.
- **Unreal**: UMG + **CommonUI** (input routing, gamepad, activatable widget stacks, platform button icons). Use Widget Animations, `Invalidation Box`/`Retainer Box` for static panels. Bind via events, not per-tick property bindings (they run every frame).

## 7. Deliver
Build with placeholder art if needed. State: hierarchy/nodes created, how it's opened/closed from code, gamepad nav path, and what to check visually at 16:9 and 21:9.
