# European English (en-GB)

Default language for this skill. Run this list on every output. Any American slip
is a fail, not a soft finding.

## Spelling

| American | en-GB |
| --- | --- |
| color, favor, honor, labor | colour, favour, honour, labour |
| organize, realize, analyze | organise, realise, analyse |
| center, theater, meter (unit) | centre, theatre, metre |
| defense, offense, license (noun) | defence, offence, licence |
| traveled, canceled, modeling | travelled, cancelled, modelling |
| aluminum | aluminium |
| catalog, dialog, analog | catalogue, dialogue, analogue |
| check (bank) | cheque |
| gray | grey |
| jewelry | jewellery |
| maneuver | manoeuvre |
| mustache | moustache |
| plow | plough |
| program (as a noun for a scheme) | programme (keep `program` for software) |
| skeptic | sceptic |
| story (of a building) | storey |
| tire (wheel) | tyre |
| yogurt | yoghurt |

`-yse` in en-GB: `analyse`, `paralyse`, `catalyse`.
`-ise` verb endings: `organise`, `recognise`, `optimise`, `customise`.
Both en-US and en-GB accept `-ize` in Oxford spelling; default to `-ise` unless
the client's style guide says otherwise.

## Americanisms to strip on sight

| Do not write | Write instead |
| --- | --- |
| gotten | got |
| awesome | great, excellent (or nothing — often filler) |
| reach out | get in touch, contact us, email us |
| touch base | catch up, meet, speak |
| off of | off |
| real quick | quickly, in a moment |
| oftentimes | often |
| a couple things | a couple of things |
| write me | write to me |
| in back of | behind |
| momentarily (meaning "in a moment") | in a moment (`momentarily` = for a moment) |
| leverage (as a verb) | use, make use of |
| deplane | disembark, get off |
| burglarize | burgle |
| normalcy | normality |

## Vocabulary swaps

| American | en-GB |
| --- | --- |
| apartment | flat |
| elevator | lift |
| sidewalk | pavement |
| trunk (car) | boot |
| hood (car) | bonnet |
| gas (fuel) | petrol |
| fall (season) | autumn |
| garbage, trash | rubbish |
| cell phone | mobile |
| vacation | holiday |
| pants | trousers |
| store | shop |
| cookie (biscuit) | biscuit |
| line (queue) | queue |
| soccer | football (unless context needs disambiguation) |
| zip code | postcode |
| ZIP file | ZIP file (technical term, unchanged) |
| ATM | cashpoint, ATM (both accepted) |
| check-in (verb) | check in |

## Punctuation

- **Quotation marks** — single (`'…'`) for direct speech; double (`"…"`) for
  quotes within quotes. Punctuation goes *outside* the closing quote unless the
  punctuation belongs to the quoted sentence: `She called it 'the fix'.`
- **Oxford comma** — off by default. Use only when its absence causes ambiguity.
  `We invited the strippers, JFK and Stalin` — Oxford comma on.
  `bread, cheese and wine` — Oxford comma off.
- **Dashes** — en-dash for ranges (`9–5`, `Monday–Friday`, `pp. 12–18`). Em-dash
  with spaces for parenthetical breaks (` — `). Don't use hyphens as dashes.
- **Ellipses** — three dots, no spaces (`…`), used sparingly. Never in
  professional body copy — it reads as trailing off.
- **Full stops** — no full stop inside single-sentence bullets, no full stop
  after a heading. Use full stops when a bullet contains more than one sentence.
- **Apostrophes** — `it's` = it is; `its` = possessive. `Company's` = one
  company owns it; `companies'` = many companies own it. Never `it's` as
  possessive.
- **Titles** — sentence case for headings and buttons (`Get started for free`),
  not title case (`Get Started For Free`). Product names keep their case.

## Dates, times, numbers

- **Dates** — `19 August 2026`. Or `19/08/2026` if space is tight. Never
  `08/19/2026`, never `Aug 19th`.
- **Time** — 12-hour with `am`/`pm` lowercase, no space: `9am`, `2.30pm`.
  24-hour for schedules: `14:30`.
- **Numbers** — spell out one to nine; digits for 10 and above. Exceptions:
  ages, percentages, money, measurements always in digits (`4 years old`, `5%`,
  `£8`, `3kg`).
- **Money** — `£8.50`, `€8.50`, `£1,000` (comma as thousands separator, full
  stop as decimal). Say `£1m` or `£1 million`, not `£1MM`.
- **Percentages** — `5%` in body copy. `per cent` (two words) only if the
  client's house style requires it.
- **Ordinals** — `1st`, `2nd`, `3rd` in dates and lists; spell out otherwise
  (`the first time`).
- **Telephone** — `+44 20 7946 0958` for international; `020 7946 0958` for
  UK domestic.

## Common idiom differences

| American | en-GB |
| --- | --- |
| on the weekend | at the weekend |
| in the hospital | in hospital |
| write me | write to me |
| different than | different from |
| a half hour | half an hour |
| Monday through Friday | Monday to Friday |
| out the window | out of the window |
| I could care less | I couldn't care less |
| I'll do it momentarily | I'll do it in a moment |

## When to override en-GB

- The client's brand voice guide explicitly says en-US, or the audience is
  entirely US-based (a US subsidiary page, a US-only product line).
- Proper nouns keep their spelling: `World Trade Center`, `Center for Disease
  Control`.
- Software / API terms are en-US by convention: `authorization` (HTTP header),
  `color: #fff` (CSS), `initialize` (method name). Body copy about those
  features still uses en-GB.

## Automated first-pass

Before returning any output, grep the draft for these strings and correct them:

```
color colour organize realize analyze theater center theater favor honor
gotten awesome reach out off of oftentimes ize (Americanised verb ending)
$ (currency, unless the price is genuinely in USD)
MM/DD/YYYY date pattern
```

Anything caught is a rubric-3 fail. Fix, then re-check.
