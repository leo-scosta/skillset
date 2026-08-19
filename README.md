# skillset

Agent Skills I've built and use. Portable by design — each one follows the open
[Agent Skills](https://agentskills.io) standard, so the same folder works in Claude, ChatGPT,
Copilot, Cursor, and Gemini CLI without modification.

[![Spec compliant](https://github.com/leo-scosta/skillset/actions/workflows/validate.yml/badge.svg)](https://github.com/leo-scosta/skillset/actions/workflows/validate.yml)

## Skills

| Skill | What it does |
| --- | --- |
| [`skill-maker`](skills/skill-maker) | Scaffolds a new skill into this repo — writes `SKILL.md` and `README.md`, seeds eval cases, runs the spec validator. |
| [`web-copy`](skills/web-copy) | Reviews or drafts website copy at senior-copywriter level — en-GB, SEO-sound, conversion-focused, friendly. Runs a rubric drawn from GOV.UK, NN/g, Google Search Central, Copyhackers, and the direct-response canon. |

## Install

Clone once:

```bash
git clone https://github.com/leo-scosta/skillset.git ~/skillset
```

Then link the skills you want into the directory your tool reads.

**`~/.agents/skills/` is read by Codex, Cursor, Copilot, and Gemini CLI** — it's the emerging
shared convention, so one link covers four tools:

```bash
mkdir -p ~/.agents/skills && ln -s ~/skillset/skills/skill-maker ~/.agents/skills/skill-maker
```

Claude Code uses its own directory, and follows symlinks:

```bash
mkdir -p ~/.claude/skills && ln -s ~/skillset/skills/skill-maker ~/.claude/skills/skill-maker
```

Symlinking rather than copying means `git pull` updates every tool at once.

### Linking everything at once

If you work from a clone, `tools/link-skills.sh` links **every** skill in the repo into both
`~/.claude/skills/` and `~/.agents/skills/`, so a new skill becomes available everywhere with
one command:

```bash
tools/link-skills.sh              # link all skills into all known tool directories
tools/link-skills.sh --dry-run    # preview without changing anything
tools/link-skills.sh --prune      # also clean up links to deleted skills
```

It validates before linking, never overwrites a real file or directory, and is safe to re-run.

### Where each tool looks

| Tool | User-level | Project-level |
| --- | --- | --- |
| Claude Code | `~/.claude/skills/` | `.claude/skills/` |
| Claude (claude.ai, Cowork) | Upload via **Customize** in the sidebar | — |
| Codex / ChatGPT | `~/.agents/skills/` | `.agents/skills/` |
| Cursor | `~/.agents/skills/`, `~/.cursor/skills/` | `.agents/skills/`, `.cursor/skills/` |
| VS Code / Copilot | `~/.agents/skills/`, `~/.copilot/skills/` | `.agents/skills/`, `.github/skills/` |
| Gemini CLI | `~/.agents/skills/`, `~/.gemini/skills/` | `.agents/skills/`, `.gemini/skills/` |

Cursor and Copilot also read the Claude directories for compatibility. Paths above are from
each vendor's own documentation; for other compatible tools, see the
[client list](https://agentskills.io/clients).

## How this repo is organised

```
skills/<name>/
├── SKILL.md      # instructions — written for the agent
├── README.md     # rationale — written for a human
├── references/   # detail loaded only when needed
├── assets/       # templates and data
└── evals/        # trigger test cases (not shipped to users)
```

`SKILL.md` and `README.md` exist separately on purpose: the agent loads `SKILL.md` in full every
time the skill fires, so every word costs context, while `README.md` is never loaded and can
explain the reasoning at length. See [`AGENTS.md`](AGENTS.md) for the full conventions.

## Validating

```bash
python3 -m venv .venv && .venv/bin/pip install pyyaml   # once
tools/validate.sh
```

This runs the same checks that gate uploads to claude.ai, so anything that passes here is
accepted there. CI runs it on every push.

## Licence

MIT — see [LICENSE](LICENSE). Use them, fork them, adapt them.

`tools/quick_validate.py` is vendored from [anthropics/skills](https://github.com/anthropics/skills)
under Apache-2.0; its licence is included at `tools/LICENSE-quick_validate.txt`.

## Author

Leandro Costa — product designer. [github.com/leo-scosta](https://github.com/leo-scosta)
