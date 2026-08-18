# Contributing

Suggestions and fixes are welcome. The conventions in [AGENTS.md](AGENTS.md) are the rules —
this file just covers the mechanics.

## Setup

```bash
python3 -m venv .venv && .venv/bin/pip install pyyaml
tools/validate.sh
```

## Adding or changing a skill

The fastest route is the `skill-maker` skill, which enforces the conventions for you. By hand:

1. Create `skills/<name>/` with `SKILL.md` and `README.md`.
2. Frontmatter uses **only** `name`, `description`, `license`, `compatibility`, `metadata`,
   `allowed-tools`. `name` must match the directory name.
3. Add `evals/evals.json` with the phrasings that should trigger the skill — and the adjacent
   ones that should not.
4. Add a row to the skills table in `README.md` and an entry in `CHANGELOG.md`.
5. Run `tools/validate.sh`.
6. Run `tools/link-skills.sh` to try it in your own tools.

## What CI checks

- Every skill passes the spec validator.
- Every skill has a `README.md` and an `evals/evals.json`.
- Every skill is listed in the README table.

## Scope

Skills here must be portable — no syntax specific to one vendor's harness. A skill that only
works in one tool belongs in that tool's own config, not in this collection.

One skill, one job. If a proposal overlaps an existing skill, extending the existing one is
usually better: two skills with similar descriptions compete for triggering and both get less
reliable.
