#!/usr/bin/env bash
# Copy every skill into <project>/.claude/skills/ and point the project's
# .claude/settings.json at the "haykal-public" marketplace (merging, never overwriting).
#
#   scripts/install-into.sh <project-path>
#
# Project-level skills work in cloud sessions that can't load a private plugin;
# the settings entry makes the plugin available wherever it can be loaded.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/skills-src"
REPO="Lymion/skills-collections-public"

[ $# -eq 1 ] || { echo "usage: $0 <project-path>" >&2; exit 1; }
[ -d "$1" ] || { echo "error: $1 is not a directory" >&2; exit 1; }
PROJECT="$(cd "$1" && pwd)"

# 1. Skills
mkdir -p "$PROJECT/.claude/skills"
count=0
for dir in "$SRC"/*/; do
  name="$(basename "$dir")"
  [ -f "$dir/SKILL.md" ] || continue
  rm -rf "$PROJECT/.claude/skills/$name"
  cp -RL "$dir" "$PROJECT/.claude/skills/$name"
  count=$((count + 1))
done
find "$PROJECT/.claude/skills" \( -name '__pycache__' -o -name '.DS_Store' -o -name '*.pyc' \) -prune -exec rm -rf {} +
echo "copied $count skills into $PROJECT/.claude/skills"

# 2. settings.json (merge)
SETTINGS="$PROJECT/.claude/settings.json"
MERGE_PY='
import json, os, sys
path, repo = sys.argv[1], sys.argv[2]
data = {}
if os.path.exists(path) and os.path.getsize(path) > 0:
    with open(path, encoding="utf-8") as f:
        data = json.load(f)
data.setdefault("extraKnownMarketplaces", {})["haykal-public"] = {
    "source": {"source": "github", "repo": repo}
}
data.setdefault("enabledPlugins", {})["haykal-skills@haykal-public"] = True
with open(path, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=2)
    f.write("\n")
'
MERGE_JS='
const fs = require("fs");
const [path, repo] = process.argv.slice(1);
let data = {};
if (fs.existsSync(path) && fs.statSync(path).size > 0) data = JSON.parse(fs.readFileSync(path, "utf8"));
data.extraKnownMarketplaces = data.extraKnownMarketplaces || {};
data.extraKnownMarketplaces["haykal-public"] = { source: { source: "github", repo } };
data.enabledPlugins = data.enabledPlugins || {};
data.enabledPlugins["haykal-skills@haykal-public"] = true;
fs.writeFileSync(path, JSON.stringify(data, null, 2) + "\n");
'
if command -v python3 >/dev/null 2>&1 && python3 -c '' 2>/dev/null; then
  python3 -c "$MERGE_PY" "$SETTINGS" "$REPO"
elif command -v python >/dev/null 2>&1 && python -c 'import sys; sys.exit(sys.version_info[0] < 3)' 2>/dev/null; then
  python -c "$MERGE_PY" "$SETTINGS" "$REPO"
elif command -v node >/dev/null 2>&1; then
  node -e "$MERGE_JS" "$SETTINGS" "$REPO"
else
  echo "error: need python3 or node to merge $SETTINGS" >&2
  exit 1
fi
echo "updated $SETTINGS (marketplace haykal-public -> $REPO)"
