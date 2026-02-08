# ADR-001: Manual-First Guardrail Enforcement (Optional Automation)

## Status
- Accepted

## Context
- We are building a reusable guardrail system for both learning projects and real delivery projects.
- In early-stage learning projects, strict CI and PR checks can add process friction and reduce iteration speed.
- In delivery projects, lightweight enforcement can reduce drift and improve consistency.
- Constraints (time, scale, team, deadlines):
  - Solo developer
  - Fast iteration is a primary requirement
  - System must be generic across stacks and project sizes
- Quality attributes we care about (top 3):
  - maintainability
  - learning velocity
  - reliability of decisions

## Decision Drivers
- Keep ceremony lightweight by default.
- Preserve rigor for higher-risk changes.
- Avoid locking the framework to one toolchain.

## Options Considered
### Option A: Mandatory CI/PR enforcement from day one
- Pros:
  - Strong consistency
  - Lower chance of process drift
- Cons:
  - Higher setup/maintenance overhead
  - Slower early learning loops
- Risks:
  - Process becomes performative instead of useful
  - Tooling dependency reduces portability
- Notes:
  - Better fit for mature delivery repos than early learning repos

### Option B: Manual-first enforcement with optional lightweight automation
- Pros:
  - Lower friction for learning
  - Works in any environment
  - Easy to escalate later when needed
- Cons:
  - Relies on discipline
  - Some risk of inconsistency
- Risks:
  - Guardrails may be skipped without periodic review
- Notes:
  - Pair with clear required fields and weekly review

## Decision
- We will use manual-first guardrail enforcement as the default.
- Lightweight automation (for example PR templates and optional checks) is recommended but not required.
- For higher-risk delivery work, teams may opt into stricter automation.

## Consequences
- Positive:
  - Fast startup and low operational overhead
  - Strong fit for agentic learning and solo projects
  - Preserves flexibility across tech stacks
- Negative:
  - Compliance depends on habit quality
  - Manual review burden remains on the developer
- Follow-ups / mitigation:
  - Use the required checklist in `docs/WORKING_SESSION.md`
  - Run a weekly process review and refine one guardrail at a time
  - Introduce optional automation only when drift is observed

## Proof / Validation
- The minimum ceremony now has:
  - required artifacts
  - required per-session fields
  - risk-tier minimums
  - ADR trigger conditions
- This enables consistent process use without mandatory CI coupling.

## References (Required for Tier 1/2 decisions)
- Official docs/specs/RFCs:
  - N/A - example ADR for process baseline
- Maintainer repo / release notes:
  - N/A - no tool-specific decision in this ADR
