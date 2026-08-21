# Motion review template

Fill every section. Mark a section *not applicable* with a one-line reason
rather than leaving it empty.

---

## Intent

One sentence naming the motion direction. Draw from the user's reference
if provided, or restate the current page's own direction.

_Example: **Restrained editorial motion — section-reveal on scroll and
one View-Transitions route change, no heavy scroll-scrubbed pieces.**_

## Baseline

- **What already moves** — one line per current animation.
- **Libraries installed** — list from `package.json` (motion, gsap, lenis, three, framer-motion, …).
- **Framework** — Astro / React / Svelte / Vue / static.
- **Reduced-motion respected today** — yes / partial / no.

## Recommendations (lightest first)

For each, four things:

### 1. [What — one line, e.g. "Hero headline reveal on load"]

- **How** — library + approximate bundle + install status (already installed / net-new).
- **Reduced-motion** — what happens when `prefers-reduced-motion: reduce`.
- **Lighter alternative** — CSS-only / View Transitions / smaller lib.

### 2. [What]

- **How** — library + bundle + install status.
- **Reduced-motion** — …
- **Lighter alternative** — …

### 3. [What]

- **How** — …
- **Reduced-motion** — …
- **Lighter alternative** — …

## Guardrails checked

- [ ] Compositor properties only on hot paths (opacity / transform / filter).
- [ ] No layout thrash in scroll handlers.
- [ ] UI transitions ≤ 500ms.
- [ ] Vestibular-safe (no large parallax / floor-tilt / long slides on large elements).
- [ ] Autoplay video (if any) meets the 6s / 2MB / muted / playsinline / poster / pause-control bar.

## When *not* to add motion

If any of these apply, say so instead of stretching:

- Reference is minimal / editorial / restrained.
- Target is documentation or reading-heavy.
- Performance budget is already tight.

## Change list

Ordered: **blockers → high → medium → low.**

- 🚫 **Blocker** — [reduced-motion missing / heavy layout thrash / vestibular-hostile large motion].
- 🔺 **High** — [item].
- 🔸 **Medium** — [item].
- 🔹 **Low** — [item].

## Snippet

```css
/* the reduced-motion base */
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

- Whether a heavy pick (GSAP + ScrollTrigger, Three.js, Lenis) is worth
  its cost for this project.
- Whether a hero motion piece needs a hand-crafted reduced-motion
  variant rather than the global cut.
- Whether SEO / crawlability matters enough to rule Three.js out of the
  hero.
