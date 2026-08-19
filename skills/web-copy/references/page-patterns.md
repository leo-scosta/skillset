# Page patterns

Recurring patterns for the pages every website has. Each pattern lists what
belongs there, what to skip, and one worked example.

Patterns aren't formulas. If the brief calls for a different shape, follow the
brief. Use these when the user asks for "a hero", "a pricing page", "an about
page" and doesn't specify the structure.

---

## Hero (top of the home page or landing page)

**Answer three questions above the fold, in this order:**

1. **What is this?** (H1, ≤ 8 words, benefit-led)
2. **Who is it for and what do they get?** (subhead, ≤ 20 words)
3. **What do I do next?** (primary CTA + friction-remover microcopy)

**Include:**
- H1 (one, keyword-bearing).
- Subhead that names the audience and the outcome.
- Primary CTA button.
- Optional: secondary CTA (`See a demo`), one-line trust signal
  (`Trusted by 3,000 UK small businesses`), a supporting image or product shot.

**Skip:**
- Rotating carousels (readers ignore them, and they hurt CLS scores).
- Multiple competing CTAs.
- Vague slogans (`Elevating your business`, `The future of work`).

**Example:**
```
H1:    Stop chasing invoices at the weekend.
Sub:   Acme sends the reminders in your tone of voice, so you get paid on time
       without becoming the bad guy.
CTA:   Try Acme free  ·  No card, cancel any time
Trust: Trusted by 3,412 UK small businesses.
```

---

## Feature page

One page per major feature. Answers: *what does it do, why does it matter to me,
what does it look like, what's the proof, what next.*

**Structure:**

1. H1 with the benefit, not the feature name.
2. One-paragraph explainer (≤ 60 words).
3. Screenshot or short demo video.
4. 3 sub-benefits, each with a heading + one paragraph + optional icon.
5. Named customer quote (avoid anonymous testimonials).
6. FAQ block (3–5 questions).
7. CTA repeated.

**Skip:**
- Feature grids where every tile says the same thing three ways.
- Comparison tables against unnamed competitors.

**FAB inversion:** in the copy, lead with the benefit; keep the feature as the
proof point.

---

## Pricing page

The reader is at Schwartz stage 5 (most aware). Don't re-sell — deliver the
offer.

**Include:**

- Prices in the currency the reader expects (£ for a UK site).
- What's included at each tier, in the reader's language.
- What's *not* included (transparent > tricked).
- Trial or money-back terms, near the price, not in the footer.
- One recommended tier, visually highlighted.
- FAQ block: the six questions everyone asks (billing, cancellation, upgrades,
  tax/VAT, contracts, seat pricing).
- Social proof near the CTA (specific numbers, named customers).
- Regulator-safe language on any recurring billing (`Cancel any time — no
  charge after cancellation`).

**Skip:**
- `Contact us for pricing` unless you genuinely can't publish (enterprise-only
  tier is a legitimate case).
- Anchoring against a fake "was" price.
- More than three tiers unless the audience genuinely splits that way.

**Rules:**
- Explain each tier by *who it's for*, not by what it costs. `For small teams`,
  `For growing companies`, `For enterprise`.
- Always show what's included at each tier, in the order of importance to the
  reader.

---

## About page

The most-read and least-loved page on most sites. Readers land here to decide
if they trust you.

**Include:**

- What you do, in one sentence, before anything else.
- Why you do it — the founding story or the belief that drives the work.
- Who you are — real people, real names, real photos (or say the team is
  distributed / private and skip photos).
- Where you are — legal entity, registered address, at least a country.
- What matters to you — values only if they change decisions. Skip if they're
  just words.

**Skip:**

- Timelines of the company's founding rounds. Nobody cares.
- Generic mission statements (`We empower businesses to reach their potential`).
- Stock photos of diverse teams pointing at laptops.

---

## Contact page

Job: get the message to the right person, or set expectations for reply time.

**Include:**

- Primary email (support, sales, or a general inbox — pick one).
- Reply-time expectation (`We reply within 4 working hours, Mon–Fri`).
- Phone number if you answer it. Never publish a phone that goes to voicemail
  and stays there.
- Physical address (legally required in most jurisdictions).
- Company registration number if legally required.
- Optional: contact form, but only if you'll route it faster than email.

**Skip:**
- CAPTCHAs that fail on real users.
- 12-field forms for a simple enquiry.

