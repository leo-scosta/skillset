# Changelog

All notable changes to this collection are recorded here.

## [Unreleased]

### Added

- `web-design` — runs a structured five-stage design pass (typography, colour,
  components, motion, accessibility) on a page or section, with the existing
  design system treated as a constraint. Open-source fonts only (Google Fonts,
  Fontshare, Fontsource); every motion recommendation carries a
  `prefers-reduced-motion` fallback and a lighter alternative; every
  text/background pair is contrast-checked to WCAG AA and pushed to AAA where
  cheap. On-demand references for typography, colour tools, inspiration
  sources (Awwwards, CollectUI, Framer, Webflow, Godly, Land-book), motion
  libraries (GSAP, Motion, Three.js, Lenis, View Transitions), accessibility
  gates, and a personal `voices.md` library seeded with the Mengto repos
  (Kage, Towers, Sketchbook). Ships a structured review template — Intent,
  Baseline, Findings, Change list, Snippets, Open questions.

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
