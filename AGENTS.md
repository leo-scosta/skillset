# Working in this repo

This repository holds Agent Skills that must run unmodified across Claude, ChatGPT/Codex,
Copilot, Cursor, and Gemini CLI. Portability is the constraint everything else follows from.

## Non-negotiables

**1. Frontmatter uses only the six spec fields.**

`name`, `description`, `license`, `compatibility`, `metadata`, `allowed-tools`.

Anything else is a hard failure when packaging for claude.ai or the Skills API. In particular,
these are valid in Claude Code but **must not appear here**: `argument-hint`, `arguments`,
`model`, `effort`, `context`, `agent`, `background`, `hooks`, `paths`, `shell`, `when_to_use`,
`disable-model-invocation`, `user-invocable`, `disallowed-tools`.

Constraints: `name` is 1–64 chars of lowercase letters, digits and hyphens, and **must match the
directory name**. `description` is 1–1024 chars and **must not contain `<` or `>`**.
`metadata` values must be strings, so quote versions: `version: "1.0"`.

**2. No tool-specific syntax in the body.**

No backtick-bang shell injection, no `$ARGUMENTS` or `$1` substitution, no `@file` references.
These are harness features, not spec features — they appear as literal noise in tools that
don't implement them.

**3. Exactly one `SKILL.md` per skill folder.**

Nested ones are rejected on upload. Supporting docs go in `references/` under other names.

**4. Every skill folder has both `SKILL.md` and `README.md`.**

They target different readers and must not be merged:

- `SKILL.md` is loaded into context in full on every activation. Instructions only — no
  rationale, no history, no screenshots. Keep it under ~500 lines and push depth into
  `references/`, which loads on demand.
- `README.md` is never loaded by an agent. It explains the problem, the approach, a rejected
  alternative, and the known limits.

**5. Validate before committing.**

```bash
tools/validate.sh            # all skills
tools/validate.sh <name>     # one skill
```

CI runs the same check. Never commit a skill that doesn't pass.

## Layout

```
skills/<name>/
├── SKILL.md          # required
├── README.md         # required
├── references/       # optional — loaded on demand
├── assets/           # optional — templates, data
├── scripts/          # optional — executable code
└── evals/            # trigger test cases; excluded from packaged artifacts
```

## Adding a skill

Use the `skill-maker` skill — it enforces all of the above. If writing by hand, follow
`skills/skill-maker/references/spec-rules.md` and `house-style.md`, then:

1. Add a row to the skills table in `README.md`.
2. Add an entry to `CHANGELOG.md`.
3. Run `tools/validate.sh`.
4. Run `tools/link-skills.sh` to make it available to your local tools.

A skills directory that didn't exist when your session started isn't watched yet, so restart Claude Code the first time one is created.

## The description field

`description` is the only part of a skill loaded at startup, in every tool. It alone decides
whether a skill is ever considered — a strong body behind a vague description never runs.

State what it does, when to use it, and the phrasings a user would actually type. Too broad is
worse than too narrow: an over-eager skill degrades unrelated requests.

## Naming

Name skills for what they do, never for who made them. No personal initials or prefixes — the
name is both the typed command and a primary relevance signal, and a prefix weakens both.
Authorship goes in `metadata.author`.

## Don't edit

`tools/quick_validate.py` is vendored from `anthropics/skills` (Apache-2.0) and kept
byte-identical below its header so it can be re-synced. Fix skills to satisfy it; don't
loosen it.
