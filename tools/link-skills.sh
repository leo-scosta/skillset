#!/usr/bin/env bash
# Link every skill in this repo into the directories your AI tools read.
#
# Symlinks (not copies), so `git pull` or editing a SKILL.md updates every tool
# at once. Re-run it after adding a new skill.
#
# Usage:
#   tools/link-skills.sh              # link into all known tool directories
#   tools/link-skills.sh --claude     # Claude Code only
#   tools/link-skills.sh --agents     # ~/.agents/skills only (Codex/Cursor/Copilot/Gemini)
#   tools/link-skills.sh --dry-run    # show what would happen, change nothing
#   tools/link-skills.sh --prune      # also remove dead links from earlier runs
set -uo pipefail
cd "$(dirname "$0")/.."
REPO="$(pwd)"

targets=("$HOME/.claude/skills" "$HOME/.agents/skills")
dry=0; prune=0

for arg in "$@"; do
  case "$arg" in
    --claude)  targets=("$HOME/.claude/skills") ;;
    --agents)  targets=("$HOME/.agents/skills") ;;
    --dry-run) dry=1 ;;
    --prune)   prune=1 ;;
    -h|--help) sed -n '2,12p' "$0"; exit 0 ;;
    *) echo "unknown option: $arg" >&2; exit 2 ;;
  esac
done

# Never link a skill that doesn't pass the spec validator.
if ! tools/validate.sh >/dev/null 2>&1; then
  echo "error: validation failed — fix it before linking." >&2
  echo "Run tools/validate.sh to see what's wrong." >&2
  exit 1
fi

run() { if [ "$dry" -eq 1 ]; then echo "  would: $*"; else "$@"; fi; }

for dir in "${targets[@]}"; do
  echo "$dir"
  [ -d "$dir" ] || run mkdir -p "$dir"

  # Refuse to touch a directory that is itself a symlink — that's the
  # whole-directory setup, and writing into it would edit the repo.
  if [ -L "$dir" ]; then
    echo "  skipped: this directory is itself a symlink (whole-directory setup)"
    continue
  fi

  if [ "$prune" -eq 1 ] && [ -d "$dir" ]; then
    for link in "$dir"/*; do
      [ -L "$link" ] || continue
      [ -e "$link" ] || { echo "  pruning dead link: $(basename "$link")"; run rm "$link"; }
    done
  fi

  # Public skills first, then private. `[ -d ]` guards against the literal
  # glob when a folder is empty or missing.
  for base in skills skills-private; do
    for src in "$REPO/$base"/*/; do
      [ -d "$src" ] || continue
      name=$(basename "$src")
      dest="$dir/$name"

      if [ -L "$dest" ]; then
        current=$(readlink "$dest")
        if [ "$current" = "${src%/}" ]; then
          echo "  ok       $name"
          continue
        fi
        echo "  relink   $name (was -> $current)"
        run ln -sfn "${src%/}" "$dest"
      elif [ -e "$dest" ]; then
        # A real file or directory: someone else owns this name. Don't clobber it.
        echo "  CONFLICT $name — a real file/directory already exists here, leaving it alone" >&2
      else
        echo "  linked   $name"
        run ln -s "${src%/}" "$dest"
      fi
    done
  done
done

echo
if [ "$dry" -eq 1 ]; then
  echo "Dry run — nothing changed."
else
  echo "Done. Restart Claude Code if a skills directory was created just now."
fi
