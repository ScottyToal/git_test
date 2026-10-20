---
paths: ["**/*.unity", "**/*.prefab", "**/*.asset", "**/*.tscn", "**/*.tres"]
---
# Scene / prefab / resource files
- These are serialized engine files. Grep them for names/IDs; read only small line ranges.
- Don't hand-edit GUIDs, fileIDs, `uid://` or `ExtResource` ids. Prefer changing things through scripts/editor tools (or the engine MCP if connected).
- If a hand edit is unavoidable, change the minimum lines and tell me to reopen the file in the editor to verify.
