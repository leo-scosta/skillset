# web-accessibility

Runs a WCAG 2.2 AA audit on a web page or section — contrast matrix,
`:focus-visible` states, `prefers-reduced-motion` respect, keyboard
order, tap targets, screen-reader hygiene, form accessibility, and
colour-never-carries-meaning-alone. Failures are blockers.

## The problem

"Accessibility review" tends to produce either a vague "add alt text
and you're fine" or a Lighthouse dump with no prioritisation. Real
accessibility work is a small number of gates each design has to pass
— contrast, focus, motion, keyboard, tap target, screen-reader
structure — and every failure needs to appear as a blocker, not a
"consider" nit that ships anyway.

## The approach

One skill covering only the accessibility stage. The body of `SKILL.md`
walks through target read → contrast matrix → focus states → motion →
keyboard → tap targets → screen-reader hygiene → colour-not-meaning →
forms, with the on-demand `references/accessibility.md` carrying the
deeper material (each gate in detail, plus common blockers per gate and
a design-system posture note).

Opinionated on purpose:

- **WCAG 2.2 AA is the floor.** Failures are blockers, not nits. A
  design that fails AA is not called award-winning.
- **Push to AAA where cheap.** If the palette or motion vocabulary
  absorbs the higher ratio without hurting the design, take it.
- **Every gate is checked.** No skipping "just contrast" or "just
  focus" — the checklist is the whole point.
- **Prefer `:focus-visible` over `:focus`.** Keyboard users see it,
  mouse users don't.
- **Colour never carries meaning alone.** Every state also has an icon,
  text, or shape.
- **No token renames.** Additions only.

Output is a written audit plus a prioritised change list, not applied
edits.

## Rejected alternatives

**Folding this back into a single `web-design` skill.** Tried that first
— the umbrella diluted the accessibility-specific triggers ("WCAG AA
check", "contrast audit", "keyboard navigation review", "focus states").
Each of those now hits directly.

**Running an automated audit (axe / Lighthouse) instead.** Rejected as
the primary approach because automated tools cover ~30% of real
accessibility issues. The skill focuses on the design-level gates —
contrast, focus, motion, keyboard, structure — that a human reviewer
catches and an automated tool doesn't. Automated tools are complementary,
not a replacement.

**Splitting into `contrast-audit` + `focus-audit` + …** Considered.
Rejected because a real accessibility review runs all the gates
together — a page that clears contrast but fails focus isn't
accessible. One skill, all gates.

## Known limits

- **Proposes, doesn't apply.** Returns an audit and change list;
  doesn't edit files or open PRs.
- **Can't run the site.** No live keyboard test, no live screen-reader
  test — works from files, URLs, screenshots, and code. Recommend the
  user pair the audit with a real keyboard + VoiceOver / NVDA pass on
  the built site.
- **APCA noted, WCAG primary.** WCAG 2.x contrast ratios are the
  reported number because tooling and law use them; APCA is noted for
  edgy pairs.
- **No cross-browser or device-matrix testing.** The skill checks the
  design logic; it doesn't run the site.
