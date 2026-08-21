---
name: web-components
description: Propose component patterns and layout structure for a web page like a senior designer — hero, nav, card, form, footer, plus layout primitives (container width, grid, vertical rhythm, whitespace, edge treatment), with every idea cited to a named source (Awwwards, CollectUI, Framer, Webflow, Godly, Land-book) and translated to a named aesthetic voice (Kage, Towers, Sketchbook, or a user-added one). Use when the user asks to redesign a hero or section, propose component patterns, sketch a layout for a pricing / portfolio / landing page, work from an inspiration reference, make a page feel like a named aesthetic voice, or restructure the shape of a section. Extract the pattern, never clone the artefact; cite every source specifically.
license: MIT
metadata:
  author: leandro-costa
  version: "1.0"
  repository: skillset
---

# Web Components & Layout

Runs the component + layout stage of a design pass: what shape does each
meaningful component take, what layout primitives carry them, and which
named source in the inspiration canon inspired the choice. With the
existing design system as a hard constraint.

Output is a written proposal with citations, not applied edits.

## Process

### 1. Read the target

Identify what to redesign. The target can be:

- a URL → fetch with `WebFetch`
- a file path → `Read` it
- a screenshot / video → describe from the image
- a section named in prose → ask the user which file it maps to

Extract, in one pass: the current layout primitives (container width,
column grid, spacing rhythm, edge treatment) and the current pattern
of each meaningful component (hero, nav, cards, forms, footer). Do not
propose changes yet.

### 2. Read the design system

If the project has any of these, load them and treat them as constraints:

- a `DESIGN.md` at repo root
- a tokens file (spacing scale, radius, elevation)
- a styleguide route (e.g. `/styleguide`)
- a component library or Figma library

Rules that apply everywhere until proven otherwise:

- **Add tokens, do not rename them.** Renames break every consumer.
- **Respect the existing spacing scale.** If spacing steps at 4px, don't
  introduce 6px.
- **Keep the styleguide honest.** New component patterns should appear on
  it if one exists.

### 3. Reference intake + voice

If the user shared a reference:

- **Image or video** → describe the aesthetic in five to seven concrete
  traits (colour temperature, contrast level, type style, motion density,
  layout rhythm, image treatment, decorative elements). Name the traits
  before proposing anything.
- **URL** → fetch and read; if fetching fails, fall back to the user's
  description or a screenshot.
- **Named voice** ("make it feel like Kage") → open `references/voices.md`.
  If the voice isn't in there yet, ask the user for two or three traits,
  then propose adding it to the file at the end of the pass.

If nothing was shared, treat the current page as the baseline to polish.

### 4. Component pass

Open `references/inspiration.md` for source guidance.

For each meaningful component in the target (hero, card, nav, form,
footer, section header, testimonial block, pricing table, etc.):

- Note the current pattern in one line.
- Propose the change and **cite the pattern source** specifically —
  Awwwards site X, CollectUI daily N, Framer template "Sable", Webflow
  showcase entry. Never "sites like this" or "modern design trends".
- Give a one-line rationale tied to the reference aesthetic from step 3.

**Rule: extract the pattern, don't clone the artefact.** Isolate the
transferable idea (dense editorial grid, oversized serif on a colour
block, sticky vertical section counter) and apply it with the target's
own content and brand.

### 5. Layout primitives

Consider each primitive explicitly, even if the answer is "keep as-is":

- **Container width** — narrow editorial / standard / full-bleed.
- **Column grid** — 12 / 8 / broken-grid / no grid.
- **Vertical rhythm** — spacing scale and consistency between sections.
- **Whitespace ratio** — dense / airy / mixed per section.
- **Edge treatment** — inset with margin / full-bleed / mixed.
- **Image-to-text ratio** — text-driven / image-driven / mixed.

### 6. Output

Use `assets/review-template.md` for the output shape.

## Always-on rules

- **Cite every inspiration source specifically.** "Awwwards" alone is
  useless — name the entry.
- **Extract the pattern, don't clone the artefact.** No one-to-one copies
  of another site's hero, nav, or layout.
- **No token renames.** Additions only.
- **Respect the existing spacing scale.** Additions only where genuinely
  needed.
- **One primary hero pattern per page.** Second heroes fight the first.
- **When the reference is a competitor**, distil traits and cite a
  *different* source that hits the same traits — never propose porting
  a competitor's layout.

## Edge cases

- **User asks for a full redesign, not a pass.** Same process, state up
  front that this is replacement patterning, not refinement. Confirm scope
  before writing snippets.
- **No design system exists.** Propose a starter spacing scale and
  container widths in the output.
- **User names a voice not in `voices.md`.** Ask for two or three concrete
  traits, propose the transferable ones, and offer to add the voice to
  `references/voices.md` at the end.
- **Reference is a whole competitor site.** Distil the five-to-seven
  traits and cite a different source that hits the same traits.
- **User wants a component pattern but the site has no comparable
  content.** Ask what content the component should carry before proposing
  a shape.

## Checks before finishing

- Every proposed component change names a specific source (site + entry,
  not just the platform).
- No proposal is a one-to-one clone of the cited source.
- Layout primitives are addressed even if the answer is "keep as-is".
- If a named voice was used, the voice appears in `voices.md` or is
  proposed for addition.
- No token rename appears in the change list.
- Change list is ordered blockers first.
