# Accessibility gates

These are **gates, not nits.** A design that fails any of them does not get
called award-winning, and every failure appears in the change list as a
blocker, not a suggestion.

Standard: **WCAG 2.2 AA** everywhere; push to **AAA where cheap** — i.e.
where the palette or motion vocabulary absorbs it without hurting the
design.

## Contrast

- **Body text: 4.5:1** minimum against its background. AAA is 7:1.
- **Large text: 3:1** minimum (≥ 18px regular, ≥ 14px bold). AAA is 4.5:1.
- **Non-text UI (icons, form borders, focus rings): 3:1** minimum against
  adjacent colour.
- **Placeholder text** counts as body text — 4.5:1.

Tools: WebAIM Contrast Checker (webaim.org), APCA calculator
(apcacontrast.com) for the perceptual number WCAG 3 will use.

Common blockers:

- Grey secondary text (`#999` on `#fff` = 2.85:1 — fail).
- Accent buttons where the label uses the accent token variant instead of
  pure `#fff` or near-black.
- Placeholder text at `--color-ink-faint` (usually too light).
- Focus rings that are the same colour as the accent, on an accent
  background.

## `:focus-visible`

Every interactive element must have a visible focus state that is **not
colour alone**. Use one or both:

- A 2–3px outline offset from the element (`outline: 2px solid var(--color-accent); outline-offset: 2px;`).
- A background-colour shift that also meets 3:1 non-text contrast.

Never `outline: none` without a replacement. The default browser ring is
ugly but present; a design without a considered focus state is a design
that will fail on keyboard.

Prefer `:focus-visible` over `:focus` — the former only shows the ring on
keyboard, so mouse users don't see it on click.

## `prefers-reduced-motion`

Every animation respects it. See `references/motion.md` for the pattern.

Two levels of respect:

1. **Baseline** — animations shorten to 0.01ms (effectively off) but end
   state is preserved. This is what the global reduced-motion block does.
2. **Considered** — for hero animations, ship a hand-crafted reduced-motion
   variant that shows the end state immediately, or replaces motion with a
   static composition. Better than the global cut.

## Keyboard order

Tab order matches visual order. Test by pressing `Tab` through the page
and confirming focus moves left-to-right, top-to-bottom, in reading order.

Common breaks:

- Modals that don't trap focus.
- Custom dropdowns without arrow-key handling.
- Cards where the whole card is clickable but the inner link is also
  tabbable — pick one.
- `tabindex` values > 0 (an anti-pattern that hijacks order).

## Tap targets

**Minimum 44 × 44 CSS pixels** on touch surfaces (WCAG 2.5.5 AAA;
Apple HIG uses 44pt; Google Material uses 48dp). This applies to buttons,
icon buttons, tabs, links in a list, and form field labels.

Adjacent tap targets need at least 8px of space between them, or they'll
be miss-tapped on small devices.

## Motion + vestibular safety

Beyond reduced-motion:

- **No large parallax** on decorative background elements — they trigger
  motion sickness for real users.
- **No auto-carousels** that advance without user input. If a carousel
  auto-advances, it needs pause/play controls and stops on hover/focus.
- **No content that flashes more than 3 times per second** — seizure
  trigger (WCAG 2.3.1).
- **No large sudden motion on scroll** — the classic "big element sliding
  in from the side at high speed" is vestibular-hostile.

## Screen reader hygiene (baseline)

- Every image has `alt` — descriptive if the image carries meaning, empty
  (`alt=""`) if decorative. Never omit the attribute.
- Every form input has an associated `<label>` — `for`/`id` pair or
  `<label>` wrap.
- Every button says what it does. `<button aria-label="Close">×</button>`
  for icon-only buttons.
- Landmark structure: one `<main>`, `<nav>` for navigation,
  `<header>`/`<footer>` for global regions.
- Headings in order — `h1` → `h2` → `h3`, no skipping. One `h1` per page.

## Colour ≠ meaning

Never carry state on colour alone. A red border on an error input needs
also an icon or a text label. A green "success" badge needs "Success" as
text or an icon that renders in monochrome. Colour blindness affects
~8% of men, ~0.5% of women.

## Forms

- Labels visible, above the input (not placeholder-only).
- Required fields marked with more than colour (asterisk + `aria-required`).
- Error messages tied to inputs via `aria-describedby`.
- Inline validation announced with `aria-live="polite"` or
  `role="alert"` on the error message container.
- Autocomplete attributes on personal-data fields
  (`autocomplete="email"`, `autocomplete="name"` etc.) — helps password
  managers and users of assistive tech.

## Design-system posture

Copy this posture into the output:

> Additions to design tokens are safe; renames are hard-forbidden. If a new
> pattern needs a new token, add it. If an existing token doesn't quite fit,
> either use it anyway or add a sibling — never rename.

For the portfolio repo specifically (`/Users/leandrocosta/Sites/portfolio`),
`DESIGN.md` codifies this. Any pass on that repo must:

- Not rename anything in `src/styles/tokens.css`.
- Not touch `src/content/`.
- Keep `npm run build` green.
- Show additions on `/styleguide`.

## Quick checklist for the output

- [ ] Contrast matrix present with actual ratios.
- [ ] Every interactive element has a `:focus-visible` state described.
- [ ] Every motion recommendation names its reduced-motion behaviour.
- [ ] Tab order confirmed to match reading order.
- [ ] Tap targets ≥ 44px on touch.
- [ ] No colour-only state indication.
- [ ] Form labels visible; error announcement pattern described.
- [ ] Design system: no token renames proposed.
