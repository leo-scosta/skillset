# On-page SEO checklist

Distilled from Google Search Central, Moz's Beginner's Guide, and Ahrefs' on-page
SEO guide (see `sources.md`). SEO tactics change; the fundamentals below don't.
When Google's guidance conflicts with anything else, Google wins.

The single most important rule: **write the page for the reader first, then check
it hits these boxes**. A page that reads well and answers the question but skips
some of these is fine. A page that hits every box but reads like SEO spam is not.

---

## The keyword

Every page targets one primary keyword and, ideally, two or three secondary
related terms.

- Pick the primary keyword from what a real reader would type — not what has
  the highest search volume. `pricing for accountancy software` beats
  `accountancy software pricing solutions`.
- Secondary keywords are variants and adjacent questions the page also answers:
  `bookkeeping software pricing`, `accountancy platform cost`, `how much does
  bookkeeping software cost`.
- If the skill has no way to check search volume (no keyword MCP connected),
  say so. Recommend the user run the shortlist through Google Keyword Planner,
  Ahrefs, or Semrush before locking the choice.

## The title tag

- ≤ 60 characters, ideally 50–58. Google truncates in the SERP around 60.
- Primary keyword near the front.
- Reads as human copy, not a keyword list.
- Includes brand at the end when it earns click-through: `Pricing that scales
  with you — Acme Books`. Drop the brand if the page is a resource / blog and
  space is tight.
- One per page. Never duplicate across the site.

Bad: `Bookkeeping Software Pricing | Best Prices | Cheap Bookkeeping | Acme`
Good: `Bookkeeping software pricing that scales with you — Acme`

## The meta description

- ≤ 155 characters (mobile truncates earlier; aim for 140).
- Not a ranking factor directly, but it drives click-through, which is.
- Structure: benefit + proof + soft CTA.
- Includes the primary keyword once, naturally.
- Never duplicated across pages.

Bad: `We are a leading provider of bookkeeping solutions for businesses.`
Good: `Bookkeeping software from £8/month. Set up in 10 minutes, cancel any
time. Trusted by 3,000+ UK small businesses.`

## The URL slug

- Short, lowercase, hyphenated, keyword-bearing.
- Skip filler words (`and`, `the`, `for`) unless they change meaning.
- No dates in evergreen URLs — `/pricing-2024` ages badly.
- Never change a URL that's already ranking. If a change is unavoidable, 301
  redirect the old one.

Bad: `/PricingForBookkeepingSoftware2024.html`
Good: `/bookkeeping-software-pricing`

## Headings (H1, H2, H3…)

- **Exactly one H1.** Contains the primary keyword. Reads as the page's
  promise, not its filename.
- H2s are descriptive — a reader who skims only H1/H2s should understand the
  page. Include secondary keywords where they read naturally.
- H3s and below are for structure inside a section. Don't skip levels
  (H2 → H4 is a bug).
- Never use headings for visual size. That's what CSS is for.

## The first paragraph

- Answer the reader's implicit question in the first two sentences.
- Include the primary keyword once, naturally.
- No throat-clearing (`Welcome to our website`, `In this article we will
  discuss`, `Have you ever wondered…`).

## Body copy

- Primary keyword in the first paragraph, one H2, and the closing paragraph.
- Never above ~1% density. If the keyword shows up more than once every 100
  words, it's over.
- Use synonyms and related terms freely — Google's semantic understanding
  rewards natural language, not repetition.
- Answer follow-up questions inside the page. Google's "People Also Ask" tells
  you what those are.

## Images

- Every content image has an `alt` that describes what it shows. Not
  `image1.png`, not `hero graphic`.
- Purely decorative images: `alt=""` (empty, not omitted).
- Descriptive filenames: `bookkeeping-dashboard-overview.png`, not `IMG_2413.png`.
- Compress — a hero image over 200KB is a Core Web Vitals problem.

## Internal linking

- Every conversion page (pricing, contact, sign-up) has at least one link
  pointing to it from a body page.
- Every body page has at least one link out to a supporting resource or a
  conversion page.
- Anchor text is descriptive: `see our pricing`, not `click here`, not `read
  more`.
- Don't link the same phrase to different destinations across the site.

## External linking

- Cite sources when the copy makes a factual claim. Signals trust to both
  readers and Google.
- Link out to authoritative domains (`gov.uk`, `.ac.uk`, industry bodies) where
  relevant.
- `rel="nofollow"` on sponsored or paid links. `rel="ugc"` on user-generated.

## Schema markup (a note, not a fix)

The skill writes copy, not code. But flag it when the page would benefit from
schema:

- Product page → `Product` + `Offer` + `AggregateRating`.
- FAQ block → `FAQPage`.
- Article / blog → `Article` (+ `Person` for author, `Organization` for publisher).
- Local business → `LocalBusiness`.

Recommend the user check with [Google's Rich Results Test](https://search.google.com/test/rich-results)
after implementation.

## The "helpful content" gut check

Google's Helpful Content system asks: was this written for people, or for
search engines? A checklist that mirrors Google's own signals:

- Does the page have a clear primary audience?
- Would that audience find this genuinely useful?
- Does the author (or brand) have real expertise on the topic?
- Would a reader feel their time was well spent?
- Would they be comfortable sharing this with a colleague?

If any answer is *no*, the copy has a problem no on-page tweak will fix — go
back to the brief.

*Source:* [Creating helpful, reliable, people-first content](https://developers.google.com/search/docs/fundamentals/creating-helpful-content).

## What NOT to do

- Keyword stuffing (any density above ~1% for the primary term).
- Doorway pages (near-identical pages targeting variants of the same term).
- Auto-generated content dressed as human writing.
- Hidden text (white-on-white, `display:none`, `text-indent:-9999px`).
- Buying links, participating in link exchanges.
- Duplicate content across the site — canonicalise if variants must exist.

All of the above are covered in [Google Search Essentials](https://developers.google.com/search/docs/essentials)
and violating them is a manual-action risk.

## Output block for review / draft mode

Every page-length rewrite returns an SEO block in this shape:

```
Title:       Bookkeeping software pricing that scales with you — Acme (54 chars)
Meta:        Bookkeeping software from £8/month. Set up in 10 minutes, cancel
             any time. Trusted by 3,000+ UK small businesses. (149 chars)
H1:          Pricing that scales with you
Slug:        /bookkeeping-software-pricing
Keyword:     bookkeeping software pricing (primary)
             bookkeeping software cost, accountancy platform pricing (secondary)
Internal:    → link from `/features` and `/how-it-works`
             ← link out to `/case-studies` and `/free-trial`
```
