# Frontmatter rules

The [Agent Skills](https://agentskills.io) spec allows **exactly six** frontmatter fields.
Anything else is rejected when packaging for claude.ai or the Skills API, and is ignored or
refused by other vendors. Staying inside these six is what makes a skill portable.

| Field | Required | Constraint |
| --- | --- | --- |
| `name` | yes | 1–64 chars. Lowercase `a-z`, digits, hyphens. No leading/trailing hyphen, no `--`. **Must match the directory name.** |
| `description` | yes | 1–1024 chars. Must say what it does *and* when to use it. **No `<` or `>`.** |
| `license` | no | A licence name, or a reference to a bundled licence file. |
| `compatibility` | no | ≤500 chars. Only if the skill needs specific tooling or environment. |
| `metadata` | no | Map of string keys to **string** values. Quote numbers: `version: "1.0"`. |
| `allowed-tools` | no | Space-separated pre-approved tools. Experimental; support varies by vendor. |

## The error you will hit

Using a field outside the six produces a hard failure, not a warning:

```
Unexpected key(s) in SKILL.md frontmatter: argument-hint.
Allowed properties are: allowed-tools, compatibility, description, license, metadata, name
```

Fields that are valid in Claude Code but **not** in the spec, and so must not be used here:
`argument-hint`, `arguments`, `model`, `effort`, `context`, `agent`, `background`, `hooks`,
`paths`, `shell`, `when_to_use`, `disable-model-invocation`, `user-invocable`,
`disallowed-tools`.

## Two rules the published spec page omits

The validator enforces both, so they matter as much as the documented ones:

1. **`description` must not contain angle brackets.** Easy to trip over when writing
   "use when the user says `<topic>`". Use quotes or plain words instead.
2. **Exactly one `SKILL.md` per skill folder.** Nested ones are rejected on upload — only
   Claude Code's filesystem tolerates them. Name supporting docs something else, inside
   `references/`.

## Body rules

The body is plain Markdown with no format restrictions, but portability adds constraints:

- **No tool-specific syntax.** No backtick-bang shell injection, no `$ARGUMENTS` / `$1`
  substitution, no `@file` references. All are harness features, not spec features, and they
  appear as literal noise in tools that do not implement them.
- **Keep it under ~500 lines / ~5k tokens.** The whole body loads when the skill activates.
  Move depth into `references/` files, which load only when actually needed.
- **Relative paths, one level deep.** `references/thing.md`, not `../../shared/thing.md`.

## Directory layout

```
skill-name/
├── SKILL.md          # required
├── scripts/          # optional: executable code
├── references/       # optional: docs loaded on demand
├── assets/           # optional: templates, data
└── ...               # any other files are permitted
```

`evals/` at the skill root is excluded from the packaged artifact, which is why test cases
can live there without shipping to users.
