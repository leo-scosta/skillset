# web-components

Proposes component patterns and layout structure for a web page — hero,
nav, card, form, footer, plus container / grid / rhythm / whitespace /
edge treatment — with every idea cited to a named source and, where the
user names one, translated through an aesthetic voice from `voices.md`.

## The problem

Asking an AI to "redesign my hero" tends to produce either a copy of
someone else's site or a shapeless "make it more modern" that doesn't
converge. Component work needs two things at once: a *pattern source*
that the proposal traces back to (so it's specific and defensible), and
an *aesthetic voice* that ties the components together (so the page
reads as one design, not a collection of pieces).

## The approach

One skill covering only the components + layout stage. The body of
`SKILL.md` walks through target read → design-system read → reference
intake and voice → per-component pattern + citation → layout primitives.

Two on-demand references carry the depth:

- **`references/inspiration.md`** — named sources per surface. Awwwards,
  Godly, Land-book, SiteInspire, httpster, Minimal Gallery for whole
  sites. CollectUI, Mobbin, Pageflows, UI Sources for individual
  components. Framer Templates, Webflow Showcase, Cofolios for template
  and portfolio work. Codrops, hover.dev for interaction. Typewolf and
  Fonts In Use for type in the wild. Klart and Cohesive Colors for
  colour in the wild.
- **`references/voices.md`** — a small library of named aesthetic
  reference points (Kage, Towers, Sketchbook to start), each with three
  to five transferable traits and a note on when to reach for it. Grows
  when the user names a new voice.

Opinionated on purpose:

- **Every citation names the specific entry.** "Awwwards · Locomotive
  Berlin" — never just "Awwwards".
- **Extract the pattern, don't clone the artefact.** No one-to-one
  copies of another site's hero or layout.
- **Layout primitives are addressed explicitly** — container, grid,
  rhythm, whitespace, edge treatment — even when the answer is "keep
  as-is".
- **When the reference is a competitor**, distil traits and cite a
  *different* source that hits the same traits. Prevents accidental
  cloning.
- **No token renames.** Additions only.

## Rejected alternatives

**Folding this back into a single `web-design` skill.** Tried that first
— the umbrella had to cover typography, colour, motion, components, and
accessibility, and the components-specific triggers ("redesign my hero",
"make it feel like Kage", "inspiration for a portfolio nav") lost signal.

**Splitting `voices.md` out into its own skill.** Considered, but it's
mainly a vocabulary for the components pass — the sibling skills
(`web-typography`, `web-color`, `web-motion`) reference aesthetic voice
as an inline concept without needing the file. Keeping it here avoids
a small, low-triggering third skill.

**A design-system generator.** Rejected because the value here is
translating a reference aesthetic into concrete component decisions in
the *user's own project* — not producing a generic component library.

## Known limits

- **Proposes, doesn't apply.** Returns a change list and citations;
  doesn't edit files or open PRs.
- **`voices.md` starts small.** Seeded with the Mengto repos (Kage,
  Towers, Sketchbook); grows when the user names a new voice.
- **No access to Figma / Framer APIs.** Can't inspect layouts at the
  layer level — works from files, URLs, screenshots, or descriptions.
- **Citations are one moment in time.** An Awwwards entry or Framer
  template may be updated or removed; the pattern extracted from it
  stays valid.
