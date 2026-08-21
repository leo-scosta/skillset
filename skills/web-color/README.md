# web-color

Proposes or audits a web colour palette — 5–8 role tokens, a stated
harmony rule, a tool citation, a full text/background contrast matrix,
and a dark-mode pass. WCAG AA minimum; AAA where cheap.

## The problem

Asking an AI to "pick colours" tends to produce a rainbow of hex codes
with no roles, no harmony, no contrast check, and a "hope this looks
nice" energy. Real colour work is a small number of decisions taken
carefully: which harmony rule, which anchor values, which roles the
tokens map to, and whether every pair clears WCAG AA. A vibes assessment
without a contrast matrix ships accessibility failures.

## The approach

One skill covering only the colour stage. The body of `SKILL.md` walks
through target read → design-system read → reference intake →
5–8 role-token palette → contrast matrix → dark mode, with an on-demand
`references/color.md` carrying the deeper material (tool table, harmony
rules, role naming, extract-from-image flow, common failures).

Opinionated on purpose:

- **Palette work goes through named tools.** Adobe Color, Coolors,
  Realtime Colors, Huemint — each with a note on what it's good for.
- **Every pair gets a ratio**, not a vibes assessment. Fails are
  blockers, not nits.
- **Roles, not colours.** 5–8 tokens covering `bg`, `surface`, `border`,
  `ink`, `ink-soft`, `ink-faint`, `accent` (and optionally `accent-2`).
- **One primary accent.** A second exists only when the design genuinely
  needs it.
- **Match the project's naming convention.** Never a competing one.
- **No token renames.** Additions only.

Output is a written proposal plus a token block and matrix, not applied
edits.

## Rejected alternatives

**Folding this back into a single `web-design` skill.** Tried that first
— the umbrella had to cover typography, colour, motion, components, and
accessibility, and the colour-specific triggers ("pick a palette",
"audit contrast", "extract a scheme from this image") lost signal in the
mix. Splitting is the whole point of the refactor.

**A palette-generator script.** Rejected because Adobe Color, Coolors,
Realtime Colors, and Huemint already exist and are better at generation
than anything a script here would produce. The value the skill adds is
choosing which tool, applying it against the constraints of the target
system, and verifying every pair against WCAG.

## Known limits

- **Proposes, doesn't apply.** Returns a token block, matrix, and change
  list; doesn't edit files or open PRs.
- **Sees what it's given.** No screen-picker or eyedropper — for an image
  reference, works from the image the user provides.
- **APCA is noted, not primary.** WCAG 2.x ratios are the reported number
  because tooling still uses them; APCA appears alongside for edgy pairs.
- **Doesn't render.** Won't preview the palette on a real layout —
  Realtime Colors is cited for that purpose.
