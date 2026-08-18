#!/usr/bin/env bash
# Validate every skill in skills/ against the Agent Skills spec.
#
# Usage:
#   tools/validate.sh              # validate all skills
#   tools/validate.sh skill-maker  # validate one skill by name
set -uo pipefail
cd "$(dirname "$0")/.."

# Prefer the repo-local venv; fall back to whatever python3 has pyyaml.
if [ -x .venv/bin/python ]; then
  PY=.venv/bin/python
else
  PY=python3
fi

if ! "$PY" -c 'import yaml' 2>/dev/null; then
  cat >&2 <<'MSG'
error: the validator needs PyYAML, which is not installed.

Set up the repo-local virtualenv once:

    python3 -m venv .venv && .venv/bin/pip install pyyaml

MSG
  exit 2
fi

if [ $# -gt 0 ]; then
  targets=()
  for name in "$@"; do targets+=("skills/${name%/}"); done
else
  targets=(skills/*/)
fi

failed=0
for dir in "${targets[@]}"; do
  [ -d "$dir" ] || { echo "✗ $dir — not found" >&2; failed=1; continue; }
  name=$(basename "$dir")
  if out=$("$PY" tools/quick_validate.py "$dir" 2>&1); then
    echo "✓ $name"
  else
    echo "✗ $name — $out" >&2
    failed=1
  fi
done

if [ "$failed" -ne 0 ]; then
  echo >&2
  echo "Validation failed. See AGENTS.md for the frontmatter rules." >&2
  exit 1
fi
echo
echo "All skills valid."
