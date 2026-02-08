# WORKING_SESSION.md (Template)

> Purpose: a living log for day-to-day learning, experiments, and evolving decisions.
> This file changes often. The guardrails and ADRs change less often.
> Minimum Viable Ceremony default: complete only sections marked "Required".
> Last update (2026-02-08): clarified startup menu format to separate group labels from option numbering.

## Session Mode
- Default: Minimum Viable Ceremony (MVC)
- Risk Tier: Tier 0

## Required Checklist
- [x] Date
- [x] Session Goal
- [x] Plan (max 3 tasks)
- [x] Build Log (at least one Explain -> Change -> Prove entry)
- [x] What I Can Now Explain
- [x] Next Session Plan

## Date (Required)
- 2026-02-08

## Session Goal (Required)
- Fix startup selection menus so category headers and option numbers are unambiguous.

## Plan (Plan-First, Required)
- Vertical slice for today: make prompt menus consistent and easy to answer in one pass.
- Tasks (small, reversible steps):
  - [x] Replace numbered group headers with named group labels + positions.
  - [x] Keep numbering only for options inside each group and add reply mapping format.
  - [x] Verify wording across startup docs and update this session log.

## Context Pack (Optional, Tier 1/2 Recommended)
- Official docs/specs:
  - 
  - 
- Key takeaways (in your words):
  - 
  - 
- Assumptions validated today:
  - 

## Decisions Pending (Optional, Use for ADR Triggers)
- Decision:
- Options:
  - A:
  - B:
- How we’ll decide (evidence needed):
- Links:
  - 

## Experiments / Spikes (Optional, Timeboxed)
- Hypothesis:
- Steps:
- Result (proof):
- Decision:
- Notes:

## Build Log (Explain -> Change -> Prove, Required)
### Change 1
- Explain: The menu was ambiguous because both group labels and choices used numeric prefixes (for example, `1. Learning Goal` above `1. Understand...`).
- Change: Updated startup docs to use explicit group labels/positions and preserved numbering only for option choices in `AGENTS.md`, `docs/llm/SESSION_START.md`, `docs/llm/CODEX.md`, `docs/llm/CLAUDE.md`, and `docs/llm/CURSOR.md`.
- Prove: `rg -n "^1\\. Learning Goal$|^2\\. Topic Category$|^3\\. Depth Level$|^4\\. Session Mode$|^5\\. Timebox$" -S AGENTS.md docs/llm` returned no matches.

### Change 2
- Explain: The answer format needed an explicit mapping so learners know what each number in `1-2-3-4-2` means.
- Change: Added `Reply format: LG-TC-DL-SM-TB (example: 1-2-3-4-2)` and group position labels in startup docs.
- Prove: `rg -n "Reply format: .*LG-TC-DL-SM-TB.*|position 1|Group 1, choose one" -S AGENTS.md docs/llm` shows the new strings in all startup prompt files.

### Change 3
- Explain: The core playbook should mirror startup templates so instructions stay consistent regardless of entrypoint file.
- Change: Added the same `LG-TC-DL-SM-TB` reply format and position mapping to `docs/LEARNING_PROFESSOR_PLAYBOOK.md`.
- Prove: `rg -n "Reply format: `LG-TC-DL-SM-TB`|where positions map to:" -S docs/LEARNING_PROFESSOR_PLAYBOOK.md` returns matching lines.

## Bugs / Debugging (Optional)
- Error:
- Repro:
- Hypothesis:
- Fix:
- Regression guard (test/check):

## What I Can Now Explain (Teach-back, Required)
- Why duplicate numbering (group and option both numeric) creates selection ambiguity.
- How to design menu prompts with position mapping while keeping option numbering readable.
- How to verify prompt consistency quickly with `rg`.

## Next Session Plan (Required)
- Run one fresh-session dry run to confirm the startup prompt is clear in practice and refine wording if any friction appears.
