# Accessibility audit template

Fill every section. Mark a section *not applicable* with a one-line reason
rather than leaving it empty.

---

## Intent

One sentence naming what was audited (page, section, component) and
against what standard.

_Example: **WCAG 2.2 AA audit of the homepage — contrast, focus, motion,
keyboard, tap target, screen-reader structure, forms. AAA pushed on
body copy where the palette allows.**_

## Contrast matrix (required)

```
              bg          surface     border
ink           [ratio AAA] [ratio AAA] —
ink-soft      [ratio AA]  [ratio AA]  —
ink-faint     [ratio AA*] [ratio ✗]  —
accent        [ratio AA]  [ratio ✗]  —
```

`AA*` = AA-large only (≥ 18px regular / 14px bold). `✗` = blocker.

Also check:

- Placeholder text — 4.5:1 minimum.
- Non-text UI (icons, form borders, focus rings) — 3:1 minimum.

## Focus states

Per interactive element:

- **Buttons** — [ring / bg shift / other] · [3:1 contrast met? y / n].
- **Links** — [ring / underline / other] · [y / n].
- **Inputs** — [ring / border shift / other] · [y / n].
- **Custom controls** — [pattern] · [y / n].

Any `outline: none` without a replacement → blocker.

## Motion + `prefers-reduced-motion`

- **Baseline reduced-motion block** — [present / missing].
- **Per-animation** — [animation A: reduced behaviour / animation B: …].
- **Vestibular checks** — no large parallax, no unpaused auto-carousels,
  no >3Hz flashing, no large sudden slide-ins.

## Keyboard order

- Tab order — [matches reading order / breaks at: …].
- Focus trap in modals — [present / missing].
- Arrow-key handling on custom dropdowns / tabs / menus.
- `tabindex > 0` anywhere — [none / list].

## Tap targets

- Minimum size — [all ≥ 44 × 44 / list violations].
- Spacing between adjacent targets — [≥ 8px / list violations].

## Screen-reader hygiene

- `<img alt>` present on every image (descriptive or empty for decorative).
- `<label>` associated with every input.
- Icon-only buttons have `aria-label`.
- Landmarks: one `<main>`, correct `<nav>`, `<header>`, `<footer>`.
- Heading order: one `<h1>`, no level skips.

## Colour ≠ meaning

- Error state — colour + [icon / text].
- Success state — colour + [icon / text].
- Required-field indicator — colour + [`*` / `aria-required`].
- Any state carried on colour alone — [none / list].

## Forms

- Labels visible above inputs (not placeholder-only).
- Required fields marked with more than colour.
- Errors tied via `aria-describedby`.
- Inline validation announced (`aria-live="polite"` or `role="alert"`).
- Autocomplete attributes on personal-data fields.

## Change list

Ordered: **blockers → high → medium → low.** Blockers must appear
first — a failing gate ships as a blocker, not a "consider".

- 🚫 **Blocker** — [item] · `[file:line]`.
- 🔺 **High** — [item] · `[file]`.
- 🔸 **Medium** — [item].
- 🔹 **Low** — [item].

## Snippet

```css
/* focus-visible baseline */
:where(a, button, input, select, textarea, [tabindex]):focus-visible {
  outline: 2px solid var(--color-accent);
  outline-offset: 2px;
}
```

```css
/* reduced-motion baseline */
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

## Open questions

- Whether to push contrast to AAA on body copy (palette allowing).
- Whether hero animations get hand-crafted reduced-motion variants or
  the global cut.
- Whether an automated axe / Lighthouse pass should follow this audit
  on the built site.
