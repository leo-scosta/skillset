# Microcopy

The small copy that turns a browsing user into an acting user — buttons, form
labels, help text, errors, empty states, 404s, tooltips, confirmations.
Distilled from Kinneret Yifrah's *Microcopy: The Complete Guide*, Shopify
Polaris, Mailchimp, Microsoft Writing Style Guide, and Nielsen Norman Group's
form-usability research.

The rule that governs everything below: **microcopy exists to remove friction
at the exact moment the reader might stop**. Every word is a nudge or a
blocker.

---

## CTAs (call-to-action buttons)

**Structure:** verb + object.

| Weak | Strong |
| --- | --- |
| Submit | Send my message |
| Click here | Get the pricing guide |
| Learn more | See how it works |
| Continue | Continue to payment |
| Get started | Start free — no card |
| Sign up | Create my free account |

**Rules:**

- First-person if it lifts click-through (`Get my quote` > `Get your quote`).
  Test both if you can; when in doubt, first-person.
- Acknowledge friction inline, not in a separate paragraph: `Free — no card`,
  `2-minute setup`, `Cancel any time`, `Instant download`.
- One primary CTA per section. Secondary CTAs are visibly lighter (ghost
  button, text link) and lead to lower-commitment actions (`See a demo`, `Talk
  to sales`).
- Sentence case, not title case: `Book my demo` not `Book My Demo`.
- Short. If the button needs more than 5 words, add a subline underneath, not
  more button text.

**Never:**

- `Submit` — meaningless outside a form context.
- `Click here` — old web convention, unhelpful, bad for accessibility.
- `Learn more` — vague. What will they learn?
- `OK` on a destructive action — always name the action (`Delete forever`,
  `Cancel subscription`).

---

## Forms

**Field labels**

- Above the field, left-aligned. Placeholder text is not a label.
- Sentence case, no colon: `Email address`, not `Email Address:`.
- Descriptive, not clever: `Your work email` beats `Where should we send it?`.

**Help text**

- Only when the field genuinely needs it. Don't gloss `First name`.
- Below the field, smaller and lighter — always visible, not on-focus only
  (that hides help from returning users).
- Explains *why* or *what format*, not *how to type*.
  - Good: `We use this to send your invoice — never for marketing.`
  - Bad: `Enter your email in the box above.`

**Placeholder text**

- Optional. Use it for format hints (`name@company.com`), not for labels.
- Never rely on it alone — placeholder text vanishes on focus and fails
  accessibility contrast.

**Required fields**

- Mark optional fields, not required ones (unless most fields are optional).
- If you must mark required, use `(required)` — the red asterisk convention is
  worse for accessibility and no clearer.

**Button copy on submit**

- Restate what happens: `Send message`, `Create account`, `Save changes`.
- Never `Submit` on its own.

---

## Errors

The user made a mistake, or the system did. Either way, the copy has three
jobs: tell them what happened, tell them how to fix it, don't blame them.

**Structure:** What went wrong + how to fix it + friendly close if useful.

| Bad | Good |
| --- | --- |
| Invalid input | That email doesn't look right — check for a typo? |
| Error 500 | Something went wrong on our end. We're looking at it — try again in a moment. |
| Password does not meet requirements | Passwords need at least 8 characters, including a number. |
| This field is required | We need your email to send the receipt. |
| An unknown error occurred | Something went wrong. If it happens again, email hello@acme.com. |

**Rules:**

- Never blame the user. `You entered an invalid email` → `That email doesn't
  look right`.
- Never say "error" without saying what to do about it.
- Never expose stack traces or codes in user-facing errors. If a code helps
  support, include it small underneath (`Ref: 502-a1b`).
- Match the tone of the rest of the product. A playful brand can be playful in
  errors; a formal brand cannot.

*Source:* Nielsen Norman — error message guidelines.

---

## Empty states

The screen that shows when there's nothing to show yet — no messages, no files,
no results.

Three-part structure:

1. **What's here (or missing).** `You haven't sent any invoices yet.`
2. **Why it matters / what they can do.** `Once you do, they'll show up here
   with their status.`
3. **A CTA that starts them off.** `Create your first invoice`.

Never leave an empty state actually empty. It's the highest-value onboarding
opportunity on the page.

*Source:* Shopify Polaris — Empty states.

---

## 404 pages

The page they wanted doesn't exist. The 404 has to help them find what they
meant.

- Say what happened, in plain language. Not `404 Not Found` on its own.
- Offer a way forward — link home, link to the top 3–5 things the reader might
  want, or offer search.
- Keep the tone; the 404 is often the first page a new reader sees (linked
  from an old article, a broken share).
- Don't blame the reader. `The link might be old` is better than `You typed
  the wrong URL`.

Example:

```
We couldn't find that page.

The link might be old, or the page might have moved. Try:

• The home page: [Home]
• Our pricing: [Pricing]
• The blog: [Read the blog]

Still stuck? Email hello@acme.com and we'll help.
```

---

## Confirmations & success states

The user did the thing. Confirm it, tell them what happens next, offer the
next reasonable action.

| Bad | Good |
| --- | --- |
| Success! | Message sent — we usually reply within 4 working hours. |
| Payment received | Payment received. Your first invoice will arrive on 1 September. |
| Account created | You're in. Next: import your customers. [Import customers] |

**Rules:**

- Set expectation for what happens next.
- Don't stop at "success" — offer the natural next action.
- Time is more useful than "soon". `4 working hours`, `Monday morning`, `by
  tomorrow`.

---

## Tooltips and inline help

- Use sparingly. If a label needs a tooltip, the label is wrong first.
- Trigger on hover *and* focus (keyboard users).
- One sentence, no formatting.
- Never hide critical information in a tooltip.

---

## Loading, waiting, and progress

- Under 1 second: no indicator.
- 1–10 seconds: spinner + a single line (`Saving…`, `Uploading your file…`).
- 10+ seconds: progress bar with a time estimate if possible.
- 30+ seconds: let the user leave the page (`We'll email you when it's ready`).

Copy that lands well during waits:

- `Working on it — this usually takes about 20 seconds.`
- `Uploading — 60% done`
- `Almost there — running the last check.`

Never `Please wait…` on its own. It's meaningless.

---

## Consent, cookies, and privacy microcopy

- Default choice is the most privacy-preserving one.
- `Accept all` and `Reject all` are equally weighted — never bury the reject.
- Explain in one sentence what a cookie is used for; don't legalese it.
- If you're using consent to lower marketing friction, say the *benefit* to
  the reader: `We'll remember your preferences on your next visit.`

## Sign-up microcopy

Below the sign-up button, in small text, is prime persuasion real estate.

Good examples:

- `Free forever — no card needed.`
- `Cancel any time. Your first month is on us.`
- `Trusted by 3,000+ small businesses across the UK.`
- `Setup takes about 5 minutes.`
- `We'll never share your email.`

Pick one — don't stack them.

## Unsubscribe & farewell microcopy

The unsubscribe / cancellation page is a trust signal. Make it easy, and the
next relationship is easier to earn back.

- Unsubscribe in one click. Never demand a password to leave a list.
- Confirm the unsubscribe happened, plainly: `You're unsubscribed. Sorry to
  see you go.`
- Offer a downgrade before a delete, but don't force it (`Prefer just monthly
  updates? [Switch to monthly]`).
- If the user cancels a paid plan, tell them exactly what happens to their
  data and when: `Your account stays live until 30 September. After that,
  data is deleted within 30 days.`
