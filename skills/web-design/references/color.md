# Colour

Every text/background pair passes **WCAG AA** (4.5:1 body, 3:1 large) as a
hard floor. Push to **AAA** (7:1 / 4.5:1) wherever the palette can absorb it
without dulling the design.

## Tools

Reach for the right one — none of these are required inputs, but citing which
tool you'd use adds credibility.

| Tool | URL | Best for |
| --- | --- | --- |
| **Adobe Color** | color.adobe.com | Harmony rules (analogous, complementary, triadic, split-complementary, tetradic). "Extract Theme from Image" builds a starter palette from a reference photo — the standard move when the user gives you an image. |
| **Coolors** | coolors.co | Rapid palette iteration with keyboard shortcuts; good for exploring variations off a locked accent. |
| **Realtime Colors** | realtimecolors.com | Live preview of a palette on a full site layout. Shows contrast weakness immediately. |
| **Huemint** | huemint.com | ML-generated palettes with adjustable "chaos" — useful when you want something distinctive that would be hard to reason to. |
| **APCA Contrast Calculator** | apcacontrast.com | The perceptual replacement WCAG 3 will move to. Report both APCA (Lc) and WCAG (ratio) for edgy pairs. |
| **WebAIM Contrast Checker** | webaim.org/resources/contrastchecker | The one to cite when you report AA/AAA numbers. |

## Harmony rules

Pick one, state it in the output. Mixing rules produces noise.

- **Monochrome** — one hue, many values. Safest, most sophisticated, hardest
  to get wrong. Requires a strong type/layout system to carry personality.
- **Analogous** — three hues adjacent on the wheel (e.g. blue → teal → green).
  Warm and cohesive; risk is that the accents blur together.
- **Complementary** — two hues opposite on the wheel (e.g. blue + orange).
  High-tension, best when one dominates and the other punctuates.
- **Split-complementary** — one hue plus the two adjacent to its complement.
  Softer than pure complementary, more colour choices for illustration.
- **Triadic** — three hues 120° apart. Vivid; needs restraint to avoid a
  circus.
- **Tetradic** (rectangle) — two complementary pairs. Rarely the right answer
  unless the brand is genuinely multicoloured.

## Token structure

Aim for 5–8 role tokens rather than 20 colour tokens. Match the target
project's naming convention (`--color-*`, `$color-*`, `theme.colors.*`).

Common role set:

| Token | Role |
| --- | --- |
| `bg` | Page background |
| `surface` | Raised surfaces (cards, panels) |
| `border` | Hairlines, dividers |
| `ink` | Primary text |
| `ink-soft` | Secondary text |
| `ink-faint` | Tertiary text, disabled |
| `accent` | Interactive, brand |
| `accent-2` | Optional second accent — only if the design genuinely needs one |

Dark mode: mirror the role set with a `dark` variant, don't invent new roles.

## Building a palette from a reference image

The reproducible flow:

1. Drop the image into **Adobe Color → Extract Theme**. Take the five auto
   picks as raw material, not gospel.
2. Identify the darkest, lightest, and most saturated pixel. Those become
   the anchors for `ink`, `bg`, and `accent`.
3. Build the mid-tokens (`surface`, `border`, `ink-soft`, `ink-faint`) by
   interpolating between `bg` and `ink` — usually 3%, 8%, 40%, 65% of the
   way from `bg` to `ink`.
4. Check every text/background pair against WCAG AA. If a pair fails, adjust
   lightness — never abandon the pair without trying a value shift first.
5. Report the palette as a token block plus a contrast matrix.

## Contrast matrix (required in output)

Always include this shape in the colour section:

```
              bg        surface     border
ink           14.2 AAA  13.1 AAA    —
ink-soft      5.8  AA   5.3  AA     —
ink-faint     3.1  AA*  2.9  fail   —
accent        4.7  AA   4.3  fail   —
```

`AA*` means AA-large only (≥ 18px regular or 14px bold). `fail` is a blocker
and must appear in the change list.

## Dark mode

Two approaches, pick one:

- **Semantic swap** (recommended) — same role tokens, different values in a
  `[data-theme="dark"]` or `prefers-color-scheme: dark` block. All components
  keep reading `var(--color-ink)` etc. and get correct values automatically.
- **Duplicate tokens** — `ink-dark`, `bg-dark` etc. Only when the design
  genuinely needs both modes visible at the same time (rare).

Dark-mode traps:

- Pure black (`#000`) on pure white (`#fff`) is punishing at scale. Prefer
  `#0a0a0b` on `#fefefe` — 20:1 contrast, half the eye strain.
- Saturated accents that were fine on light bg often need desaturation and a
  brightness shift on dark bg. Test the accent on both backgrounds.
- Images and screenshots baked for light mode look wrong on dark. Consider
  a subtle overlay or a per-mode asset.

## Common failures

- **Grey-on-grey secondary text** below 4.5:1. Very common. If `ink-soft`
  fails, darken it — don't cite it as a design choice.
- **Accent-on-accent buttons** with insufficient contrast on the accent
  background. If the accent is mid-value, the button label needs to be pure
  white or pure black, not "accent-ink".
- **Placeholder text below 3:1.** Forms are the worst offender. Placeholder
  needs to be `ink-soft` at minimum, not `ink-faint`.
- **Alerts with weak-contrast icons** — the icon carries the alert's meaning
  and must meet 3:1 against its background.
