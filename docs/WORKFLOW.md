# Workflow: How We Use This System

Use this as the end-to-end operating guide for the repository.

## 1) Start Every Session

1. Load startup instructions:
   - `AGENTS.md` (Codex runtime hook)
   - `docs/llm/SESSION_START.md` (copy-paste prompt for any model)
2. Run intake and choose one option from each group in `docs/LEARNING_PROFESSOR_PLAYBOOK.md`:
   - Learning Goal
   - Topic Category
   - Depth Level
   - Session Mode
   - Timebox
3. Reply in format `LG-TC-DL-SM-TB`.

## 2) Scope The Session

1. Decide whether this is:
   - New runnable project kickoff in `apps/`
   - Existing project/docs/process session
2. If new runnable kickoff, fill/update `docs/PROJECT_BRIEF.md`.

## 3) Set Risk Tier

1. Tier 0: docs/refactor with no behavior change.
2. Tier 1: normal behavior-changing feature/bugfix.
3. Tier 2: security/data/infra/concurrency sensitive changes.

Risk tier controls required proof and ADR rigor. See `docs/GUARDRAILS.md`.

## 4) Open The Daily Session Log

1. Copy `docs/WORKING_SESSION.md` to `docs/sessions/YYYY-MM-DD.md` if today’s file does not exist.
2. Fill required fields first:
   - Date
   - Session Goal
   - Plan (max 3 tasks)
   - Build Log (`Explain -> Change -> Prove`)
   - What I Can Now Explain
   - Next Session Plan

## 5) Plan Before Code (Max 3 Tasks)

For each task, define:
1. Explain: what/why.
2. Change: smallest reversible patch.
3. Prove: test/manual/benchmark/log evidence.

## 6) Execute With Evidence

1. Keep diffs small and reversible.
2. Verify behavior-changing work.
3. Use primary-source references for non-trivial Tier 1/Tier 2 work.
4. Add regression guards for bug fixes.

## 7) Record Hard-To-Reverse Decisions

Create/update ADRs in `docs/adr/` when decisions affect:
1. Auth/permissions model
2. Data model/migrations
3. Deployment/runtime architecture
4. Queue/caching/eventing strategy
5. Major framework/library adoption with architecture impact

Update `docs/adr/README.md` index when adding new ADRs.

## 8) Close The Session

End with:
1. What I learned
2. Proof summary
3. One unresolved question
4. Next session step

## Operational Guards

1. Canonical intake menu guard:
   - Script: `scripts/check_canonical_intake_menu.sh`
   - CI: `.github/workflows/canonical-intake-menu.yml`
   - Pre-commit: `.githooks/pre-commit` (enable with `git config core.hooksPath .githooks`)
2. Repository layout guard:
   - Place runnable project code under `apps/`
   - Do not place primary app code at repository root

## Source Of Truth Map

1. Policy and constraints: `docs/GUARDRAILS.md`
2. Session intake and teaching contract: `docs/LEARNING_PROFESSOR_PLAYBOOK.md`
3. Session template: `docs/WORKING_SESSION.md`
4. Daily logs: `docs/sessions/README.md`
5. Project scope anchor: `docs/PROJECT_BRIEF.md`
6. Architecture decisions: `docs/adr/README.md`
7. Model entrypoints: `docs/llm/README.md`
