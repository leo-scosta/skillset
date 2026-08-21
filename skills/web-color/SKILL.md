---
name: web-color
description: Propose or audit a web colour palette like a senior designer — a 5–8 role-token palette (bg, surface, border, ink, ink-soft, ink-faint, accent), a stated harmony rule (monochrome, analogous, complementary, triadic, split-complementary), a citation of the palette tool (Adobe Color, Coolors, Realtime Colors, Huemint), a full text/background contrast matrix, and a dark-mode pass. Use when the user asks to pick a palette, propose colours, extract a scheme from a reference image, audit contrast, choose an accent colour, or work on dark mode. WCAG AA minimum on every text/background pair; push to AAA where cheap; no token renames.
license: MIT
metadata:
  author: leandro-costa
  version: "1.0"
  repository: skillset
---

# Web Colour

Runs the colour stage of a design pass on a website page or section: a
role-token palette, a stated harmony rule, a tool citation, a full
contrast matrix, and a dark-mode pass — with the existing design system
as a hard constraint.

Output is a written proposal plus a token block and matrix, not applied
edits.

## Process

### 1. Read the target

Identify what to redesign. The target can be:

- a URL → fetch with `WebFetch`
- a file path → `Read` it
- a screenshot / reference image → describe from the image; the extract
  flow in `references/color.md` is the standard move here
- a section named in prose → ask the user which file it maps to

Extract, in one pass: the current colour tokens or hex values, how many
distinct roles they cover, and whether dark mode is in play. Do not
propose changes yet.

### 2. Read the design system

If the project has any of these, load them and treat them as constraints:

- a `DESIGN.md` at repo root
- a tokens file (`tokens.css`, `_variables.scss`, `theme.ts`, Tailwind
  `@theme` block, Figma tokens JSON)
- a styleguide route (e.g. `/styleguide`)

Rules that apply everywhere until proven otherwise:

- **Add tokens, do not rename them.** Renames break every consumer.
- **Match the existing naming convention** — `--color-*`, `$color-*`,
  `theme.colors.*`.
- **Keep the styleguide honest.** New tokens should appear on it.

If nothing exists, propose a starter token set (5–8 roles) as part of the
output.

### 3. Reference intake

If the user shared a reference:

- **Image** → run the extract flow in `references/color.md` step "Building
  a palette from a reference image". Identify the darkest, lightest, and
  most saturated pixel as anchors for `ink`, `bg`, and `accent`.
- **URL / screenshot** → describe the palette in one to two sentences
  (temperature, saturation, contrast level).
- **Named aesthetic** ("Kage-adjacent", "brutalist") → describe the
  palette that fits.

If nothing was shared, treat the current page as the baseline to polish.

### 4. Palette proposal

Open `references/color.md`.

Propose:

- A palette of **5–8 role tokens**: `bg`, `surface`, `border`, `ink`,
  `ink-soft`, `ink-faint`, `accent` (and optionally `accent-2`). Match
  the target project's naming.
- The **harmony rule** used (monochrome, analogous, complementary,
  triadic, split-complementary) in one line.
- The **tool** you'd reach for (Adobe Color, Coolors, Realtime Colors,
  Huemint) with a one-line reason.

### 5. Contrast matrix (required)

Include every text token against every background token, with the actual
ratio and its verdict:

```
              bg          surface     border
ink           [ratio AAA] [ratio AAA] —
ink-soft      [ratio AA]  [ratio AA]  —
ink-faint     [ratio AA*] [ratio ✗]  —
accent        [ratio AA]  [ratio ✗]  —
```

`AA*` means AA-large only (≥ 18px regular or 14px bold). `✗` is a
blocker and must appear in the change list.

### 6. Dark mode

If the project supports dark mode (or if the user asks for it), mirror the
role tokens in a dark variant. Don't invent new roles. Cover the traps
in `references/color.md`:

- Never pure `#000` on `#fff`.
- Desaturate accents that were fine on light bg.
- Note any image / screenshot asset that would need a dark-mode variant.

### 7. Output

Use `assets/review-template.md` for the output shape.

## Always-on rules

- **No token renames.** Additions only.
- **WCAG AA minimum** on every text/background pair. Push to AAA where
  cheap.
- **One primary accent.** Second accents exist but must not fight the
  first for attention.
- **State the harmony rule.** Mixing rules produces noise.
- **Cite the tool** you'd reach for (Adobe Color, Coolors, Realtime
  Colors, Huemint) — adds credibility.
- **Match the project's token naming convention.** Never introduce a
  competing one.

## Edge cases

- **User asks for a full palette from scratch.** Same process, state up
  front that this is a replacement palette, not refinement. Confirm scope
  before writing tokens.
- **No design system exists.** Propose a starter token set (5–8 roles).
- **Tailwind v4 with `@theme`.** Colour tokens generate utilities
  (`--color-ink` → `bg-ink`, `text-ink`). Renames hard-forbidden;
  additions fine. Reference the token, not the utility.
- **Reference image has 20+ colours** (a photo). Distil to the 5–8 roles;
  don't try to represent every pixel.
- **Placeholder text below 3:1.** Common blocker; upgrade to `ink-soft`
  minimum, never `ink-faint`.
- **Accent-on-accent buttons.** If the accent is mid-value, the button
  label needs to be pure white or pure black, not "accent-ink".

## Checks before finishing

- Palette is 5–8 role tokens, not a colour dump.
- Harmony rule is named.
- Palette-tool citation is present.
- Contrast matrix has actual ratios, not "should be fine".
- Every failing pair appears in the change list as a blocker.
- If dark mode is in play, dark-variant tokens are proposed.
- No token rename appears in the change list.
