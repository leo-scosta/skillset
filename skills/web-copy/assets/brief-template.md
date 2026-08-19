# Draft-mode brief template

The information the skill needs before it drafts a page. Ask the user to fill
in the blanks — or extract the fields from whatever the user pastes.

If any of the **required** fields are missing, ask once, list every missing
field together, then proceed with sensible defaults if the user says "your
call".

---

## Required

- **Page type** — hero, home page, pricing page, feature page, about, contact,
  blog post, sign-up, case study, 404, other.
- **Audience** — one sentence. Who is this reader? What do they do, and what
  do they care about?
- **Primary action** — what do you want the reader to do on this page? (Sign
  up, book a demo, download a guide, read the next post, contact sales.)
- **Offer** — what's the product / service / thing being written about?
  Include the elevator description in one sentence.
- **Awareness stage** — pick from Schwartz's five: unaware, problem-aware,
  solution-aware, product-aware, most aware. If you don't know, best guess is
  usually *solution-aware* for organic traffic and *problem-aware* for paid.

## Recommended

- **Target keyword** — the primary phrase you want the page to rank for. If
  unknown, the skill will suggest a shortlist.
- **Brand voice** — one line, or a link to a style guide. Default is
  professional-friendly (Mailchimp / Shopify Polaris territory). Override with
  "more formal" (GOV.UK) or "more playful" if the brand needs it.
- **Proof** — named customers, specific numbers, testimonials, certifications,
  awards. Anything the skill can point to. Without this, the copy stays
  claim-light.
- **Framework preference** — if you already know you want AIDA / PAS /
  StoryBrand / BAB / FAB / PASTOR / 4Ps, say so. Otherwise the skill picks
  based on the audience and awareness stage.

## Optional

- **Word count / length target** — hero (≤ 100 words), landing page (≤ 400),
  feature page (400–800), blog post (800–2,000), sales page (1,500–4,000).
- **Existing copy to work from** — pasted, URL, or file path. If provided,
  the skill will read it before drafting so the voice matches.
- **Do-not-say list** — words, phrases, or claims the brand can't use for
  legal, regulatory, or competitive reasons.
- **Related pages** — URLs of other pages on the site the draft should link to
  or from.

---

## Example filled-in brief

```
Page type:         Pricing page
Audience:          UK small-business owners (2–15 staff), non-technical,
                   currently doing bookkeeping in a spreadsheet.
Primary action:    Start a 14-day free trial.
Offer:             Acme Books — cloud bookkeeping with automated invoice
                   reminders. Priced £8, £18, £45 per month.
Awareness stage:   Product-aware — they've read the home page and features.
Target keyword:    bookkeeping software pricing (primary)
                   accountancy software cost (secondary)
Brand voice:       Professional-friendly. Direct, no jargon, no exclamation
                   marks.
Proof:             3,412 businesses use Acme. HMRC-recognised. Reviews on G2:
                   4.7/5 (211 reviews). Named customer: Meridian Ltd.
Do-not-say:        "Cheaper than Xero" (legal risk). "Perfect for" (banned by
                   ASA in this category).
Related pages:     /features , /how-it-works , /case-studies/meridian
```

---

## Fields extracted from a URL (if the user just pastes a link)

If the user pastes a URL and says "rewrite this pricing page", extract these
before asking clarifying questions:

- **Page type** — from the URL structure, the `<title>`, and the H1.
- **Current audience signal** — read the copy for who it addresses.
- **Current offer** — pricing, plans, features listed.
- **Current proof** — testimonials, logos, numbers on the page.
- **Current keyword** — the term the `<title>` and H1 target.

Then ask only for the fields you can't infer (audience precision, awareness
stage, brand voice, do-not-say).
