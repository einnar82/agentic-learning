# ADR-007: Weekly Architecture Review Cadence

## Status
- Accepted

## Context
- Learning and implementation decisions can drift when architecture is not reviewed on a fixed cadence.
- We need a lightweight routine to validate whether decisions still fit project constraints.
- Constraints (time, scale, team, deadlines):
  - Solo execution
  - Must remain low overhead
  - Should work without CI dependencies
- Quality attributes we care about (top 3):
  - maintainability
  - reliability
  - decision quality

## Decision Drivers
- Keep architecture decisions current as project reality changes.
- Detect over-engineering and under-engineering early.
- Preserve a fast but disciplined feedback loop.

## Options Considered
### Option A: Review architecture only when problems appear
- Pros:
  - No scheduled overhead
- Cons:
  - Reactive, late detection of drift
  - Decisions become stale
- Risks:
  - Compounding design debt
- Notes:
  - Common failure mode in solo projects

### Option B: Fixed weekly architecture review cadence
- Pros:
  - Consistent decision hygiene
  - Early detection of risk and complexity creep
  - Supports continuous learning reflection
- Cons:
  - Requires scheduled time
- Risks:
  - Can become checklist theater if not tied to outcomes
- Notes:
  - Keep review short and outcome-oriented

## Decision
- We will run a weekly 20-30 minute architecture review.
- Review checklist:
  - Are current ADRs still valid?
  - Did any change need an ADR but miss it?
  - Are risk-tier assignments still correct?
  - Is complexity still within budget?
  - What one guardrail should be adjusted next week?

## Consequences
- Positive:
  - Better architecture consistency over time
  - Faster correction of bad assumptions
  - Stronger learning retention through periodic reflection
- Negative:
  - Small recurring overhead
- Follow-ups / mitigation:
  - Keep review notes concise in `WORKING_SESSION.md`
  - Escalate only one process change per week

## Proof / Validation
- Guardrails already include a weekly review concept; this ADR formalizes cadence and checklist content.
- Expected outcome is reduced decision drift across sessions.

## References (Required for Tier 1/2 decisions)
- Official docs/specs/RFCs:
  - N/A - learning-process architecture ADR
- Maintainer repo / release notes:
  - N/A - no tool-specific decision
