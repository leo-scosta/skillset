---
name: web-motion
description: Recommend web motion and interaction effects like a senior designer — CSS-only transitions, View Transitions API, Motion (motion.dev), GSAP + ScrollTrigger, Lenis smooth scroll, Three.js — ordered lightest first, each priced in bundle size and install status, each with a prefers-reduced-motion fallback and a lighter alternative. Use when the user asks to add scroll animations, propose hero motion, evaluate a Three.js hero, wire GSAP or Lenis, make a section feel more dynamic, add page transitions, or make sure a motion piece has a reduced-motion fallback. Compositor-only properties on hot paths; vestibular-safe defaults; motion is never added when the design reference is minimal.
license: MIT
metadata:
  author: leandro-costa
  version: "1.0"
  repository: skillset
---

# Web Motion & Effects

Runs the motion stage of a design pass: what should move, with which
library, at what bundle cost, with what reduced-motion fallback, and what
lighter alternative the user could pick instead. Ordered lightest first.

Output is a written proposal, not applied edits.

## Process

### 1. Read the target

Identify what to work on. The target can be:

- a URL → fetch with `WebFetch`
- a file path → `Read` it
- a video reference → describe the motion vocabulary from the video
- a section named in prose → ask the user which file it maps to

Extract, in one pass: what already moves on the page and with what
library (if any), and what the site's current performance posture looks
like (any motion libraries in `package.json`? Astro? React? Static?).
Do not propose changes yet.

### 2. Read the design system and constraints

If the project has any of these, load them:

- a `DESIGN.md` at repo root
- `package.json` — which motion libraries are already installed
- any performance budget documented in the repo

Rules that apply everywhere until proven otherwise:

- **Net-new dependencies cost.** If a library isn't already installed,
  the recommendation has to justify the addition.
- **Compositor properties only** on hot paths — `opacity`, `transform`,
  `filter`. Never `width`/`height`/`top`/`left`/`margin` on scroll or
  hover.
- **The design reference decides.** A minimal / editorial / restrained
  reference means motion is probably wrong.

### 3. Reference intake

If the user shared a reference:

- **Video** → describe the motion vocabulary in three to five traits
  (density, scrub vs. keyframe, ease curve, decoration, scroll behaviour).
- **URL** → fetch and read; describe what's animating.
- **Named voice** ("Towers-adjacent scroll narrative") → look it up in
  the components skill's `voices.md` if the user has it; otherwise ask
  for two or three motion-specific traits.

If nothing was shared, ask what problem the motion is meant to solve
before proposing effects.

### 4. Motion pass

Open `references/motion.md`.

For each recommendation, **three things are non-negotiable**:

1. **Cost.** Name the library, its approximate bundle size, and whether
   it's already installed in the target project. If it's net-new, say so.
2. **A `prefers-reduced-motion` fallback.** Every recommendation includes
   what the reduced-motion version does (usually: skip the animation,
   keep the end state).
3. **A lighter alternative.** For every heavy recommendation (Three.js,
   GSAP with ScrollTrigger, Lenis) offer one CSS-only, View-Transitions,
   or smaller-library version. The user picks.

**Order recommendations by cost, lightest first.** Reach for a heavy
library only when the effect genuinely justifies it.

### 5. Guardrails check

Every recommendation is checked against:

- Compositor-only properties on hot paths.
- No layout thrash in scroll handlers.
- UI transitions capped at ~500ms.
- Vestibular-safe (no large parallax, no floor-tilt, no long slides on
  large elements).
- Autoplay video only under 6s, ≤ 2MB, muted, `playsinline`, with a
  poster and a pause control.

### 6. When *not* to add motion

Explicit permission to say no. If any of these apply, motion is probably
the wrong recommendation:

- The reference is minimal / editorial / restrained.
- The target is documentation or reading-heavy content.
- The site's performance budget is already tight.

Say so in the output; don't stretch to fill a motion pass that shouldn't
happen.

### 7. Output

Use `assets/review-template.md` for the output shape.

## Always-on rules

- **Every recommendation carries a reduced-motion fallback and a lighter
  alternative.** No exceptions, even for a fade-in.
- **Cost stated in bundle size and install status.** Never hidden.
- **Compositor properties only** on hot paths.
- **Cap UI transitions at 500ms.**
- **Vestibular-safe defaults.** Reduced-motion is the escape hatch, not
  the primary defence.
- **Order recommendations lightest first.**
- **No motion when the reference doesn't want it.** Some sites read as
  considered *because* they don't move.

## Edge cases

- **User asks for a Three.js hero on a Framer-clone landing page.**
  Present Three.js with the honest cost (150kB + GPU + SEO invisibility)
  and lead with the OGL or WebGL-fragment-shader-only alternative.
- **User wants Lenis smooth scroll on a documentation site.** Push back:
  Lenis is for portfolio / agency sites where scroll *is* the
  interaction. On docs, it fights the reader.
- **No motion libraries installed and the site is Astro.** Anything is
  net-new dependency territory; lead with CSS + View Transitions before
  proposing Motion or GSAP.
- **User wants "some 3D feel".** Ask whether the effect needs to be
  interactive or just decorative. Decorative usually means a shader
  fragment or an SVG, not Three.js.
- **User asks for a hero that scrubs on scroll.** GSAP + ScrollTrigger
  is the standard answer; also offer the CSS `scroll-timeline` variant
  as the lighter alternative, with the browser-support caveat.

## Checks before finishing

- Every recommendation lists library + size + install status.
- Every recommendation has a reduced-motion fallback.
- Every recommendation has a lighter alternative.
- Order is lightest first.
- If the reference doesn't want motion, the pass says so.
