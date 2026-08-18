# skill-maker

Scaffolds a new skill into this repository, following the conventions the rest of the repo
depends on.

## The problem

Writing a skill by hand goes wrong in predictable, boring ways. The frontmatter picks up a
field that works in one tool and hard-fails in another. The `description` gets written last,
in a hurry, and the skill quietly never triggers. Test cases never get written because nothing
prompts you to write them. And the repo drifts: some skills have a README, some don't; some
are registered in the index, some aren't.

None of these are hard problems. They're just easy to forget, every single time, and the
failures are silent — a skill with a vague description doesn't error, it simply never runs.

## The approach

Encode the checklist as a skill, so the tedious parts are enforced rather than remembered.

The design decision that matters most is **interviewing before drafting**. The natural instinct
is to accept "make me a skill for X" and start writing. That reliably produces a bad
`description`, because the author is guessing at when the skill should fire. So the skill asks
for the phrasings the user would actually type — and, more importantly, the adjacent cases it
should stay *out* of. Those answers feed both the description and the eval file, which means
one conversation produces both artefacts.

The negative cases are the part people skip. A skill that fires too eagerly is worse than one
that fires too rarely, because its cost lands on unrelated work.

## Why not just use `/skill-creator`?

Anthropic's [skill-creator](https://github.com/anthropics/skills/tree/main/skills/skill-creator)
is the better tool for a different job: general authoring plus a real eval harness that measures
triggering accuracy across many runs. It's also Claude-specific, since that harness drives
Claude Code directly.

`skill-maker` does something narrower and more portable. It knows *this repo's* rules — the
two-file split, the evals location, the validator, the index and changelog — and it stays inside
the Agent Skills spec, so it runs in ChatGPT, Cursor, or Copilot as well as Claude. The two
compose: scaffold here, then reach for skill-creator when a skill is worth benchmarking properly.

## Known limits

- **It doesn't measure anything.** It seeds eval cases; it doesn't run them. Judging whether a
  description actually triggers well needs skill-creator's harness or manual testing.
- **The name sits close to `skill-creator`.** Maker and creator are synonyms, so with both
  installed there's some chance a model reaches for the wrong one. The descriptions are written
  to disambiguate, but it's a real trade-off accepted for the sake of a name that reads well.
- **Spec compliance is checked; quality isn't.** The validator confirms the frontmatter is
  legal. It has no opinion on whether the instructions are any good.
