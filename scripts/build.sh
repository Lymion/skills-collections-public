#!/usr/bin/env bash
# Copy the master copy (skills-src/) into the plugin (plugins/haykal-skills/skills/),
# so the plugin always matches skills-src exactly. Run after any change to skills-src/.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/skills-src"
DEST="$ROOT/plugins/haykal-skills/skills"

[ -d "$SRC" ] || { echo "error: $SRC not found" >&2; exit 1; }

rm -rf "$DEST"
mkdir -p "$DEST"

count=0
for dir in "$SRC"/*/; do
  name="$(basename "$dir")"
  if [ ! -f "$dir/SKILL.md" ]; then
    echo "skip: $name (no SKILL.md)" >&2
    continue
  fi
  # -L follows symlinks so the plugin holds real files.
  cp -RL "$dir" "$DEST/$name"
  count=$((count + 1))
done

# Drop junk that should never ship.
find "$DEST" \( -name '__pycache__' -o -name '.DS_Store' -o -name '*.pyc' \) -prune -exec rm -rf {} +

echo "built $count skills into ${DEST#$ROOT/}"
