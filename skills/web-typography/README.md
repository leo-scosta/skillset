# web-typography

Picks and refines web typography — display + body pairing, modular scale,
line height and tracking, weight subsetting, WCAG-AA body contrast — using
open-source families only (Google Fonts, Fontshare, Fontsource).

## The problem

Asking an AI to "pick fonts" tends to produce one of two failures: a paid
family from Klim / GT / Commercial Type that the user then can't ship, or
a vague pairing ("Inter for body, something serif for display") with no
scale, no weights, no rhythm, and no contrast check. Typography is a
craft with concrete decisions — pairing, ratio, tracking, weight subset —
and each one needs a defensible answer.

## The approach

One skill covering only the typography stage. The body of `SKILL.md`
walks through pairing → scale → rhythm → weights → accessibility → loading
in order, with an on-demand `references/typography.md` carrying the deeper
material (approved sources, pairing heuristics, scale ratios, line-height
tables, loading patterns).

Opinionated on purpose:

- **Open-source fonts only** in the change list. Paid families can only
  appear in *Open questions* for the user to decide.
- **Every pairing is justified** in one sentence — contrast, tone, era,
  or x-height compatibility.
- **Scale names a ratio** — 1.125, 1.200, 1.250, 1.333, 1.414 — not
  "some sizes that look right".
- **Weight subset is defended** — every added weight is bytes, so every
  one has to earn its place.
- **Body contrast is checked** against its intended background, WCAG AA
  minimum, AAA where cheap.

Output is a written proposal plus a token / CSS snippet, not applied edits
— the skill proposes, the user (or a follow-up turn) applies. This keeps
it portable across projects with very different toolchains.

## Rejected alternatives

**Folding this back into a single `web-design` skill.** Tried that first;
the umbrella description had to cover typography, colour, motion,
components, and accessibility, which weakened the typography-specific
triggers ("pick fonts", "font pairing", "type scale"). Splitting was the
whole point of the refactor.

**A script that picks fonts programmatically.** Rejected because the
value here is taste and judgement — matching a reference aesthetic to
an open-source family the user can actually ship. A rules-based picker
would either be too rigid or produce the same three defaults every time.

## Known limits

- **Proposes, doesn't apply.** Returns a change list and snippets; doesn't
  edit files or open PRs. Deliberate — makes the skill portable.
- **Open-source landscape only.** For strictly display-driven work where
  a paid family is the right answer, the best the skill can do is flag it
  in *Open questions* and propose the closest OFL neighbour.
- **No font-metric analysis.** Doesn't compute x-height ratios or optical
  weight compatibility numerically — pairing rationale is heuristic.
- **Reads what it's given.** No access to Figma / Sketch / Framer APIs;
  works from files, URLs, screenshots, or the user's description.
