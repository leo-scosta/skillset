# Colour review template

Fill every section. Mark a section *not applicable* with a one-line reason
rather than leaving it empty.

---

## Intent

One sentence naming the palette direction. Draw from the user's reference
if provided, or restate the current page's own direction.

_Example: **Warm monochrome with one deep amber accent, extracted from the
Adobe Color theme of the user's reference photo.**_

## Baseline

- **Tokens in use** — list current colour tokens or values.
- **Role coverage** — how many roles the current palette covers.
- **Harmony currently in play** — monochrome / analogous / …/ ad hoc.
- **Dark mode** — present / absent / partial.

## Proposed palette

Token block (match the target project's naming convention):

```
--color-bg:        #...
--color-surface:   #...
--color-border:    #...
--color-ink:       #...
--color-ink-soft:  #...
--color-ink-faint: #...
--color-accent:    #...
```

Harmony rule: **[monochrome / analogous / complementary / triadic / split-complementary]**.

Tool that would build this: **[Adobe Color / Coolors / Realtime Colors / Huemint]**
— one-line reason.

## Contrast matrix (required)

```
              bg          surface     border
ink           [ratio AAA] [ratio AAA] —
ink-soft      [ratio AA]  [ratio AA]  —
ink-faint     [ratio AA*] [ratio ✗]  —
accent        [ratio AA]  [ratio ✗]  —
```

`AA*` = AA-large only (≥ 18px regular / 14px bold). `✗` = blocker.

## Dark mode (if in play)

```
--color-bg:        #...
--color-surface:   #...
--color-border:    #...
--color-ink:       #...
--color-ink-soft:  #...
--color-ink-faint: #...
--color-accent:    #...
```

Traps flagged:

- Pure black / white avoided.
- Accent desaturated for dark bg.
- Any asset (screenshot, illustration) that needs a per-mode variant.

## Change list

Ordered: **blockers → high → medium → low.**

- 🚫 **Blocker** — [failing pair from matrix, ratio, recommended fix].
- 🔺 **High** — [item] · `[file]`.
- 🔸 **Medium** — [item].
- 🔹 **Low** — [item].

## Snippet

```css
/* token additions */
```

## Open questions

- Whether a second accent (`accent-2`) is genuinely needed.
- Whether dark mode should ship in this pass or later.
- Whether any brand colour is fixed (locked by identity work).
