---
name: web-typography
description: Pick and refine web typography like a senior designer — display + body pairing from open-source sources (Google Fonts, Fontshare, Fontsource), a modular type scale, line height and tracking per size, weight subsetting, and a WCAG contrast check on body copy. Use when the user asks to pick fonts, propose a font pairing, set up a type scale, choose a display or body typeface, improve line height / tracking, or make their typography feel more editorial, technical, playful, brutalist, or classical. Open-source only in the change list; paid families can only appear in Open questions for the user to decide.
license: MIT
metadata:
  author: leandro-costa
  version: "1.0"
  repository: skillset
---

# Web Typography

Runs the typography stage of a design pass on a website page or section, the
way a senior designer would: not one big rewrite, but concrete choices about
pairing, scale, rhythm, weight, and legibility, with the existing design
system as a hard constraint.

Output is a written proposal plus a token / CSS snippet, not applied edits.
The user (or a follow-up turn) applies them.

## Process

### 1. Read the target

Identify what to redesign. The target can be:

- a URL → fetch with `WebFetch`
- a file path → `Read` it
- a screenshot / video → describe from the image
- a section named in prose → ask the user which file it maps to

Extract, in one pass: the current type stack (display + body families,
weights loaded, source), the current type scale steps, current line height
and tracking. Do not propose changes yet.

### 2. Read the design system

If the project has any of these, load them and treat them as constraints:

- a `DESIGN.md` at repo root
- a tokens file (`tokens.css`, `_variables.scss`, `theme.ts`, Tailwind
  `@theme` block, Figma tokens JSON)
- a styleguide route (e.g. `/styleguide`)

Rules that apply everywhere until proven otherwise:

- **Add tokens, do not rename them.** Renames break every consumer.
- **Respect the existing scale.** If the type scale steps at 1.25×, don't
  add a step at 1.15×.
- **Keep the styleguide honest.** Any new type token should be shown on
  the styleguide page if one exists.

If nothing exists, propose a starter type-token set as part of the output.

### 3. Reference intake

If the user shared a reference (image, video, URL, or a named aesthetic
like "make it feel like Kage"), name the aesthetic direction in one to two
sentences: type category (humanist sans / geometric sans / transitional
serif / display serif / mono / brutalist), weight vocabulary (light and
airy vs. heavy display), and rhythm (dense editorial vs. generous marketing).
This becomes the target the pairing has to hit.

**Then read the reference for measurable details, not just adjectives.**
Adjectives ("wide", "heavy", "condensed") describe the target; measurements
match it. Before proposing anything, name each of these from the image:

- **Case** — caps, sentence case, or mixed? A caps reference reads very
  differently from its mixed-case equivalent; do not copy the *font*
  without noticing the *case*.
- **Tracking** — reference letters almost touching means negative tracking
  (-0.03 to -0.05em on heavy display); airy references sit near 0 or
  positive. Eyeball the gaps between letters and estimate an em value.
- **Weight** — count stroke thickness against the counter (the hole inside
  `o` / `e`). A stroke as wide as the counter is ~900; half as wide is ~400.
- **Width** — standard cut or extended? Compare an `H` — square-ish is
  standard; obviously wider than tall means a wide axis is in play
  (Anybody, Archivo Narrow, etc.).
- **Extenders** — tall ascenders/descenders (Boldonse, Fraunces) force
  looser line-height; short extenders (Archivo Black, Space Grotesk) sit
  comfortably tight.

Skipping this step is how you recommend the right *family* with the wrong
*rendering* — the user has to tell you the letters are too spaced, or too
airy, or the reference was uppercase all along.

If nothing was shared, treat the current page as the baseline to polish.

### 4. Pairing + scale

Open `references/typography.md`.

Constraint: **open-source fonts only.** Google Fonts, Fontshare, and
Fontsource are the allowed sources. If a paid family would clearly be right,
name it once in *Open questions* so the user can decide, but do not put it
in the change list.

Propose:

- **Display / heading family + body family** as a pairing. Justify the
  pairing in one sentence (contrast, tone, era, x-height compatibility).
- **Type scale** — display, title, body, small, xs. Name the ratio.
- **Line height and tracking** per size, per the table in the reference.
- **Weight subset actually needed** — every added weight is bytes.

### 5. Accessibility floor

Verify body copy hits **WCAG AA (4.5:1)** on its intended background, and
note where AAA (7:1) is cheap. Never load 100/200 weights for body text.
Minimum body size 16px; 15px is a red flag, 14px a blocker for anything
longer than a caption. Cap line length at ~75 characters; long-form
prefers ~66.

### 6. Loading

Recommend `.woff2`, variable fonts where available, `font-display: swap`,
preload for display + body regular, and Latin subset by default. Prefer
self-hosting via Fontsource or `google-webfonts-helper` over the runtime
Google Fonts request.

### 7. Output

Use `assets/review-template.md` for the output shape.

## Always-on rules

- **Open-source fonts only** in the change list. Paid families can only
  appear in *Open questions*.
- **No token renames.** Additions only.
- **WCAG AA minimum on body copy.** Push to AAA where cheap.
- **Weights are bytes.** Justify every weight you add.
- **No `text-align: justify`** on the web without hyphenation control.
- **No all-caps** for anything longer than a label.

## Edge cases

- **User asks for a full redesign, not a pass.** Same process, state up
  front that this is a replacement pairing, not refinement.
- **No design system exists.** Propose a starter type-token set (families,
  scale ratio, sizes, line heights, weights) then the rest of the pass
  against it.
- **Tailwind v4 with `@theme`.** Type tokens generate utilities
  (`--font-display` → `font-display`). Renames are hard-forbidden;
  additions are fine. Reference the token, not the utility.
- **Reference calls for a paid family (Klim, GT, Söhne).** Propose the
  closest open-source neighbour in the change list (Space Grotesk for
  Söhne-adjacent, Fraunces for GT Alpina-adjacent) and put the paid pick
  in *Open questions*.
- **Mono is a third family.** Only when the site actually shows code —
  otherwise it's decoration.

## Checks before finishing

- Pairing is justified in one sentence.
- Scale names the ratio.
- Weight subset is listed with a reason.
- Body copy contrast ratio is stated with its background.
- No paid or restricted-licence font appears in the change list.
- No token rename appears in the change list.
- If a reference was supplied, **case, tracking, weight, width, and
  extenders were named as measurements**, not just adjectives — and the
  proposal matches each one, not only the family category.
