# LLM fingerprints

Patterns that make copy read as machine-generated. Every entry is a fail, not
a soft. Scan for them before returning any draft or rewrite — the
`voice-authenticity` category (9) in `rubric.md` treats them as hard fails.

Detection heuristics are hints, not guarantees. Some are grep-friendly
(literal string matches); others need a structural read. When in doubt, flag
for review and fix.

---

## Session-observed (8)

### 1. x-not-y-closer

**Rule.** Never end a paragraph, section, or list with an "X, not Y"
aphorism. If the sentence sits after a rule-of-three list, delete it or
restate as a concrete first-person action.

**Why it reads as AI.** Parallel abstract nouns after a triad is one of the
highest-probability LLM shapes in 2026 — models default to it as a
rhetorical landing.

**Before →**
"AI is part of every stage: research, prototyping, delivery. It's in the
process, not in the lead."

**→ After**
"AI is part of every stage: research, prototyping, delivery. I still decide
what ships."

**Detection.** Sentences matching
`/^(It's|It is|That's|That is) .+, not .+\.$/` at end of paragraph, or any
`, not [a-z]` clause following a rule-of-three list in the same paragraph.

---

### 2. triad-plus-aphorism

**Rule.** A three-item list followed immediately by a short summary sentence
is a compound fingerprint. Break the pair — either drop the aphorism, or
extend the paragraph past it.

**Why it reads as AI.** Models close on symmetry. Humans usually just stop.

**Before →**
"Design, development, delivery. Three legs of one stool."

**→ After**
"Design, development, delivery — the whole span."

**Detection.** `[A-Z]\w+, \w+ and \w+\.$` (or the comma variant) followed by
a sentence ≤ 12 words that summarises the triad.

---

### 3. em-dash-overuse

**Rule.** Cap em-dashes at 1 per 100 words of body copy, or 1 per paragraph,
whichever is stricter. Default to periods, colons, and commas.

**Why it reads as AI.** Em-dashes for restatement is the single strongest
punctuation tell. Humans use them sparingly for emphasis; models use them
constantly for parenthetical unpacking.

**Before →**
"Twenty years designing and building — from front-end developer to senior
product design — with AI woven through the work."

**→ After**
"Twenty years designing and building, from front-end developer to senior
product design. AI is woven through the work."

**Detection.** Count `—` per 100 words. Flag if > 1. Also flag any paragraph
with 2+ em-dashes regardless of length.

---

### 4. anaphora-of-two

