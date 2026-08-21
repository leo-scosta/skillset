# Components & layout review template

Fill every section. Mark a section *not applicable* with a one-line reason
rather than leaving it empty.

---

## Intent

One sentence naming the aesthetic direction. Draw from the user's
reference or named voice if provided, or restate the current page's own
direction.

_Example: **Kage-adjacent editorial minimalism — type-driven hero,
generous whitespace, one warm accent, pattern reference from
Awwwards · Locomotive Berlin.**_

## Reference intake

If a reference was provided, name five to seven concrete traits:

- Colour temperature / saturation
- Contrast level (high / mid / low)
- Type style (category, weight, treatment)
- Motion density (still / restrained / active)
- Layout rhythm (dense / airy / mixed)
- Image treatment (photo / illustrated / type-only / mixed)
- Decorative elements (texture, illustration, WebGL, none)

If a named voice from `references/voices.md` was used, name it here.

## Baseline

- **Layout** — container width, column grid, vertical rhythm, edge treatment.
- **Hero** — one line on the current pattern.
- **Nav** — one line on the current pattern.
- **Cards** — one line on the current pattern.
- **Forms** — one line on the current pattern (if present).
- **Footer** — one line on the current pattern.

## Findings — per component

- **Hero** — current: … / proposed: … / source: *Awwwards · [entry]*.
- **Nav** — current: … / proposed: … / source: *CollectUI · [entry]*.
- **Cards** — current: … / proposed: … / source: *[named source]*.
- **Forms** — current: … / proposed: … / source: *[named source]*.
- **Footer** — current: … / proposed: … / source: *[named source]*.

Add rows for any other meaningful components (pricing table, testimonial,
section header, empty state, etc.).

## Layout primitives

- **Container width** — [narrow / standard / full-bleed / mixed].
- **Column grid** — [12 / 8 / broken / none].
- **Vertical rhythm** — [scale + consistency].
- **Whitespace ratio** — [dense / airy / mixed].
- **Edge treatment** — [inset / full-bleed / mixed].
- **Image-to-text ratio** — [text-driven / image-driven / mixed].

## Change list

Ordered: **blockers → high → medium → low.**

- 🚫 **Blocker** — [item] · `[file:line]`.
- 🔺 **High** — [item] · `[file]`.
- 🔸 **Medium** — [item].
- 🔹 **Low** — [item].

## Snippet

```html
<!-- one component pattern, short -->
```

## Open questions

- Whether to add a named voice to `voices.md` — if a new one came up.
- Any component whose content isn't clear enough to shape.
- Any pattern the user wants to hold for a second pass.
