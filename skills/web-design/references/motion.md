# Motion & effects

Every motion recommendation carries three things: **cost** (bundle size +
install status), a **`prefers-reduced-motion` fallback**, and a **lighter
alternative**. No exceptions, even for a fade-in.

Order recommendations lightest first. Reach for a heavy library only when
the effect genuinely justifies it.

## The stack (lightest to heaviest)

### CSS-only

Bundle: **0kB.** Install: **always available.**

- Transitions on `opacity`, `transform`, and `filter` — animate the
  compositor properties only. Never animate `width`/`height`/`top`/`left` on
  a hot path.
- `@keyframes` for looping decoration (subtle pulses, gradient shifts).
- `scroll-timeline` and `view-timeline` — CSS-native scroll animations, now
  Baseline in Chromium and Safari 17.4+. Firefox behind a flag as of 2026.
  When target support allows, prefer this over any JS scroll library.
- `animation-timeline: scroll()` for parallax and scroll-driven reveals.
- `@starting-style` for on-mount animations without JS.
- `will-change` sparingly — only on elements about to animate, remove after.

Good for: hovers, micro-interactions, page-load fades, section reveals.

### View Transitions API

Bundle: **0kB.** Install: **always available** (Baseline in Chromium; Safari
18+; Firefox behind a flag).

- `document.startViewTransition(() => …)` — animate any DOM change (route
  change, list reorder, modal open) with automatic cross-fade + shared-element
  morph.
- `view-transition-name` on elements to persist across the transition.
- For SPA route changes, this is now the default choice — no framework
  needed, no library cost.

Good for: page transitions, list reorder, modal in/out, filter changes.

### Motion (motion.dev)

Bundle: **~2.5kB** (mini build), **~18kB** (full).
Install: `npm install motion`.

- The rebrand of Framer Motion's underlying primitives, framework-agnostic.
- Best middle-ground: much lighter than GSAP, more capable than CSS-only.
- API is imperative (`animate(el, { opacity: 1 }, { duration: 0.5 })`) and
  React (`<motion.div>`).
- Spring physics built in.

Good for: complex sequenced animations, spring-based interactions, drag
gestures, layout animations.

### GSAP

Bundle: **~35kB** core, **+15–25kB** per plugin (ScrollTrigger, SplitText,
Flip). Install: `npm install gsap`.

- The industry standard for scroll-driven, timeline-heavy motion. Every
  Awwwards-tier scroll story ships with it.
- Free for commercial use since May 2024 (GSAP 3.13+).
- ScrollTrigger is the reason to reach for it — nothing else matches its
  scrubbing precision.
- Overkill for anything that CSS animations or View Transitions can handle.

Good for: pinned scroll storytelling, complex scroll scrubbing, SVG
morphing, sequenced marketing sites.

### Lenis

Bundle: **~4kB** gzipped. Install: `npm install lenis`.

- Smooth scroll layer. Doesn't animate anything — it makes the scroll
  itself buttery.
- Almost always paired with GSAP + ScrollTrigger. On its own it just
  softens the wheel event.
- Trap: it breaks native scroll semantics (anchor jumps, keyboard PgDn,
  browser Find highlighting). Never enable it without testing keyboard nav
  and offering a way to disable it.

Good for: portfolio / agency sites where scroll *is* the interaction. Bad
for: content-heavy sites, documentation, anything the user reads long-form.

### Three.js

Bundle: **~150kB** core, plus loaders/controls as needed. Install:
`npm install three`.

- WebGL renderer. For anything genuinely 3D.
- **React Three Fiber** (`@react-three/fiber` + `@react-three/drei`) is the
  React wrapper. Adds ~50kB but makes Three.js usable.
- Cost is not just bundle — GPU/battery load, SEO invisibility (canvas
  content isn't crawlable), and a11y is essentially manual.
- For a background effect (particle field, wave surface), consider
  **OGL** (~9kB) as a lighter alternative.

Good for: hero WebGL pieces, immersive 3D storytelling, generative art.
Bad for: adding "some 3D feel" to a landing page — cost far exceeds the
transfer benefit.

### Alternatives worth naming

- **Anime.js** — ~14kB, tween-heavy, clean API. Old-school GSAP-lite.
- **Popmotion** — Motion's predecessor; use Motion instead.
- **AutoAnimate** — ~2kB, one-line drop-in for list add/remove animations.
  Great when Motion is overkill.
- **Rive** — for exportable interactive animations (like Lottie but
  interactive). Runtime ~50kB.
- **Lottie** — for After-Effects-authored animations. Runtime ~50–200kB
  depending on features. Consider only for very complex illustrations.

## The reduced-motion pattern

Every recommendation ships with this pattern. Non-negotiable.

CSS:

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

JS (feature-detect before wiring any library):

```js
const reduced = matchMedia('(prefers-reduced-motion: reduce)').matches
if (!reduced) {
  // install GSAP / Lenis / Motion here
}
```

React:

```jsx
const reduced = useReducedMotion() // from framer-motion / motion
```

## Guardrails

- **Never animate `width`, `height`, `top`, `left`, or `margin`** on a hot
  path. Compositor-only: `opacity`, `transform`, `filter`.
- **Never trigger layout thrash in a scroll handler.** Read layout
  (`getBoundingClientRect`), then write — never in the same frame.
- **Cap animation duration at 500ms** for UI transitions (buttons, modals,
  hovers). Longer feels laggy. Scroll-scrubbed animations can be longer
  because they're user-driven.
- **Vestibular-safe transforms only** for large elements: no big parallax,
  no floor-tilt, no long slides. These trigger nausea for a real slice of
  users; reduced-motion is the escape hatch but the default should be safe.
- **Cinematic scroll pieces cost.** A pinned scroll section adds real
  scroll-length, hurts SEO body-content ratio, and is invisible to any
  reader who is skimming. Reserve for hero / feature-launch moments.
- **Autoplay video is not a design decision, it's a bandwidth decision.**
  Loop under 6 seconds, ≤ 2MB, muted, `playsinline`. Poster required. Offer
  a pause control.

## Framework-specific notes

- **Astro** — the target project uses no motion libraries by default. Any
  recommendation is net-new dependency territory; flag it clearly. Astro
  supports React / Svelte / Vue islands, so Motion / GSAP works with any
  chosen framework.
- **React** — Motion (motion.dev) is the current default. `framer-motion` is
  the older API, still supported.
- **Svelte** — built-in `transition:` and `animate:` cover most cases; add
  Motion or GSAP only for what the built-ins can't do.
- **Vue** — `<Transition>` and `<TransitionGroup>` cover most cases; add
  Motion or GSAP for scroll and timeline work.
- **Static HTML / vanilla JS** — Motion or GSAP as needed, both work
  without a framework.

## When *not* to add motion

- If the design reference is minimal / editorial / restrained, motion is
  probably wrong. Some sites read as considered *because* they don't move.
- If the target is a documentation site or reading-heavy content, motion
  fights the reader. Fade-in on scroll is the ceiling.
- If the site's performance budget is already tight, adding GSAP + Lenis
  can blow the LCP target. Measure first.
