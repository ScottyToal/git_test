---
name: obsidian-vault
description: Read, write, and organize notes in the user's Obsidian vault, including game design docs (GDD), feature specs, lore, task boards, meeting/devlog notes, and linking design to code. Use when the user mentions Obsidian, their vault, notes, a GDD, design doc, devlog, or asks to write something down or look something up in their notes.
---
# Obsidian Vault

The vault is a folder of markdown files. Work on it directly with Read/Grep/Glob/Edit; no MCP needed. Vault path is in the user's CLAUDE.md (ask once if missing).

## Conventions to preserve
- YAML frontmatter at the top (`---` block). Keep existing keys; add `updated: YYYY-MM-DD` when you edit.
- Links: `[[Note Name]]`, `[[Note Name#Heading]]`, `[[Note Name|alias]]`, embeds `![[image.png]]`. Don't convert to markdown links. When renaming a note, Grep for `[[Old Name` and update every link.
- Tags: `#tag` inline or `tags: [a, b]` in frontmatter, matching existing style.
- Callouts: `> [!note]`, `> [!warning]`, `> [!todo]`.
- Tasks: `- [ ]` / `- [x]` (Tasks plugin may add `📅 2026-01-01`; keep those emojis).
- Dataview queries (```` ```dataview ````) are code. Don't "fix" them unless asked.
- Never edit `.obsidian/` (settings/plugins) or move attachments.

## Finding things cheaply
- `Grep` for the term across `*.md` and return note names + matching lines; open only the 1–3 best notes.
- Use frontmatter fields to filter (e.g. `status: in-progress`, `type: feature`).

## Recommended game-dev vault layout (suggest if the vault is empty/messy, don't force it)
```
Games/<GameName>/
  00 Overview.md        # pitch, pillars, target audience, platforms
  Features/<Feature>.md # one note per mechanic: goal, rules, numbers, edge cases, status
  Content/              # levels, enemies, items (one note each, frontmatter stats)
  Art & Audio/          # style guide, palettes, references
  Decisions.md          # dated decision log
  Devlog/YYYY-MM-DD.md
Templates/Feature.md
```
Feature note frontmatter: `type: feature`, `status: idea|designed|in-progress|done|cut`, `owner:`, `updated:`.

## Writing style for notes
Short sections, bullets, tables for numbers. Lead with the rule, then the reason. Put tuning numbers in a table so code can be checked against them (see `design-keeper` agent).
