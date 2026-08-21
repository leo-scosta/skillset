# web-motion

Recommends web motion and interaction effects — CSS-only, View
Transitions, Motion (motion.dev), GSAP + ScrollTrigger, Lenis,
Three.js — ordered lightest first, each priced in bundle size and
install status, each with a `prefers-reduced-motion` fallback and a
lighter alternative.

## The problem

Asking an AI to "add scroll animations" tends to produce either a
Three.js recommendation with no cost stated, or a fade-in with no
`prefers-reduced-motion` fallback. Motion has a real cost — bundle
size, GPU / battery, keyboard-scroll interference, vestibular
sickness — and every recommendation needs to name it.

## The approach

One skill covering only the motion stage. The body of `SKILL.md` walks
through target read → reference intake → per-recommendation stack with
cost, reduced-motion, and lighter alternative → guardrails → an
explicit "when not to add motion" check.

The on-demand `references/motion.md` carries the deeper material:
the full stack (CSS, View Transitions, Motion, GSAP, Lenis,
Three.js, plus Anime.js / AutoAnimate / Rive / Lottie as alternatives),
the reduced-motion CSS + JS + React patterns, compositor / thrash /
duration guardrails, framework-specific notes, and the "when *not* to
add motion" checklist.

Opinionated on purpose:

- **Every recommendation carries three things**: library + bundle +
  install status; a `prefers-reduced-motion` fallback; a lighter
  alternative. No exceptions.
- **Order is lightest first.** CSS before View Transitions before
  Motion before GSAP before Three.js — reach for a heavy library only
  when the effect genuinely justifies it.
- **Vestibular safety is a default**, not a reduced-motion afterthought.
  No large parallax, no floor-tilt, no long slides on large elements.
- **Compositor-only on hot paths.** Never `width`/`height`/`top`/`left`
  on scroll or hover.
- **Explicit permission to say no.** If the reference is minimal or the
  content is reading-heavy, motion is probably wrong and the pass says
  so.

## Rejected alternatives

**Folding this back into a single `web-design` skill.** Tried that first
— the umbrella diluted the motion-specific triggers ("Three.js hero",
"GSAP scroll-trigger", "Lenis smooth scroll", "reduced-motion fallback").
These are the phrasings users actually type; each one now hits directly.

**A motion-code generator.** Rejected because the value here is
picking the right tool for the job in the context of the user's project
and reference — and pairing every choice with a reduced-motion fallback
and a cost-honest alternative. Generated code without those two things
is worse than no recommendation.

## Known limits

- **Proposes, doesn't apply.** Returns a change list with libraries and
  snippets; doesn't edit files or open PRs.
- **Sees what it's given.** For a motion reference, works from the video
  or URL the user provides — can't inspect a Framer project's animation
  timeline directly.
- **Bundle sizes are approximate.** They shift with each library
  release; use the numbers as guidance and confirm from `bundlephobia`
  or the vendor's own docs for a hard budget.
- **Browser-support notes reflect early 2026.** `scroll-timeline`,
  `view-timeline`, and View Transitions API support keep expanding —
  re-check for edgy targets.
