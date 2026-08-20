---
name: web-design
description: Run a full web-design pass on a page or section — typography, colour, components, motion, and accessibility — using open-source fonts (Google Fonts, Fontshare, Fontsource) and inspiration from Awwwards, CollectUI, Framer, and Webflow, plus motion libraries like GSAP, Motion, Three.js, and Lenis. Use when the user asks to redesign a section, make a site look award-winning, pick fonts or colours, add scroll or hover effects, review the visual design, or work from a reference image, video, or link. Respects existing design tokens; every motion suggestion pairs with a reduced-motion fallback and a lighter alternative; every text/background pair is checked against WCAG AA and pushed to AAA where cheap.
license: MIT
metadata:
  author: leandro-costa
  version: "1.0"
  repository: skillset
---

# Web Design

Runs a structured design pass on a website page or section — the way a senior
product designer would: not one big rewrite, but five smaller decisions taken
in order (typography, colour, components, motion, accessibility) with the
existing design system as a hard constraint.

Works with or without a reference. If the user shares an image, video, link, or
description, it becomes the aesthetic target. If not, the current page becomes
its own baseline and the pass polishes what's there.

Output is a written review plus concrete changes, not applied edits. The user
(or a follow-up turn) applies them. This keeps the skill portable across
projects with very different toolchains.

## Process

### 1. Read the target

Identify what to redesign. The target can be:

- a URL → fetch with `WebFetch`
- a file path → `Read` it
- a screenshot / video → describe from the image
- a section named in prose → ask the user which file it maps to

Extract, in one pass: the current type stack, the current colour tokens or
values, the layout primitives (grid, container widths, spacing rhythm), any
motion already in place. Do not propose changes yet.

### 2. Read the design system

If the project has any of these, load them and treat them as constraints:

- a `DESIGN.md` at repo root
- a tokens file (`tokens.css`, `_variables.scss`, `theme.ts`, Tailwind
  `@theme` block, Figma tokens JSON)
- a styleguide route (e.g. `/styleguide`)
- a component library or design system doc

Rules that apply everywhere until proven otherwise:

- **Add tokens, do not rename them.** Renaming a token in a Tailwind v4 project
  breaks every generated utility. Renaming in most other systems means editing
  every consumer. Additions are safe; renames are not.
- **Respect the existing scale.** If the type scale steps at 1.25×, don't add
  a step at 1.15×.
- **Keep the styleguide honest.** Any new token, size, or component pattern
  should be shown on the styleguide page if one exists.

If nothing exists, propose a starter token set as part of the output.

### 3. Reference intake

If the user shared a reference:

- **Image or video** → describe the aesthetic in five to seven concrete traits
  (colour temperature, contrast level, type style, motion density, layout
  rhythm, image treatment, decorative elements). Name the traits before
  proposing anything — this makes the pass reviewable.
- **URL** → fetch and read; if fetching fails (JS-heavy site), fall back to
  describing from the user's description or a screenshot.
- **Named inspiration** ("make it feel like Kage") → open
  `references/voices.md` and, if the named voice isn't in there yet, ask the
  user to describe it in two or three traits, then propose adding it to the
  file at the end.

If nothing was shared, skip this step and treat the current page as the
baseline to polish.

### 4. Typography pass

Open `references/typography.md`.

Constraint: **open-source fonts only.** Google Fonts, Fontshare, and Fontsource
are the allowed sources — no paid or restricted-licence families, no matter
how well they'd fit. If a paid family would clearly be right, name it once in
*Open questions* so the user can decide, but do not put it in the change list.

Propose:

- **Display / heading family + body family** as a pairing. Justify the pairing
  in one sentence (contrast, tone, era, x-height compatibility).
- **Type scale** — the display size, title size, body size, small, xs. If a
  scale already exists, either respect it or propose a considered replacement.
- **Line height and tracking** per size.
- **Weight subset actually needed** — every added weight is bytes.

Verify body copy hits **WCAG AA (4.5:1) on the intended background**, and note
where AAA (7:1) is cheap to reach without hurting the design.

### 5. Colour pass

Open `references/color.md`.

Propose:

- A palette of 5–8 tokens: `bg`, `surface`, `border`, `ink`, `ink-soft`,
  `ink-faint`, `accent` (and any second accent). Match the target project's
  token naming convention.
- The harmony rule you used (monochrome, analogous, complementary, triadic,
  split-complementary) in one line. Cite `references/color.md` for the
  tool you'd reach for (Adobe Color, Coolors, Realtime Colors, Huemint).
- A contrast matrix: every text token against every background token, with
  the ratio and pass/fail against WCAG AA. Push to AAA where cheap.

If deriving from a reference image, name the extraction approach (Adobe Color
"Extract Theme from Image", or the eyedropper-plus-adjust flow described in
`references/color.md`).

### 6. Component & layout pass

