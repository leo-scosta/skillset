# Changelog

All notable changes to this collection are recorded here.

## [Unreleased]

### Changed

- `web-copy` — adds a ninth rubric category, **Voice authenticity**, with
  `references/llm-fingerprints.md` cataloguing 14 LLM-generated-copy fingerprints
  (X-not-Y aphoristic closers, em-dash overuse, "supercharged" AI-slop vocabulary,
  unsupported AI claims, role/discipline mismatch in parallel structures, and 9
  more) and hooks into the always-on rules and both self-check steps so drafts
  are scanned before returning. `evals/llm-fingerprints.md` holds test snippets
  for regression testing.

### Added

- `web-copy` — reviews or drafts website copy at senior-copywriter level. Default en-GB,
  professional-friendly tone. Ships with an eight-line rubric (clarity, scannability, en-GB,
  SEO, persuasion, CTA, tone, trust) and on-demand references covering en-GB spelling,
  on-page SEO, conversion frameworks (AIDA / PAS / StoryBrand / BAB / Schwartz stages),
  microcopy, page patterns, and a named-author canon from Ogilvy to Cialdini. `WebFetch`
  only — no paid connectors.
- `skill-maker` — scaffolds a new skill into this repo following its conventions: writes
  `SKILL.md` and `README.md`, seeds `evals/evals.json` from interview answers, and runs the
  spec validator.
- `tools/link-skills.sh` — symlinks every skill into `~/.claude/skills/` and
  `~/.agents/skills/`, so adding a skill makes it available across Claude Code, Codex,
  Cursor, Copilot, and Gemini CLI in one command. Validates first, never clobbers real
  files, supports `--dry-run` and `--prune`.
- Repository scaffolding: `AGENTS.md` conventions, `tools/validate.sh` and the vendored
  `quick_validate.py`, and a GitHub Actions workflow that validates every skill on push.
