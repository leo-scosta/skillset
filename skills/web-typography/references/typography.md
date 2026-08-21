# Typography

Open-source only. The change list can never include a paid or restricted-licence
family — if a paid family is clearly right, flag it in *Open questions* and let
the user decide.

## Approved sources

| Source | URL | Good for |
| --- | --- | --- |
| **Google Fonts** | fonts.google.com | Broad canon (Inter, Instrument Serif, JetBrains Mono, Fraunces, DM Sans, Public Sans, Space Grotesk, Manrope, Playfair Display). Reliable variable-font support, easy self-hosting via `google-webfonts-helper`. |
| **Fontshare** (Indian Type Foundry) | fontshare.com | Distinctive display families (Satoshi, Cabinet Grotesk, General Sans, Erode, Clash Display, Panchang, Boska, Ranade). Free for commercial use, high design quality. |
| **Fontsource** | fontsource.org | NPM-packaged self-hosting for both of the above, plus 1500+ other OFL families. Use when you want fonts as a build-time dependency, not a runtime request. |
| **The League of Movable Type** | theleagueofmoveabletype.com | League Spartan, League Gothic, Ostrich Sans, Sorts Mill Goudy. Small, curated, all OFL. |
| **Velvetyne** | velvetyne.fr | Experimental libre display faces — good when the reference calls for something raw or brutalist. |

Never suggest: Adobe Fonts (subscription), MyFonts / Monotype (paid), Klim,
Grilli Type, Colophon Foundry, Commercial Type, Dinamo, or any foundry site
without an OFL / Fontshare-style free-for-commercial licence.

## Pairing heuristics

Two families is the working default. One is riskier (needs a very versatile
family), three is a smell (usually means indecision).

Pairing rules that usually work:

- **Contrast, not clash.** Pair by voice, not by category. Serif + sans is a
  category, not a pairing — the pairing is *Fraunces + Inter* (both humanist,
  both warm) or *Playfair Display + Public Sans* (both classical, both formal).
- **One family does display, one does body.** Display is where the design
  personality lives; body is where legibility lives. Don't try to make one
  family carry both jobs unless it genuinely can (Satoshi, Inter, DM Sans).
- **Match x-heights when the pair sits side by side.** Different x-heights make
  the pair feel accidental.
- **Mono is a third family only when the site shows code.** Otherwise it's
  decoration.

Starter pairings (all OFL / Fontshare, all free):

| Aesthetic | Display | Body |
| --- | --- | --- |
| Modern editorial | Fraunces | Inter |
| Warm classical | Playfair Display | Public Sans |
| Design-agency clean | Cabinet Grotesk | Satoshi |
| Technical / product | JetBrains Mono (accents) | Inter |
| Playful | Clash Display | General Sans |
| Serif-only | Instrument Serif | Instrument Serif Italic |
| Brutalist | Space Grotesk | Space Grotesk |

## Scale

A modular scale keeps steps intentional. Common ratios:

| Ratio | Feel | Use when |
| --- | --- | --- |
| 1.125 (major second) | Tight | Content-heavy, editorial |
| 1.200 (minor third) | Balanced | Default for product / marketing |
| 1.250 (major third) | Expressive | Landing pages with a strong hero |
| 1.333 (perfect fourth) | Dramatic | Short pages, big statements |
| 1.414 (aug. fourth) | Very dramatic | Portfolios, one-page sites |

Baseline: 16px body. Compute steps up: `16 × ratio^n`. Round to whole px above
20px, keep half-px below.

## Line height + tracking

Rough rules, adjust by eye:

| Size | Line height | Tracking |
| --- | --- | --- |
| Display (48–96px) | 1.0–1.1 | -0.02 to -0.04em |
| Title (28–40px) | 1.15–1.2 | -0.01 to -0.02em |
| Lead (18–22px) | 1.4–1.5 | 0 |
| Body (16–17px) | 1.5–1.7 | 0 |
| Small (13–14px) | 1.4–1.5 | +0.005em |
| Caps / labels | 1.2 | +0.05 to +0.08em |

Long-form reading copy: **1.6–1.7 line height**, **~66 characters per line**
(≈ `42rem` at 16px body). Nielsen Norman range is 50–75 CPL; 66 is the sweet
spot.

## Weight subset

Every added weight is bytes. Default subsets:

- **Product / marketing UI**: 400, 500, 600 (three weights).
- **Editorial**: 400, 700 (regular + bold), + italics if long-form.
- **Display-heavy landing**: 400, 500, 600, 800 (four when the display size
  really needs the extra black).

Never load 100/200 ("thin") for body text — fails contrast at small sizes on
most backgrounds regardless of colour.

## Accessibility floor

- **Minimum body size**: 16px (WCAG-recommended). 15px is a red flag; 14px is
  a blocker for anything longer than a caption.
- **Minimum contrast**: 4.5:1 body, 3:1 large (≥ 18px regular or 14px bold).
  Push to AAA (7:1 / 4.5:1) where the palette allows.
- **Never use `text-align: justify`** on the web without hyphenation control —
  it creates rivers of whitespace and hurts readability.
- **Avoid all-caps for anything longer than a label** — screen readers may
  read letter-by-letter, and comprehension drops ~15% (NN/g).
- **Line length**: cap at ~75 CPL. Anything wider needs a shorter measure or
  larger type.

## Loading fonts

Prefer self-hosting via Fontsource (npm) or `google-webfonts-helper` (static
`.woff2` files). Reduces layout shift, removes Google-Fonts DNS latency, and
avoids the third-party request in privacy-sensitive contexts.

Always:

- Use `.woff2` (30% smaller than `.woff`).
- Use variable fonts when available — one file instead of six.
- Set `font-display: swap` (FOUT is better than FOIT for perceived speed).
- Preload the display face and the body regular:
  `<link rel="preload" as="font" type="font/woff2" crossorigin>`.
- Subset when you know the language — most families ship a Latin subset
  ~10× smaller than the full Cyrillic-plus-Greek build.
