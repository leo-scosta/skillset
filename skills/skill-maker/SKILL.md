---
name: skill-maker
description: Scaffold a new Agent Skill into this repository following its house conventions - writes SKILL.md and README.md, seeds an evals file, and runs the spec validator. Use when the user wants to create, add, start, or scaffold a new skill, turn a repeated prompt or workflow into a reusable skill, or asks how to structure a SKILL.md. Also use when reviewing an existing skill for spec compliance or portability across AI tools.
license: MIT
metadata:
  author: leandro-costa
  version: "1.0"
  repository: skillset
---

# Skill Maker

Creates a new skill in this repository that is valid under the [Agent Skills](https://agentskills.io)
open standard, so it runs unchanged in Claude, ChatGPT/Codex, Copilot, Cursor, Gemini CLI, and
other compatible tools.

Two references carry the detail. Load them when you need them, not before:

- `references/spec-rules.md` — the six allowed frontmatter fields and their exact constraints.
  Read this before writing any frontmatter.
- `references/house-style.md` — this repo's conventions: the two-file rule, the evals
  convention, and how to write a description that actually triggers.

`assets/skill-template.md` is the skeleton to fill in.

## Process

### 1. Interview before writing

Do not skip to a draft. A skill written from a one-line request triggers unreliably, because
the `description` ends up guessing at the wrong situations. Ask:

- **What should it do?** Get to a concrete outcome, not a topic area.
- **When should it fire?** Ask for three to five phrasings the user would actually type.
  These become both the `description` keywords and the eval cases, so collect them verbatim
  rather than paraphrasing.
- **When should it NOT fire?** The adjacent cases it should stay out of. This is the question
  people skip, and it is the one that prevents a skill from hijacking unrelated requests.
- **Does it need scripts, templates, or reference docs?** Most skills need none.

If the user gives a vague answer, ask once more with a concrete example. If it is still vague,
draft something specific and let them react to it — reacting is easier than specifying.

### 2. Pick the name

Lowercase letters, digits, and hyphens; it must match the directory name exactly.

Name it for what it does, not who made it. No personal initials or prefixes: the name is both
the command people type and a primary relevance signal, and a prefix degrades both. Authorship
belongs in `metadata.author`.

Check both `skills/` and `skills-private/` (if present) for an existing skill that already
covers the request. Extending one is almost always better than adding a near-duplicate that
competes with it for triggering.

### 3. Ask whether the skill is public or private

The repo has two skill folders — pick which one this belongs in **before** creating files:

- `skills/` — the public folder, tracked by the outer git repo, pushed to a public GitHub.
  Use for skills the user is happy to share.
- `skills-private/` — a nested private git repo (pushed to a private GitHub). Gitignored by
  the outer repo. Use for personal, client-specific, or experimental skills the user does
  not want public.

Ask the user *"public or private?"* if it isn't obvious from what they said. Default to
public unless they've said otherwise or the skill obviously touches private material (client
names, personal files, credentials, internal workflows).

If the user picks private and `skills-private/` doesn't exist yet, tell them to run the
setup first (see the repo `README.md`) — do not create it silently.

### 4. Create the files

```
<folder>/<name>/            # <folder> is skills/ or skills-private/
├── SKILL.md          # required — for the agent
├── README.md         # required here — for the human
├── references/       # only if SKILL.md would otherwise exceed ~500 lines
├── assets/           # only if there are templates or data files
├── scripts/          # only if there is code to run
└── evals/evals.json  # test cases; not shipped to users
```

`SKILL.md` and `README.md` are both mandatory in this repo. They serve different readers and
must not be merged — see `references/house-style.md` for why.

Start from `assets/skill-template.md`. Follow `references/spec-rules.md` for the frontmatter,
and set `metadata.author` and `metadata.version` (`"1.0"`, quoted — metadata values must be
strings).

### 5. Seed the evals

Write the trigger phrases from step 1 into `evals/evals.json`:

```json
{
  "skill": "<name>",
  "cases": [
    {"prompt": "a phrase the user would actually type", "should_trigger": true},
    {"prompt": "an adjacent request it must stay out of", "should_trigger": false}
  ]
}
```

Include the negative cases. A skill that fires on everything is worse than one that fires on
nothing, because it degrades every unrelated request.

### 6. Validate

```
tools/validate.sh <name>
```

Works for both public and private skills — the validator scans `skills/` and
`skills-private/`. Fix whatever it reports and run again until it passes. It enforces the
same rules as the claude.ai upload path, so a skill that fails here will be rejected there
too.

### 7. Register it

For **public** skills:

- Add a row to the outer repo's `README.md` skills table.
- Add an entry under the outer repo's `CHANGELOG.md`.
- Run `tools/link-skills.sh` so the new skill is available in the user's local tools.

For **private** skills:

- If `skills-private/` has its own `README.md` / `CHANGELOG.md`, update those instead —
  never mention private skills in the outer public README (they'd leak the names).
- Still run `tools/link-skills.sh` — it symlinks from both folders.

Either way, mention that a newly created skills directory needs a restart of the tool before
it is picked up.

## Checks before calling it done

- `name` matches the directory name.
- Frontmatter uses only the six allowed fields — no `argument-hint`, `model`, `context`,
  `hooks`, `paths`, or `allowed-tools` beyond the spec's meaning.
- `description` says what it does *and* when to use it, and contains no `<` or `>`.
- No tool-specific syntax in the body: no backtick-bang command injection, no `$ARGUMENTS`
  or `$1` substitution, no `@file` references. These break portability.
- Exactly one `SKILL.md` in the folder. Supporting docs go in `references/` under other names.
- `README.md` explains the reasoning, not the instructions.
- `tools/validate.sh` passes.
