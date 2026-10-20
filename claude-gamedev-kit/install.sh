#!/usr/bin/env bash
# Install the game-dev kit into ~/.claude (skills, agents, user CLAUDE.md),
# and optionally scaffold a game project. Never overwrites existing files.
#
#   ./install.sh                     # global skills + agents + ~/.claude/CLAUDE.md
#   ./install.sh --project ~/MyGame  # also copy project template into a game folder
#   ./install.sh --vault ~/Obsidian  # also drop the vault CLAUDE.md into your vault
set -euo pipefail

KIT="$(cd "$(dirname "$0")" && pwd)"
DEST="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

copy_tree() {  # copy_tree <src> <dst>: copy files, skipping ones that already exist
  local src="$1" dst="$2"
  (cd "$src" && find . -type f) | while read -r f; do
    if [[ -e "$dst/$f" ]]; then
      echo "skip   $dst/${f#./} (exists)"
    else
      mkdir -p "$(dirname "$dst/$f")"
      cp "$src/$f" "$dst/$f"
      echo "added  $dst/${f#./}"
    fi
  done
}

copy_tree "$KIT/global" "$DEST"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) copy_tree "$KIT/project-template" "$2"; shift 2 ;;
    --vault)   copy_tree "$KIT/obsidian-vault-template" "$2"; shift 2 ;;
    *) echo "unknown option: $1" >&2; exit 1 ;;
  esac
done

echo
echo "Done. Next: fill the <PLACEHOLDERS> in $DEST/CLAUDE.md (and the project CLAUDE.md), then restart Claude Code."
