# Changelog

All notable changes to this collection are recorded here.

## [Unreleased]

### Added

- Support for a nested `skills-private/` folder for private skills. The
  outer public repo gitignores it; `skills-private/` is expected to be its
  own git repository pushed to a private GitHub repo. `tools/validate.sh`
  and `tools/link-skills.sh` iterate both folders; `skill-maker` asks
  "public or private?" before scaffolding.
- `web-typography`, `web-color`, `web-components`, `web-motion`,
  `web-accessibility` — five focused skills that split the previous
  `web-design` five-stage pass into independently triggerable pieces, so
  each stage can be reached for on its own ("pick fonts", "audit
  contrast", "redesign my hero", "add scroll animations", "WCAG AA
  check") without paying the cost of the whole pass. Each skill carries
  its own tightened `description`, its own `assets/review-template.md`,
  its own `evals/evals.json` (positive cases specific to the stage,
  negative cases covering the other four), and the stage's reference
  file (`typography.md`, `color.md`, `inspiration.md` + `voices.md`,
  `motion.md`, `accessibility.md`) moved from `web-design` with history
  preserved. Rules retained per stage: open-source fonts only in
  typography, WCAG AA minimum on colour and accessibility (AAA where
  cheap), reduced-motion fallback and lighter alternative on every
  motion recommendation, no token renames anywhere, cite every
  inspiration source specifically.

### Removed

- `web-design` — split into the five focused skills above. The umbrella
  skill's `description` had to cover five different topic areas at once,
  which weakened each individual trigger; splitting was flagged in the
  original README as a rejected alternative and is now the accepted
  approach. No single "run the full pass in one shot" entry point
  remains — compose the five skills in sequence for the same result.

### Changed

- `web-copy` — adds a ninth rubric category, **Voice authenticity**, with
  `references/llm-fingerprints.md` cataloguing 14 LLM-generated-copy fingerprints
  (X-not-Y aphoristic closers, em-dash overuse, "supercharged" AI-slop vocabulary,
  unsupported AI claims, role/discipline mismatch in parallel structures, and 9
  more) and hooks into the always-on rules and both self-check steps so drafts
  are scanned before returning. `references/llm-fingerprints-tests.md` holds
  test snippets for regression testing. Skill version bumped to `1.1`.

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
