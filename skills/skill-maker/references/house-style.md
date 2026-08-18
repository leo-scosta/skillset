# House style

Conventions specific to this repository, on top of the spec rules.

## The two-file rule

Every skill folder contains both `SKILL.md` and `README.md`. They are written for different
readers and must not be merged.

| | `SKILL.md` | `README.md` |
| --- | --- | --- |
| Reader | The AI agent | A human browsing the repo |
| Loaded into context | Yes, in full, on every activation | Never |
| Contains | Instructions, steps, constraints | Why it exists, decisions, trade-offs |
| Cost of extra words | Real — consumes context every use | Zero |

So: no rationale, no history, no screenshots in `SKILL.md`. And no step-by-step instructions
in `README.md` — it should explain the thinking, not repeat the procedure.

This split is what lets the repo work as a portfolio without making the skills worse. Someone
evaluating your judgement reads the READMEs; the agent reads the SKILL.mds; neither pays for
the other.

A good `README.md` covers:

- The problem, in one or two sentences. What was tedious or unreliable before this existed.
- The approach, and one alternative you rejected with the reason.
- Known limits — where it does not work well.

## Writing the description

The `description` is the highest-leverage field in a skill. It is the **only** part loaded at
startup, across every tool. It alone decides whether the skill is ever considered. A perfect
body attached to a vague description never runs.

Structure it as: *what it does* → *when to use it* → *the phrasings that should trigger it*.

Weak:

```yaml
description: Helps with design reviews.
```

Strong:

```yaml
description: Reviews UI mockups and design specs against accessibility and consistency
  heuristics, producing a prioritised issue list. Use when the user shares a design,
  mockup, Figma export, or screenshot and asks for feedback, a critique, a design review,
  or an accessibility check.
```

The second one names the artefacts and the verbs a user would actually type. That is what
matching keys off.

Two failure modes to avoid:

- **Too narrow** — it only fires on the exact phrasing you imagined, and is silent otherwise.
- **Too broad** — it fires on unrelated requests and degrades them. Worse than too narrow,
  because the cost lands on work the skill was never meant to touch.

## Evals

Every skill gets `evals/evals.json` with the trigger phrases collected during the interview,
including **negative** cases the skill must stay out of.

These are versioned in the repo but excluded from the packaged artifact, so they cost users
nothing. They exist to make triggering behaviour checkable rather than assumed — which is
also the most credible thing in the repo to anyone assessing the work seriously.

```json
{
  "skill": "example-skill",
  "cases": [
    {"prompt": "review this mockup for accessibility", "should_trigger": true},
    {"prompt": "what's the hex code for our brand blue", "should_trigger": false}
  ]
}
```

## Scope

One skill, one job. When a skill grows a second unrelated responsibility, split it — two
focused descriptions trigger far more reliably than one that tries to cover both.

Before adding a skill, check whether an existing one covers the ground. Two skills with
overlapping descriptions compete, and the model's choice between them becomes a coin flip.

## Versioning

`metadata.version` starts at `"1.0"` and is bumped on meaningful behaviour changes. Quote it —
metadata values must be strings. Record the change in the repo `CHANGELOG.md`.