Open `references/inspiration.md` for source guidance.

For each meaningful component in the target (hero, card, nav, form, footer,
etc.):

- Note the current pattern in one line.
- Propose the change and cite the pattern source
  (Awwwards site, CollectUI daily entry, Framer template, Webflow showcase,
  Godly, Land-book). Extract the *idea*, not the artefact — never propose
  copying a specific site's layout wholesale.
- Give a one-line rationale tied to the reference aesthetic from step 3.

Layout primitives to consider: container width, column grid, vertical rhythm,
whitespace ratio, edge treatment (full-bleed vs. inset), image-to-text ratio.

### 7. Motion & effects pass

Open `references/motion.md`.

For each motion recommendation, three things are non-negotiable:

1. **Cost.** Name the library, its approximate bundle size, and whether it's
   already installed in the target project. If it's net-new, say so plainly.
2. **A `prefers-reduced-motion` fallback.** Every recommendation includes
   what the reduced-motion version does (usually: skip animation, keep the
   end state).
3. **A lighter alternative.** For every heavy recommendation (Three.js,
   GSAP with ScrollTrigger, Lenis) offer one CSS-only, View-Transitions-API,
   or smaller-lib version. The user picks.

Order recommendations by cost, lightest first.

### 8. Accessibility check

Open `references/accessibility.md`.

Run the whole pass through:

- **Contrast** — every text/background pair, WCAG AA (4.5:1 body, 3:1 large),
  push to AAA (7:1 / 4.5:1) where cheap.
- **`:focus-visible`** — every interactive element has a visible focus state
  that isn't only colour.
- **`prefers-reduced-motion`** — respected by every animation.
- **Keyboard order** — tab order matches visual order.
- **Tap target ≥ 44×44 px** on touch surfaces.

Failures are **blockers** in the change list, not nits. A design that fails AA
does not get called award-winning.

### 9. Output

Use `assets/review-template.md` for the output shape. Fill every section, in
this order:

1. **Intent** — one sentence naming the aesthetic target.
2. **Baseline** — five bullets on what's there now.
3. **Findings** — per stage (typography, colour, components, motion, a11y).
4. **Change list** — prioritised (blockers → high → medium → low), each with
   file/token references where the project structure is known.
5. **Snippets** — copy-pasteable CSS / tokens / component code, only where
   short enough to be useful.
6. **Open questions** — anything the user needs to decide before applying.

## Always-on rules

- **Open-source fonts only** in the change list. Paid families can only appear
  in *Open questions*.
- **No token renames.** Additions only. Never propose renaming a design token.
- **Every motion suggestion carries a reduced-motion fallback and a lighter
  alternative.** No exceptions, even for a fade-in.
- **Every text/background pair is contrast-checked.** WCAG AA minimum; push
  to AAA where the palette absorbs it.
- **Cite the source of an inspiration reference.** Awwwards site, CollectUI
  entry, Framer template — name it. Never claim credit for a pattern that
  came from elsewhere.
- **Extract the pattern, don't clone the artefact.** No one-to-one copies of
  another site's hero, navigation, or layout.
- **One primary accent.** Second accents exist, but must not fight the first
  for attention.
- **Respect the styleguide route.** Any change should be showable on it if
  one exists.

## Edge cases

- **User asks for a full redesign, not a pass.** Same process, but state up
  front that this is a redesign and that stages 4–6 will propose replacement,
  not refinement. Confirm scope before writing snippets.
- **No design system exists.** Propose a starter token set (colour, type,
  radius, spacing, elevation) in stage 2 output, then run the rest of the
  pass against it.
- **Project uses Tailwind v4 with `@theme`.** Token names generate utilities
  (`--color-ink` → `bg-ink`). Renames are hard-forbidden here, additions are
  fine. Reference the token, not the utility, in the change list.
- **Reference is a whole competitor site.** Distil it into the five-to-seven
  traits from step 3. Do not propose porting the site's layout wholesale.
- **User wants motion but has no libraries installed.** Lead the motion pass
  with the CSS-only / View-Transitions version, then offer the library
  version as the upgrade path with the size cost stated.
- **User asks to make it "more modern".** Ask once what "modern" means to
  them — dense typographic editorial, big playful WebGL, brutalist raw,
  glassy Apple-ish, terminal-serif Vercel-ish. Different answers point to
  different fonts, palettes, and motion vocabularies.

## Checks before finishing

- Every stage of the review template has content, or is explicitly marked
  *not applicable*.
- No paid or restricted-licence font appears in the change list.
- No token rename appears in the change list.
- Contrast matrix is present in the colour section, with actual ratios.
- Every motion recommendation lists: library + size + install status +
  reduced-motion fallback + lighter alternative.
- Every inspiration citation names a specific source, not "sites like this".
- Change list is ordered blockers first.
- If the target project has a `DESIGN.md`, the pass does not violate any
  rule in it.
