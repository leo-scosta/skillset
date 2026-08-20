---
name: web-copy
description: Review or draft website copy at the level of a senior copywriter in a digital agency - clear, persuasive, friendly, SEO-sound, in European English (en-GB). Use when the user wants to improve, rewrite, polish, audit, or draft copy for a landing page, hero, pricing page, about page, feature page, product page, blog post, meta title/description, CTA, or microcopy. Enforces plain-English clarity, en-GB spelling and tone, on-page SEO rules, conversion frameworks (AIDA, PAS, StoryBrand, Before-After-Bridge, Schwartz's stages of awareness), and Cialdini-grade persuasion. Two modes - review-mode critiques and rewrites existing copy against a rubric, draft-mode writes new copy from a brief.
license: MIT
metadata:
  author: leandro-costa
  version: "1.1"
  repository: skillset
---

# Web Copy

Improves or drafts website copy that reads like it came from a senior copywriter
in a digital agency: clear, persuasive, friendly, SEO-sound, in European English.

Two modes, one rubric:

- **Review** — the user pastes copy (or a URL or a file path). Score against the
  rubric, mark up issues, return a clean rewrite.
- **Draft** — the user gives a brief. Pick a framework, draft the page, then
  self-check against the same rubric before returning.

Default tone is **professional-friendly** (Mailchimp / Shopify Polaris territory).
Override with a `tone:` line in the brief if the user wants formal or playful.

Language default is **en-GB**. Never emit `-ize` spellings, `color`, `favorite`,
`gotten`, `awesome`, `reach out`, single-word Americanisms, or the Oxford comma
(unless it removes real ambiguity).

## Process

### 1. Decide the mode

If the user pasted or pointed at existing copy → **review**.
If the user described a page they want written → **draft**.
If ambiguous, ask once.

For a URL, fetch it with the built-in `WebFetch` tool and pull the visible copy
before scoring. For a file path, `Read` it.

### 2. Load the rubric

Read `references/rubric.md` before scoring or writing anything. Every finding,
every rewrite decision, has to map to a rubric line. This is the anchor that
keeps output consistent between runs.

Load these on demand — do not load them upfront:

- `references/european-english.md` — every run (en-GB is the default).
- `references/seo-checklist.md` — for any page that will be indexed.
- `references/frameworks.md` — before drafting or when a rewrite needs a
  structural fix, not a line-level fix.
- `references/microcopy.md` — for buttons, forms, errors, empty states, 404s.
- `references/page-patterns.md` — when the brief is "hero", "pricing", "about",
  "features", "FAQ", "testimonials", or "footer".
- `references/authors.md` — when justifying a specific move (cite the author
  the rule comes from, e.g. Schwartz on awareness, Sugarman on the slippery slide,
  Ogilvy on headlines). Adds credibility, keeps the skill from inventing rules.
- `references/sources.md` — when the user asks *why* a rule exists or wants
  further reading.
- `references/llm-fingerprints.md` — every draft and every review, not
  optional. Enforcement backbone for category 9 (voice authenticity).

### 3. Review mode — the output shape

Return in this order, in one message:

1. **Verdict** — one sentence. What's the biggest problem, or what's working.
2. **Findings table** — Markdown table with columns: *Location* (which
   sentence / heading / CTA), *Issue* (rubric category), *Severity*
   (high / medium / low), *Suggested rewrite*.
3. **Clean rewrite** — the full copy, rewritten, ready to paste. No commentary
   inside the rewrite.
4. **SEO block** — proposed `<title>` (≤ 60 chars), meta description
   (≤ 155 chars), suggested H1, target keyword, and any internal-link
   opportunities you spotted.
5. **What I did not change and why** — anything the user might expect to have
   been touched but wasn't (e.g. a legally required disclaimer).

Use the layout in `assets/before-after.md` as the template.

### 4. Draft mode — the output shape

1. **Chosen framework** — one line. *"Using PAS because the audience is
   problem-aware but not solution-aware (Schwartz stage 2)."* If no framework
   fits, say so and write plainly.
2. **The draft** — the full page copy, with headings marked (H1/H2/H3), body
   paragraphs, CTAs, and any microcopy the page needs.
3. **SEO block** — same fields as review mode.
4. **Self-check** — a two-line pass confirming en-GB, one H1, tone, active-voice
   ratio, no unverifiable superlatives, and no LLM fingerprints (see
   `references/llm-fingerprints.md`).

If the brief is missing something critical (audience, primary action, offer,
brand voice), ask **once**, list the missing items together, then proceed with
sensible defaults if the user says "your call".

Use the layout in `assets/brief-template.md` for what a good brief contains.

### 5. Always-on rules

- **One H1 per page.** More than one is an SEO bug, not a style choice.
- **Benefits before features.** Lead every section with what the reader gets,
  not what the product does.
- **Specific numbers over vague claims.** "Cut invoice time from 40 minutes to
  4" beats "save time".
- **No unverifiable superlatives** (`best`, `world-class`, `leading`) unless the
  user supplies proof. If they do, cite it inline.
- **No stock openers.** No "In today's fast-paced world", no "We are excited to
  announce", no "Welcome to our website".
- **Active voice ≥ 80%.** Passive is fine when the agent is genuinely unknown
  or unimportant.
- **Contractions on** for professional-friendly. Off for formal.
- **Exclamation marks off** unless the user's brand voice explicitly wants them.
- **CTAs are verb-led** (`Get my quote`, `Start free`, `See the demo`). Not
  `Submit`, `Click here`, or `Learn more`.
- **One primary CTA per section.** Secondary CTAs may exist but must not
  compete for weight.
- **Voice authenticity check.** Before returning any draft or rewrite, scan
  against every pattern in `references/llm-fingerprints.md`. Every fingerprint
  is a fail — fix in place, don't ship.

## Edge cases

- **User pasted non-copy** (code, JSON, a brief instead of the copy) — ask
  which mode they want.
- **User asked for US English** — honour it, but flag once that the skill
  defaults to en-GB.
- **User asked for another language** — say the skill is en-GB only; offer to
  do the strategic review (rubric, structure, SEO) and leave the language
  version to them.
- **Legal, medical, financial claims** — do not soften or invent them. Flag any
  claim that reads as regulated and ask the user to confirm the source.
- **User's brand voice already exists** (style guide, tone doc) — read it,
  defer to it wherever it conflicts with the skill's defaults, and say so in
  the verdict line.
- **Very short copy** (a single CTA, a headline) — skip the findings table;
  return the rewrite plus one line of rationale.

## Checks before finishing

- Every finding in the table maps to a rubric line in `references/rubric.md`.
- The clean rewrite is self-contained — a reader could paste it into the page
  without editing.
- SEO block is present for any page-length rewrite (title, meta, H1, keyword).
- en-GB check has been run: no `-ize`, no `color`, no `favorite`, no Americanisms.
- One H1 in the rewrite. Not zero, not two.
- Every superlative is backed or removed.
- Voice-authenticity scan run: em-dashes ≤ 1 per 100 words, no double-"I"
  clauses without a third repetition, no AI-slop vocabulary
  (`supercharged`, `AI-powered`, `harnessing AI`, etc.), no "As an X"
  openers, no "In conclusion" closers, no X-not-Y aphoristic paragraph
  closers. Full list in `references/llm-fingerprints.md`.
