#!/usr/bin/env bash
# Create skills-src/<name>/SKILL.md from a template.
#
#   scripts/new-skill.sh <name> ["one-line description"]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

[ $# -ge 1 ] || { echo "usage: $0 <name> [\"description\"]" >&2; exit 1; }
NAME="$1"
DESC="${2:-TODO: what this skill does and when Claude should use it.}"
DESC="${DESC//\\/\\\\}"   # escape backslashes for YAML
DESC="${DESC//\"/\\\"}"     # escape double quotes for YAML

if ! printf '%s' "$NAME" | grep -Eq '^[a-z0-9]+(-[a-z0-9]+)*$'; then
  echo "error: name must be lowercase letters, digits and hyphens (e.g. my-skill)" >&2
  exit 1
fi

DIR="$ROOT/skills-src/$NAME"
[ -e "$DIR" ] && { echo "error: ${DIR#$ROOT/} already exists" >&2; exit 1; }

mkdir -p "$DIR"
TITLE="$(printf '%s' "$NAME" | tr '-' ' ')"
cat > "$DIR/SKILL.md" <<TEMPLATE
---
name: $NAME
description: "$DESC"
---

# $TITLE

## When to use

- TODO: the situations or phrases that should trigger this skill.

## Instructions

1. TODO: first step.
2. TODO: next step.

## Output

- TODO: what the finished result looks like.
TEMPLATE

echo "created ${DIR#$ROOT/}/SKILL.md"
echo "next: edit it, then run scripts/build.sh and commit"
