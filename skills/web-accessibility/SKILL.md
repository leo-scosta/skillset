---
name: web-accessibility
description: Run a WCAG 2.2 AA accessibility audit on a web page or section like a senior designer — contrast on every text/background pair, visible :focus-visible states on every interactive element, prefers-reduced-motion respect on every animation, keyboard order that matches reading order, tap targets ≥ 44 × 44 px, screen-reader hygiene (alt, labels, landmarks, heading order), forms with visible labels and announced errors, and colour-never-carries-meaning-alone. Use when the user asks for an accessibility audit, a WCAG AA check, a contrast audit, a focus-state review, a keyboard-navigation review, a reduced-motion audit, or a form-accessibility review. Failures are blockers, not nits. Push to AAA where cheap.
license: MIT
metadata:
  author: leandro-costa
  version: "1.0"
  repository: skillset
---

# Web Accessibility

Runs the accessibility stage of a design pass on a website page or
section. Standard: **WCAG 2.2 AA everywhere; push to AAA where cheap.**
Every failure appears in the change list as a blocker, not a suggestion.

Output is a written audit plus a prioritised change list, not applied
edits.

## Process

### 1. Read the target

Identify what to audit. The target can be:

- a URL → fetch with `WebFetch`
- a file path → `Read` it
- a screenshot → describe from the image
- a section named in prose → ask the user which file it maps to

Extract, in one pass: the current colour tokens or values, the current
interactive elements (buttons, links, form inputs, custom controls), any
motion in play, and any explicit accessibility posture in `DESIGN.md`
or similar. Do not propose changes yet.

### 2. Read the design system

If the project has any of these, load them:

- a `DESIGN.md` at repo root — often codifies the accessibility posture
- a tokens file (`tokens.css`, `_variables.scss`, `theme.ts`, Tailwind
  `@theme` block)
- a styleguide route

Rules that apply everywhere until proven otherwise:

- **Add tokens, do not rename them.** Renames break every consumer.
- **Respect the existing token vocabulary.** If a fix needs a new colour
  or focus token, add a sibling; never rename.

### 3. Contrast

Open `references/accessibility.md` for the full checklist.

For every text/background pair on the target, check:

- **Body text: 4.5:1** minimum. AAA is 7:1.
- **Large text: 3:1** minimum (≥ 18px regular, ≥ 14px bold). AAA is 4.5:1.
- **Non-text UI** (icons, borders, focus rings): **3:1** minimum against
  adjacent colour.
- **Placeholder text** counts as body text — 4.5:1.

Report as a matrix with actual ratios. Failures → blockers.

### 4. Focus states

Every interactive element (button, link, input, custom control) needs a
visible **`:focus-visible`** state that isn't colour alone. Either:

- A 2–3px outline offset from the element, meeting 3:1 non-text
  contrast on both possible backgrounds; or
- A background-colour shift that also meets 3:1.

Never `outline: none` without a replacement. Prefer `:focus-visible` over
`:focus`.

### 5. Motion

Every animation respects **`prefers-reduced-motion`**. Two levels:

1. **Baseline** — global block shortens animations to 0.01ms.
2. **Considered** — hero animations ship a hand-crafted reduced-motion
   variant that shows the end state immediately.

Additional vestibular checks: no large parallax, no auto-carousels
without pause, nothing flashes more than 3 times per second, no large
sudden slide-in on scroll for big elements.

### 6. Keyboard order

Tab order matches visual reading order. Common breaks to check:

- Modals that don't trap focus.
- Custom dropdowns without arrow-key handling.
- Whole-card links with a nested inner link — one, not both.
- `tabindex` values > 0 (anti-pattern; hijacks order).

### 7. Tap targets

Touch surfaces: **minimum 44 × 44 CSS pixels** per target, with **≥ 8px
spacing** between adjacent targets.

### 8. Screen-reader hygiene

Baseline pass:

- Every `<img>` has `alt` (descriptive if meaningful, empty if decorative).
- Every `<input>` has an associated `<label>`.
- Every button says what it does — icon-only buttons need `aria-label`.
- Landmark structure: one `<main>`, `<nav>`, `<header>`, `<footer>`.
- Headings in order (`h1` → `h2` → `h3`, no skipping). One `h1` per page.

### 9. Colour ≠ meaning

Never carry state on colour alone. Red error borders need an icon or
text label. Green success badges need "Success" text or a monochrome
icon. ~8% of men and ~0.5% of women have colour-vision deficiency.

### 10. Forms

- Labels visible, above the input (not placeholder-only).
- Required fields marked with more than colour (`*` + `aria-required`).
- Errors tied to inputs via `aria-describedby`.
- Inline validation via `aria-live="polite"` or `role="alert"`.
- Autocomplete attributes on personal-data fields.

### 11. Output

Use `assets/review-template.md` for the output shape.

## Always-on rules

- **WCAG 2.2 AA is the floor.** Failures are blockers, not suggestions.
- **Push to AAA where cheap.** Palette or motion vocabulary allowing.
- **No token renames.** Additions only.
- **Never `outline: none` without a replacement.**
- **`prefers-reduced-motion` is respected by every animation.**
- **Colour never carries meaning alone.**

## Edge cases

- **Design fails contrast in one spot.** Propose the smallest lightness
  adjustment that clears the ratio; never abandon the pair without
  trying a value shift.
- **Whole-card link + inner link.** Pick one — usually the whole card,
  with the inner "link" being visual only (styled but not `<a>`).
- **Reduced-motion respected globally but a hero animation is
  cinematic.** Recommend a hand-crafted reduced-motion variant, not just
  the global cut.
- **Placeholder-as-label pattern.** Blocker. Recommend visible labels
  above inputs.
- **Icon-only buttons everywhere.** Recommend `aria-label` on each,
  ideally with a hidden or on-hover visible label.
- **Design system codifies its own posture** (e.g. `DESIGN.md` says "no
  token renames"). Reinforce it; don't propose anything that violates
  it.

## Checks before finishing

- Contrast matrix present, with actual ratios.
- Every interactive element has a `:focus-visible` state described.
- Every motion mentioned has its reduced-motion behaviour described.
- Tab order confirmed to match reading order (or flagged where broken).
- Tap targets ≥ 44 × 44 px on touch.
- No colour-only state indication.
- Form labels visible; error-announcement pattern described.
- No token rename in the change list.
- Change list is ordered blockers first.
