# Review-mode output template

Use this shape verbatim for any review-mode return. Skip sections that don't
apply, but keep the order.

---

## Verdict

*One sentence. What's the biggest problem, or what's working. No hedging.*

Example:
> The hero doesn't say who this is for, and the CTA reads `Learn more` — both
> together will halve conversion. Everything else is fixable in a pass.

---

## Findings

| Location | Issue | Severity | Suggested rewrite |
| --- | --- | --- | --- |
| H1 | Not benefit-led | High | `Stop chasing invoices at the weekend.` |
| Subhead | No audience named | High | Name the reader in ≤ 20 words. |
| CTA | `Learn more` is vague | High | `See how it works` or `Try Acme free` |
| Para 2 | Two sentences over 30 words | Medium | Split each into two. |
| en-GB | `organize`, `favorite`, `color` | High | Replace with en-GB spellings throughout. |
| SEO | Meta description missing | Medium | Draft below. |
| Trust | `world-class` unbacked superlative | Medium | Remove or add proof. |

Group by category. Rank high-severity first. Every row maps to a line in
`references/rubric.md`.

---

## Clean rewrite

Rewrite the copy in full, no commentary inside. Mark headings clearly:

```
[H1] Stop chasing invoices at the weekend.

[Sub] Acme sends the reminders in your tone of voice, so you get paid on time
without becoming the bad guy.

[CTA] Try Acme free  ·  No card, cancel any time
[Trust] Trusted by 3,412 UK small businesses.

[H2] How it works
[Body] …
```

The rewrite should be pasteable — a designer should be able to drop it into the
page without editing.

---

## SEO block

```
Title:       [≤ 60 chars, with character count]
Meta:        [≤ 155 chars, with character count]
H1:          [as written above]
Slug:        [proposed URL slug]
Keyword:     [primary keyword, then 2–3 secondary]
Internal:    → link from [existing pages]
             ← link out to [supporting pages]
```

Only for page-length rewrites. Skip for a single-CTA or single-line review.

---

## What I did not change and why

Bullet list. Anything the user might expect to see changed but wasn't.

- `[Specific claim]` — regulated language, needs legal sign-off before I
  rewrite. Flagged for you to verify.
- `[Product name]` — kept the current spelling / capitalisation as it appears
  in your brand guidelines.
- `[Legacy CTA on this section]` — kept because you mentioned it's tied to an
  active ad campaign; changing the label would break the tracking.

---

## Rubric self-check (short version, always run before returning)

- [ ] One H1 in the rewrite.
- [ ] en-GB throughout (no `-ize`, no `color`, no `favorite`, no Americanisms).
- [ ] Every superlative is backed or removed.
- [ ] Every CTA is verb-led and specific.
- [ ] SEO block present (for page-length rewrites).
- [ ] No stock openers (no `In today's fast-paced world`, no `Welcome to`).
