# Review template

Fill every section. Mark a section *not applicable* with a one-line reason
rather than leaving it empty. Blockers-first ordering in the change list.

---

## Intent

One sentence naming the aesthetic target. Draw from the user's reference
if provided, or restate the current page's own direction if not.

_Example: **Editorial minimalism with one warm accent — a Kage-adjacent
type-first hero, pushed toward more architectural rhythm from the
Locomotive site the user linked.**_

## Reference intake

If a reference was provided, name it plus five to seven concrete traits:

- Colour temperature / saturation
- Contrast level (high / mid / low)
- Type style (category, weight, treatment)
- Motion density (still / restrained / active)
- Layout rhythm (dense / airy / mixed)
- Image treatment (photo-driven / illustrated / type-only / mixed)
- Decorative elements (texture, illustration, WebGL, none)

If no reference, mark *no reference — polishing existing baseline*.

## Baseline

Five bullets on what's there now, no judgement:

- **Type stack** — display + body families, scale, line height.
- **Palette** — the actual values in use, and how many roles.
- **Layout** — container width, column grid, vertical rhythm.
- **Components** — hero, nav, cards, footer treatment in one line each.
- **Motion** — anything moving today, and what library (if any).

## Findings

### Typography

Current pairing, what's working, what isn't. Reference `references/typography.md`
for pairing / scale reasoning.

Proposed:

- Display family: **[name]** — source (Google Fonts / Fontshare / Fontsource).
- Body family: **[name]** — same.
- Pairing rationale: one sentence.
- Scale: ratio + steps.
- Weight subset needed.
- Contrast note for body copy.

### Colour

Current palette assessment. Proposed palette below.

Token block (match target project's naming):

```
--color-bg: #...
--color-surface: #...
--color-border: #...
--color-ink: #...
--color-ink-soft: #...
--color-ink-faint: #...
--color-accent: #...
```

Harmony rule used: **[monochrome / analogous / complementary / …]**.

Tool that would build this: **[Adobe Color / Coolors / Realtime Colors / Huemint]**.

Contrast matrix (required):

```
              bg          surface     border
ink           [ratio]     [ratio]     —
ink-soft      [ratio]     [ratio]     —
ink-faint     [ratio]     [ratio]     —
accent        [ratio]     [ratio]     —
```

Failures listed as blockers below.

### Components & layout

Per component, one line current + one line proposed + one line citation.

- **Hero** — current: … / proposed: … / source: Awwwards · [entry].
- **Nav** — current: … / proposed: … / source: CollectUI · [entry].
- **Card** — current: … / proposed: … / source: …
- **[…]**

Layout primitives:

- Container width / breakpoints.
- Column grid.
- Vertical rhythm.
- Whitespace ratio.
- Edge treatment.

### Motion

Per recommendation, four things:

- **What** — the effect (e.g. section reveal on scroll).
- **How** — library + approximate bundle + install status.
- **Reduced-motion** — what happens when `prefers-reduced-motion: reduce`.
- **Lighter alternative** — CSS-only / View Transitions / smaller lib.

Order lightest first.

### Accessibility

- Contrast fails (from matrix above).
- Any `:focus-visible` state missing.
- Any motion without a reduced-motion fallback.
- Keyboard-order issues spotted.
- Tap-target issues on touch.

## Change list

Ordered: **blockers → high → medium → low.**

Each item names the file / token / component where the change lands, if the
project structure is known.

- 🚫 **Blocker** — [item] · `[file:line]`.
- 🔺 **High** — [item] · `[file]`.
- 🔸 **Medium** — [item].
- 🔹 **Low** — [item].

## Snippets

Only include short, copy-pasteable code — token blocks, CSS variables,
reduced-motion query, one component style. If a change is long or
project-specific, describe it in the change list and leave application to a
follow-up turn.

```css
/* token additions */
```

```css
/* reduced-motion */
```

```html
/* one component pattern */
```

## Open questions

Anything the user needs to decide before applying:

- A paid font that would be a better fit than the open-source pick, if any.
- A second accent colour that the palette could use but that isn't
  necessary.
- A motion recommendation that costs enough to warrant a "yes/no" decision.
- Anything the user's reference is ambiguous about (e.g. dark mode? touch
  first? RTL?).
- Whether to add to `voices.md` — if a new named voice came up during the
  pass.
