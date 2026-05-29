#!/usr/bin/env bash
# Link this machine's ~/.claude/CLAUDE.md to the version-controlled copy here in
# ~/Skills, so global Claude Code context (and command registrations) sync across
# machines instead of being edited per-machine.
#
# Run once per machine, after pulling ~/Skills:
#   bash ~/Skills/global/link-claude-md.sh
#
# Idempotent and safe to re-run. Any pre-existing real file is backed up first.
set -e

SRC="$HOME/.claude/CLAUDE.md"
DST="$HOME/Skills/global/CLAUDE.md"

if [ ! -f "$DST" ]; then
  echo "✗ canonical file missing: $DST"
  echo "  Pull ~/Skills first, then re-run."
  exit 1
fi

if [ -L "$SRC" ]; then
  echo "✓ already linked → $(readlink "$SRC"). Nothing to do."
  exit 0
fi

mkdir -p "$HOME/.claude"

if [ -f "$SRC" ]; then
  BAK="$SRC.bak.$(date +%Y%m%d%H%M%S)"
  cp "$SRC" "$BAK"
  echo "⚠ existing ~/.claude/CLAUDE.md backed up to:"
  echo "  $BAK"
  echo "  If it has machine-specific lines not in the repo copy, merge them into:"
  echo "  $DST"
  rm "$SRC"
fi

ln -s "$DST" "$SRC"
echo "✓ linked ~/.claude/CLAUDE.md → $DST"