---

## FAQ block (inside another page)

Answers the questions the reader is silently having, in the reader's words.

**Rules:**

- Real questions, phrased as the reader would ask them.
- 3–7 questions on a hero landing page; up to 12 on a pricing page.
- Answers ≤ 60 words each. If the answer is longer, link to the full page.
- Order by frequency asked, not by ease of answer.
- Use accordion / expand-collapse when there are more than 5.
- Mark up with `FAQPage` schema for SEO.

---

## Testimonial section

Named > anonymous. Specific > vague. Video > text > logo > name.

**A good testimonial names three things:**

1. The situation before the product.
2. The specific change after.
3. The person (name, role, company) with a photo if possible.

**Bad:** "Acme changed my life! — Sarah"
**Good:** "Payroll used to eat every Wednesday morning. With Acme it takes 20
minutes. — Sarah Patel, Operations Manager, Meridian Ltd"

**Placement:**

- Near the CTA, not at the bottom.
- One per section, not a wall of ten.
- Rotate them if you have many, but don't auto-rotate — the reader loses their
  place.

---

## Footer

The reader made it here — they either want a specific thing or they're bouncing.

**Include:**

- Legal essentials: privacy policy, terms, cookie policy (with a "manage
  preferences" link), company registration where required.
- Contact link, address, key inboxes.
- The pages people go looking for that aren't in the main nav: pricing,
  changelog, status page, careers, security.
- Social links if the accounts are actually maintained. A dead Twitter is
  worse than none.
- Newsletter sign-up if the newsletter is active.

**Skip:**
- Duplicating the main nav.
- Language switchers that pop the reader into a broken translation.
- Cookie banners that block the footer permanently.

---

## Blog post / article

Job: rank in search, answer the reader's question, and get the reader to the
next reasonable action.

**Structure:**

1. Headline that promises a specific outcome or answer.
2. Meta description in the SEO block earning the click.
3. Intro of ≤ 80 words that names the reader, the problem, and the promise of
   the piece.
4. Body organised by H2s that a skimmer can navigate.
5. Bullet lists where the content is a list, prose where it isn't.
6. Author byline with photo and credentials (Google's E-E-A-T).
7. Date published and date last updated.
8. Related-reading or CTA at the end — never a dead end.
9. Table of contents if the article is over 1,500 words.

**Skip:**
- The 200-word "history of the topic" intro. Get to the point.
- Padding sentences (`It goes without saying that…`, `In the following
  sections…`).
- "In conclusion" summaries that repeat the body verbatim.

---

## Category / listing page (e-commerce, blog index, resource library)

Job: help the reader find what they want fast.

**Include:**

- One-paragraph intro that names the reader and the category.
- Filters that match the way readers think (by problem, by industry, by size).
- Sort options with sensible defaults.
- Enough copy per item to decide whether to click (image, title, one-line
  summary, price/date/author).

**Skip:**
- Walls of thumbnails with no context.
- Filters that reload the page on every click.

---

## Case study

Long-form proof. Answers: *who was the customer, what was the situation, what
did they do, what changed, in specific numbers.*

**Structure:**

1. Headline: the outcome, not the customer name. (`Meridian cut payroll from
   4 hours to 20 minutes with Acme` beats `Meridian: A case study`.)
2. Customer at a glance: name, industry, size, location.
3. The challenge (one paragraph, specific pain).
4. The approach (what they did with the product).
5. The results (specific numbers, ideally three).
6. A pull quote from a named person at the customer.
7. CTA repeated with a friction-remover (`See a demo` if the reader is
   solution-aware; `Read more case studies` if they're not).

---

## Sign-up / trial / demo page

The reader is close to converting. Every friction is expensive here.

**Include:**

- One CTA. Nothing else in the primary reading path.
- Value reminder above the form (`Free 14-day trial, no card needed`).
- Absolute minimum fields (email + password, or SSO). Everything else can be
  asked later.
- Social proof next to the form.
- Trust signals: security badges, privacy policy link, GDPR statement if EU.
- What happens next: "After signing up, we'll help you import your customers
  in 5 minutes."

**Skip:**
- Long onboarding forms on the first screen.
- Distracting nav — hide or minimise the main navigation on trial pages.
- "How did you hear about us?" (ask on step 2 of onboarding, not on sign-up).
