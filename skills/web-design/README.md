# web-design

Runs a structured design pass on a website page or section — typography,
colour, components, motion, accessibility — in that order, with the existing
design system treated as a constraint. Open-source fonts only, WCAG AA
minimum, motion suggestions always paired with a reduced-motion fallback and
a lighter alternative.

## The problem

Asking an AI to "make this look better" tends to produce one of two failures:
a rewrite that violates the existing design system (renaming tokens,
introducing a competing type scale, adding a random third accent colour), or
a vague critique that sounds smart but doesn't converge on a change list.

Real design work isn't one decision, it's five, in a fixed order: pick a type
system, pick a palette, choose component patterns, layer in motion,
accessibility-check the whole thing. Each step is a different craft, uses
different reference material, and needs different guardrails. Collapsing them
into a single "design pass" prompt loses that structure.

## The approach

One skill, but the body of `SKILL.md` runs the five sub-decisions as explicit
stages. Each stage has its own reference file loaded on demand, so the
always-loaded surface stays small and the depth only enters context when a
stage actually runs.

The reference files are opinionated on purpose:

- **Only open-source font sources.** Google Fonts, Fontshare, Fontsource. No
  paid families end up in the change list — they can only appear in the
  *Open questions* section for the user to decide.
- **Palette work goes through named tools.** Adobe Color, Coolors, Realtime
  Colors, Huemint — each with a note on what it's good for. Every text /
  background pair gets a contrast ratio, not a vibes assessment.
- **Inspiration sources are named per surface.** Awwwards for whole sites,
  CollectUI for single components, Framer / Webflow showcases for pattern
  variants, Godly and Land-book as the second tier. Rule: extract the
  pattern, don't clone the artefact.
- **Motion recommendations always cost themselves out.** Bundle size, current
  install status, reduced-motion fallback, and one lighter alternative
  (CSS-only, View Transitions, or a smaller lib). The user picks with the
  full trade-off visible.
- **Accessibility is a gate, not a nit.** Contrast, focus-visible,
  reduced-motion, keyboard order, tap target. Failures block the change list.

The output is a written review plus a prioritised change list, not applied
edits — the skill proposes, the user (or a follow-up turn) applies. This
keeps it portable across projects with very different toolchains and design
systems.

## Rejected alternatives

**A suite of five focused skills** — `typography-system`, `color-system`,
`motion-system`, `design-inspiration`, `contrast-audit`. Cleaner triggering
per topic, but no single entry point for "make this whole section look
award-winning", which is the primary intended use. Also five skills to
maintain up front. Left open: if any stage's trigger surface earns its own
name in practice, extract it.

**A script that computes the design pass programmatically** — a node script
that measures contrast, picks fonts, generates a palette. Rejected because
the value here is taste and judgement across the five stages, not
computation. A skill (prompt + references) matches the task; a script would
be over-engineered and locked to one implementation.

**Folding this into `web-copy`** — copy and visual design are separate
crafts with separate references and separate output shapes. One skill, one
job.

## Known limits

- **Proposes, doesn't apply.** The skill returns a change list and snippets;
  it doesn't edit files or open PRs. Deliberate — makes the skill portable.
- **Sees what it's given.** For a visual reference, the skill works from the
  image / video / URL the user provides. It has no access to a design tool
  API (Figma, Sketch, Framer) and can't inspect a design at the layer level.
- **Font quality is only as good as the open-source landscape.** For
  strictly display-driven work where a paid family is the right answer, the
  best the skill can do is flag it in *Open questions*.
- **Motion recommendations depend on the user's read of the reference.** A
  vague "make it more dynamic" produces a vague motion pass; a reference
  video produces a specific one.
- **`voices.md` starts small.** It seeds with a handful of named aesthetic
  reference points (the Mengto repos: Kage, Towers, Sketchbook); it grows
  when the user names a new voice.
- **No cross-browser or device-matrix testing.** The skill checks the design
  logic; it doesn't run the site.
