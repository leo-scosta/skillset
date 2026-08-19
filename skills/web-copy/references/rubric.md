# The rubric

Every finding, every rewrite decision, has to map to one of the eight categories
below. If it doesn't fit here, it isn't a finding — it's an opinion. Skip it, or
add it as a rubric line once you can name a source for it.

Score each category **pass / soft / fail**. Report failures first, then softs.
Ignore passes unless the user asked for a full audit.

---

## 1. Clarity

Reader can extract the point without re-reading. Rough targets:

- Flesch reading ease ≥ 60 for marketing pages, ≥ 50 for B2B / technical.
- Average sentence ≤ 20 words. No sentence over 30 without a reason.
- No jargon without a gloss on first use.
- No sentence you have to read twice to parse.

*Sources:* GOV.UK style guide, Plain English Campaign, Ginny Redish, *Letting Go
of the Words*.

## 2. Scannability

Reader can skim and still get the point. F-pattern friendly.

- Descriptive headings — a reader who skims only H1/H2s should understand the
  page. `Pricing that scales with you` beats `Our pricing`.
- One idea per paragraph.
- Bullets where the content is a list. Prose where it isn't.
- Front-load the important word in each heading and each sentence.

*Sources:* Nielsen Norman Group — F-shaped reading pattern; *Microcontent* (Nielsen).

## 3. en-GB compliance

British spelling, punctuation, and idiom throughout. Any American slip is a
fail, not a soft.

- Spellings: `organise`, `colour`, `centre`, `analyse`, `programme` (as noun),
  `licence` (noun) / `license` (verb), `travelled`, `favourite`, `defence`.
- Never: `-ize`, `color`, `favorite`, `gotten`, `awesome`, `reach out`, `off of`,
  `real quick`, `oftentimes`.
- Punctuation: single quotes for speech, double for quotes within; no Oxford
  comma unless it removes real ambiguity; en-dashes for ranges (`9–5`), em-dashes
  for parenthetical breaks (` — `, with spaces).
- Dates: `19 August 2026` — never `August 19, 2026` or `08/19/2026`.
- Numbers: spell out one to nine, digits for 10+; `£1,000` not `$1,000`; use
  `%` in body copy, `per cent` in formal contexts if the client prefers.
- Idiom: `at the weekend` not `on the weekend`; `in hospital` not `in the
  hospital`; `different from`, not `different than`.

Full list in `european-english.md`.

## 4. SEO hygiene

The page can be found and earns the click.

- Exactly one `<h1>`.
- `<title>` ≤ 60 characters, includes the target keyword, reads as human copy.
- `<meta name="description">` ≤ 155 characters, earns the click (benefit +
  proof + soft CTA), includes the keyword once.
- URL slug is short, lower-case, hyphenated, keyword-bearing.
- Target keyword appears in H1, first paragraph, and at least one H2. Never
  stuffed — repetition should feel natural to a reader who doesn't know SEO.
- Image `alt` text describes the image; empty alt (`alt=""`) is correct for
  purely decorative images.
- Internal links: at least one from a body page to a conversion page, and one
  from a conversion page to a supporting resource.
- Answers the reader's question above the fold. Google's Helpful Content system
  rewards this.

*Sources:* Google Search Central — SEO Starter Guide; Google — Creating
helpful, reliable, people-first content; Moz Beginner's Guide; Ahrefs on-page
SEO guide.

## 5. Persuasion

Copy earns the action without leaning on tricks.

- At most one Cialdini principle per section (social proof, authority,
  reciprocity, commitment/consistency, liking, scarcity, unity). Overusing them
  reads as manipulation.
- Objections addressed near the CTA, not buried in an FAQ (`Free — no card`,
  `Cancel any time`, `Setup in under 10 minutes`).
- Specificity beats vagueness. `Cut invoice time from 40 minutes to 4` beats
  `save time`.
- Match the reader's stage of awareness (Schwartz). Unaware readers need a story;
  most-aware readers just need the offer. Never sell the problem to someone
  already sold on the solution.

*Sources:* Cialdini, *Influence* (2021); Schwartz, *Breakthrough Advertising*;
Joanna Wiebe, Copyhackers.

## 6. CTA quality

Every CTA is verb-led and specific.

- Verb + object: `Get my quote`, `Start free`, `See the demo`, `Book a call`,
  `Download the guide`.
- Never: `Submit`, `Click here`, `Learn more`, `Continue`, `Get started` (too
  generic on its own — pair with an object: `Get started for free`).
- First-person if it lifts click-through (`Get my quote` > `Get your quote`);
  don't force it if it reads odd.
- Friction acknowledged inline: `Free — no card`, `2-minute setup`, `Instant
  download`.
- One primary CTA per section. Secondary CTAs may exist but must be visibly
  lighter (ghost button, text link).

*Sources:* Copyhackers — button copy; ContentVerve / Michael Aagaard A/B tests
(via CXL); Nielsen Norman — CTA design.

## 7. Tone

Professional-friendly by default. Overridable per run.

- Contractions on: `you're`, `we've`, `it's`.
- Second person, singular: `you`, not `our customers`, not `users`.
- Active voice ≥ 80%. Passive is fine when the agent is genuinely unknown.
- Exclamation marks off unless the brand voice explicitly wants them. Cap at
  one per page even then.
- No stock openers: no `In today's fast-paced world`, no `We are excited to
  announce`, no `Welcome to our website`, no `Are you tired of…`, no
  `Imagine a world where…`.
- Avoid corporate hedges: `solutions`, `leverage`, `synergy`, `world-class`,
  `robust`, `cutting-edge`, `best-in-class`.

*Sources:* Mailchimp Content Style Guide; Shopify Polaris — Content; Microsoft
Writing Style Guide; GOV.UK style guide.

## 8. Trust

Every claim is earned or removed.

- No unverifiable superlatives (`best`, `world-class`, `leading`, `#1`) unless
  the user supplies proof and it can be cited inline (`Rated #1 by G2, winter
  2025`).
- Social proof placed near the ask, not at the bottom. Named customers >
  logo wall > generic testimonial > "trusted by thousands".
- Specific numbers over round ones (`3,412 businesses` > `thousands of
  businesses`) — but never invent them.
- Author byline / date on any blog or resource page. Google's E-E-A-T
  (Experience, Expertise, Authoritativeness, Trust) checks for this.
- Regulated claims (medical, financial, legal) flagged for the user to verify;
  never softened or invented by the skill.

*Sources:* Baymard Institute — trust signals; Google — E-E-A-T guidance;
NN/g — social proof placement.

---

## How to use the rubric in review mode

1. Read the copy end-to-end once, no notes. Form the verdict line.
2. Read again, marking issues against categories 1–8 in order.
3. In the findings table, group by category, list highest severity first.
4. Rewrite in one pass. Re-run categories 3 (en-GB), 6 (CTA), and 8 (trust) on
   the rewrite before returning it.

## How to use the rubric in draft mode

1. Pick the framework from `frameworks.md`. Name it in output.
2. Write the draft.
3. Self-check against categories 3, 4, 6, 7, 8 before returning. Fix in place;
   don't ship a draft with a rubric fail.
