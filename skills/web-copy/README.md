# web-copy

Reviews or drafts website copy at the level of a senior copywriter in a digital
agency. European English by default, tuned for SEO, conversion, and a
professional-friendly tone.

## The problem

Most AI-written web copy has the same tells: American spellings creeping into a
British site, stock openers ("In today's fast-paced world…"), unverifiable
superlatives ("world-class", "cutting-edge"), CTAs that say `Learn more`, meta
descriptions that ignore the reader's search intent, and paragraphs that would
score below 40 on the Flesch reading ease scale.

A senior copywriter fixes all of those in one pass without thinking, because
they've internalised a rubric — plain-English rules, on-page SEO rules,
conversion frameworks, and a house style. The rubric is what's missing when a
general-purpose model writes copy: it has the vocabulary but not the checklist.

## The approach

Encode the rubric explicitly, then load the reference material on demand rather
than upfront. `SKILL.md` stays small and always-loaded; the depth (frameworks,
author summaries, en-GB spelling lists, page patterns) lives in `references/`
and only enters context when a specific run needs it.

Two modes on the same rubric:

- **Review** — score existing copy, mark up issues, return a clean rewrite plus
  an SEO block.
- **Draft** — take a brief, pick a framework, write the page, self-check.

Both funnel through the same eight-line rubric (`references/rubric.md`) so the
output stays consistent between runs and between modes. Everything the skill
recommends should be traceable back to a rubric line — no invented rules.

## The reference base

The skill is deliberately built on named, citable sources rather than the
model's general knowledge of "good copy". The full list is in
`references/sources.md` and `references/authors.md`, but the anchors are:

- **Plain English & en-GB** — GOV.UK content design, GOV.UK style guide, Plain
  English Campaign.
- **UX writing** — Nielsen Norman Group, Microsoft Writing Style Guide,
  Mailchimp Content Style Guide, Shopify Polaris, Atlassian Design.
- **SEO** — Google Search Central, Moz Beginner's Guide, Ahrefs on-page SEO
  guide. HubSpot / Neil Patel / Backlinko are included as a noisier second tier.
- **Conversion** — Baymard Institute, CXL, Copyhackers.
- **Persuasion** — Cialdini's seven principles, StoryBrand SB7.
- **Author canon** — Ogilvy, Hopkins, Schwartz, Caples, Halbert, Sugarman,
  Kennedy, Bly, Collier, Wiebe, Handley, D'Souza, Kolenda, Laja, Redish,
  Richards, Podmajersky, Yifrah, Solis, Fishkin, Haynes, Shepard, Slawski,
  Pulizzi, Crestodina, Ariely, Eyal, Heath brothers.

Loading these as references (rather than trying to summarise them inside
`SKILL.md`) keeps the always-loaded surface small and lets the agent cite a
specific author when it recommends a specific move.

## MCPs and connectors

Ships with the built-in `WebFetch` tool as the only external data path. That
covers fetching a live page to review, or pulling one of the reference URLs on
demand, without any install or API key.

Two optional add-ons are mentioned but not set up:

- **[Firecrawl MCP](https://github.com/mendableai/firecrawl-mcp-server)** — free
  and self-hostable; cleaner extraction from JS-heavy pages than `WebFetch`.
- **Google Search Console MCP** — free from Google, but only useful on sites
  the user has verified. Gives actual queries people already type to land on
  the page, which is gold for rewriting titles and H1s.

Paid SEO connectors (DataForSEO, Ahrefs, Semrush) were deliberately excluded to
keep the skill portable and zero-cost.

## Known limits

- **Language is en-GB only.** For US English, Spanish, French, etc., the skill
  can still review structure, SEO, and persuasion, but shouldn't be trusted for
  line-level rewriting outside en-GB.
- **No live keyword data.** With `WebFetch` only, the skill can't tell you the
  monthly search volume of a term. It can tell you whether a page targets a
  plausible keyword, has good on-page hygiene, and is written for the reader —
  which is 80% of what's usually broken.
- **Compliance-heavy copy is flagged, not fixed.** Regulated claims (medical,
  financial, legal) are surfaced for the user to verify with the client's legal
  team. The skill won't paraphrase them.
- **Not a brand-voice generator.** If the user has a real brand voice document,
  the skill will defer to it. Without one, it uses professional-friendly as the
  default. It doesn't invent a house style from thin air.
