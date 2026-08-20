# Voice-authenticity evals

Test snippets for the LLM-fingerprint patterns in
`llm-fingerprints.md` (category 9 in `rubric.md`).

Each snippet has an **input** (copy that should fail), an **expected flag**
(pattern name from the fingerprint reference), and an **expected rewrite**
(how the skill should propose fixing it).

To run: pass each input through the skill in review mode. Every input must
trigger its expected flag. If any input passes review without flagging, the
rule for that pattern is broken — fix and retest.

Note on setup vs. failure: some inputs include a preceding sentence to
establish the context the fingerprint depends on (for example, a triad
before the X-not-Y closer). The context sentence is not the failure; the
marked sentence is.

---

## 1. x-not-y-closer

**Input**

> AI is part of every stage of my work: research, prototyping, delivery.
> It's in the process, not in the lead.

**Expected flag** — `x-not-y-closer` (severity: high)

**Expected rewrite**

> AI is part of every stage of my work: research, prototyping, delivery.
> I still decide what ships.

---

## 2. anaphora-of-two (+ overused-definite-article)

**Input**

> I lead the product design, and I ship the front-end.

**Expected flags** — `anaphora-of-two`, `overused-definite-article`
(severity: high on both)

**Expected rewrite**

> I lead product design and ship the front-end.

---

## 3. em-dash-overuse

**Input**

> Twenty years designing and building — from front-end developer to senior
> product design — with AI woven through the workflow — and shipped as pull
> requests reviewed by the engineering team.

**Expected flag** — `em-dash-overuse` (severity: high; count: 3 em-dashes in
one sentence)

**Expected rewrite**

> Twenty years designing and building, from front-end developer to senior
> product design. AI is woven through the workflow, and shipped as pull
> requests reviewed by the engineering team.

---

## 4. unsupported-ai-claim

**Input**

> I use AI across research, prototyping and delivery.

**Expected flag** — `unsupported-ai-claim` (severity: high — assertion
without any tool, method, or outcome named)

**Expected rewrite**

> I use AI across research, prototyping and delivery, on projects with
> curated sources rather than open-ended prompts.

---

## 5. ai-slop-vocabulary (+ unsupported-ai-claim)

**Input**

> I use AI to supercharge my workflow for high performance.

**Expected flags** — `ai-slop-vocabulary` (matches `supercharge`),
`unsupported-ai-claim` (no specifics given)

**Expected rewrite**

> I use AI across research and prototyping, mostly to reach a testable
> version faster.

---

## 6. role-discipline-mismatch

**Input**

> Twenty years, from front-end developer to senior product design.

**Expected flag** — `role-discipline-mismatch` (developer is a role;
design is a discipline)

**Expected rewrites** — either is acceptable

> Twenty years, from front-end developer to senior product designer.

> Twenty years, from front-end development to product design.

---

## Regression cases from the source session

Drawn from real drafts produced in the session that motivated this update.
The pre-fix versions must FAIL; the post-fix versions must PASS.

### R1. Portfolio hero H1

**FAIL (earlier draft)**

> Senior Design Engineer in B2B SaaS. I lead the product design, and I ship
> the front-end.

**PASS (current live version at
`/Users/leandrocosta/Sites/portfolio/src/pages/index.astro:55`)**

> Senior Design Engineer in B2B SaaS. I lead product design and ship the
> front-end.

### R2. Hero closer

**FAIL (earlier draft)**

> AI is part of every stage: research, prototyping, delivery. It's in the
> process, not in the lead.

**PASS (current live version)** — the AI line was removed from the hero
entirely; AI is now discussed in the dedicated section further down the
page with specifics (curated sources, verification, prototyping-in-code as
main method).
