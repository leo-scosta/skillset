# Typography review template

Fill every section. Mark a section *not applicable* with a one-line reason
rather than leaving it empty.

---

## Intent

One sentence naming the typographic direction. Draw from the user's
reference if provided, or restate the current page's own direction.

_Example: **Modern editorial — humanist serif display over a warm
neo-grotesque body, taken from the Fraunces + Inter pairing the
Sable Framer template uses.**_

## Baseline

- **Display family** — [name, source, weights loaded]
- **Body family** — [name, source, weights loaded]
- **Scale in use** — [sizes and, if identifiable, the ratio]
- **Line height / tracking** — [current values on display and body]
- **Loading strategy** — [Google Fonts runtime / self-hosted / Fontsource / other]

## Proposed pairing

- **Display**: **[name]** — source (Google Fonts / Fontshare / Fontsource).
- **Body**: **[name]** — source.
- **Rationale**: one sentence (contrast, tone, era, x-height compatibility).

## Proposed scale

Ratio: **[1.125 / 1.200 / 1.250 / 1.333 / 1.414]**. Baseline 16px body.

```
display: [px]  / lh [n]   / tracking [em]
title:   [px]  / lh [n]   / tracking [em]
lead:    [px]  / lh [n]   / tracking [em]
body:    [px]  / lh [n]   / tracking [em]
small:   [px]  / lh [n]   / tracking [em]
xs:      [px]  / lh [n]   / tracking [em]
```

## Weight subset

List every weight to load, per family, with a reason.

- **[Family]** — 400 (body), 600 (headings), 800 (display only).

## Contrast

Body against its intended background: **[ratio] [AA / AAA / fail]**.
Note any secondary text pair that doesn't clear AA.

## Loading

- File format: `.woff2` / variable font: [yes / no].
- Strategy: [Fontsource npm / self-hosted static / google-webfonts-helper / runtime CDN].
- Preload: display + body regular.
- Subset: [Latin / Latin-ext / other].
- `font-display`: `swap`.

## Change list

Ordered: **blockers → high → medium → low.**

- 🚫 **Blocker** — [item] · `[file:line]`.
- 🔺 **High** — [item] · `[file]`.
- 🔸 **Medium** — [item].
- 🔹 **Low** — [item].

## Snippet

```css
/* type tokens */
```

## Open questions

- Any paid family that would fit better than the open-source pick.
- Dark-mode weight bump (dark backgrounds usually need +100 weight on body).
- Language subsets beyond Latin, if the site is multilingual.