**Rule.** Repeated pronoun openers ("I …, and I …") work in threes
(Churchill's *"I came, I saw, I conquered"*), not twos. Two reads as
accidental repetition, not rhythm.

**Why it reads as AI.** Models produce parallel structures automatically;
they don't feel the difference between rhythmic and clunky. A human writing
would either extend to three or collapse to one.

**Before →**
"I lead the product design, and I ship the front-end."

**→ After**
"I lead product design and ship the front-end."

**Detection.** `\bI [a-z]+ .+, and I [a-z]+\b` where no third `I` clause
follows in the same sentence.

---

### 5. ai-slop-vocabulary

**Rule.** Forbidden in any AI-adjacent sentence. Case-insensitive.

- `supercharged`, `supercharging`, `supercharge`
- `AI-powered`, `AI-integrated`, `AI-enabled`, `AI-driven`
- `AI-native` as self-description (permitted as an industry term about
  companies or products)
- `embraced AI`, `harnessing AI`, `unleashing AI`, `leveraging AI`
- `next-level`, `game-changing`, `revolutionary`, `cutting-edge`,
  `world-class`, `industry-leading`

**Why it reads as AI.** These are the exact terms recruiter tools and
readers pattern-match as ChatGPT output. Using them undoes any other
credibility signal in the copy.

**Before →**
"I use AI to supercharge my workflow for high performance."

**→ After**
"I use AI across research and prototyping, in projects with curated sources
rather than open-ended prompts."

**Detection.** Case-insensitive literal match against the list above.

---

### 6. unsupported-ai-claim

**Rule.** Any sentence claiming AI use must be paired with a specific tool,
artefact, method, or measurable outcome in the same paragraph. Standalone
assertions fail.

**Why it reads as AI.** Boilerplate AI paragraphs are one of the most common
2026 portfolio patterns; readers now discount them as filler unless the
claim is grounded.

**Before →**
"AI is part of every stage of my work: research, prototyping, delivery."

**→ After**
"AI is part of every stage of my work, inside projects with curated sources
rather than open-ended prompting. Everything it produces gets checked."

**Detection.** Any sentence containing `\bAI\b` without accompanying
specifics (tool name, method, outcome, mechanism) in the same paragraph.
Judgement call — flag for review rather than auto-fail.

---

### 7. role-discipline-mismatch

**Rule.** In parallel structures ("from X to Y"), both sides must be the
same category: role → role, discipline → discipline, product → product.
Never cross.

**Why it reads as AI.** Models optimise for lexical variation, not
grammatical parallelism, so they often swap between role-nouns (developer,
designer) and abstract-nouns (development, design) mid-clause.

**Before →**
"From front-end developer to senior product design."

**→ After (role → role)**
"From front-end developer to senior product designer."

**→ After (discipline → discipline)**
"From front-end development to product design."

**Detection.** Parse "from A to B". Flag when A ends with a person-noun
(developer, designer, manager, engineer, lead) and B ends with an
abstract-noun (development, design, management, engineering, leadership),
or vice versa.

---

### 8. overused-definite-article

**Rule.** Sentences like "I lead the product design" read non-native. Drop
the article unless it references a specific antecedent already established
in the copy.

**Why it reads as AI.** Models over-attach articles because training data
skews formal. Native speakers drop them in role descriptions.

**Before →**
"I lead the product design and ship the front-end."

**→ After**
"I lead product design and ship the front-end."

**Detection.** `\bI (lead|run|own|manage|head|drive) the
(product|marketing|design|engineering|research|strategy)\b` — flag for
review; the article may be intentional if a specific antecedent is
established.

---

## Common LLM tells (6)

### 9. filler-adverbs

**Rule.** Avoid `moreover`, `furthermore`, `additionally`, `notably`,
`crucially`, `importantly`, `significantly`. If the point matters, the
sentence itself should carry it.

**Why it reads as AI.** Models use these as connective glue; humans in web
copy don't.

**Before →**
"The tool is fast. Moreover, it's accessible."

**→ After**
"The tool is fast, and accessible."

**Detection.** Case-insensitive literal match at sentence start or after a
semicolon.

---

### 10. hedged-verbs

**Rule.** Cut `could potentially`, `may be able to`, `it might be worth`,
`it could be argued that`, `arguably`. Make the claim or drop it.

**Why it reads as AI.** Models hedge to avoid liability; copy that reads as
senior doesn't hedge on its own claims.

**Before →**
"This approach could potentially save time."

**→ After**
"This approach cuts invoice time from 40 minutes to 4."

**Detection.** Literal string match.

---

### 11. as-an-x-openers

**Rule.** Never open a sentence with "As an [X], I …" or "As someone who
[does Y], I …".

**Why it reads as AI.** The single most recognisable ChatGPT opener.
Recruiters skip on sight.

**Before →**
"As a designer with twenty years of experience, I bring a unique
perspective."

**→ After**
"Twenty years designing product, most recently in B2B SaaS."

**Detection.** `/^As (an?|someone) /` at sentence start.

---

### 12. in-conclusion-wrap-ups

**Rule.** Never end a piece with "In conclusion,", "In summary,", "To wrap
up,", "All in all,", "At the end of the day,".

**Why it reads as AI.** If the reader reached the end, they know. Humans in
web copy trust the reader; models don't.

**Before →**
"In conclusion, our tool helps you ship faster."

**→ After**
Delete the sentence. Let the previous one land.

**Detection.** Literal match at the start of any paragraph in the final 15%
of the piece.

---

### 13. unnecessary-numbered-lists

**Rule.** Numbered lists imply sequence or ranking. If items have neither,
use bullets or prose.

**Why it reads as AI.** Models default to numbered lists as a
structure-signal; humans reserve them for actual steps.

**Before →**
"Our approach has three parts: 1. Empathy. 2. Craft. 3. Rigour."

**→ After**
"Our approach: empathy, craft, rigour."

**Detection.** Numbered list (`1.` / `2.` / `3.` at line start) whose items
don't reference each other or a step-order. Judgement call.

---

### 14. compound-emoji-stacks

**Rule.** No decorative emoji chains (🚀✨💡🎯). If an emoji earns its
place, one is enough — and most contexts need none.

**Why it reads as AI.** Models sprinkle emojis for tonal warmth; readers now
pattern-match stacks as ChatGPT.

**Before →**
"Launch faster 🚀 ship confidently ✨ build better 💡"

**→ After**
"Launch faster. Ship confidently. Build better."

**Detection.** Two or more emoji characters in a row.

---

## Using this reference

**Draft mode.** After drafting, scan the whole output for every pattern. Fix
in place before returning. Do not surface fingerprints to the user as
findings — draft mode's contract is a clean output, not a critique.

**Review mode.** Every fingerprint found is a row in the findings table
under category 9 (Voice authenticity), severity high. Include the
before/after in the suggested-rewrite column.

**Judgement calls.** Rules 6 (unsupported-ai-claim), 8
(overused-definite-article), and 13 (unnecessary-numbered-lists) need a
structural read, not just a grep. When ambiguous, flag rather than fail —
the reader can accept or reject the suggestion.

---

*Sources:* Session-observed failures from a portfolio hero draft, 2026;
*The Designer's Field Guide* — "Being an AI-native designer isn't what you
think it is"; Hiration — "Is AI Writing Your LinkedIn Hurting You? The 2026
AI-Slop Backlash"; recurring 2026 recruiter feedback patterns.
