# ADR-002: Risk-Tiered Process Gates

## Status
- Accepted

## Context
- The guardrails need to balance speed and safety across different change types.
- Treating all changes with the same ceremony causes either unnecessary overhead or insufficient rigor.
- We need a simple model that scales from learning work to production-sensitive tasks.
- Constraints (time, scale, team, deadlines):
  - Solo-friendly
  - Must remain stack-agnostic
  - Must not require CI to be useful
- Quality attributes we care about (top 3):
  - reliability
  - maintainability
  - learning velocity

## Decision Drivers
- Keep low-risk work fast.
- Increase proof requirements for higher-risk work.
- Make decision policy easy to apply without debate.

## Options Considered
### Option A: Single process level for all work
- Pros:
  - Very simple to explain
  - No classification step
- Cons:
  - Either too strict for low-risk changes or too weak for high-risk changes
- Risks:
  - Process fatigue or quality gaps
- Notes:
  - Does not adapt to risk

### Option B: Risk-tiered process gates (Tier 0/1/2)
- Pros:
  - Matches rigor to risk
  - Preserves velocity for low-risk work
  - Increases confidence where failures cost more
- Cons:
  - Requires basic tier classification
- Risks:
  - Misclassification can reduce effectiveness
- Notes:
  - Can be mitigated with default-to-Tier-1 rule

## Decision
- We will use three risk tiers:
  - Tier 0: no behavior change, proof optional
  - Tier 1: behavior change, proof required
  - Tier 2: security/data/infra/concurrency-sensitive, proof + ADR + threat note + rollback + references required
- Default classification is Tier 1 unless clearly Tier 0 or Tier 2.

## Consequences
- Positive:
  - Better quality-to-speed balance
  - Clear expectations before implementation
  - Works for both learning and delivery contexts
- Negative:
  - Requires judgment on tiering
  - Occasional reclassification may be needed
- Follow-ups / mitigation:
  - Revisit tier definitions weekly if confusion appears
  - Escalate uncertain work to higher tier by default

## Proof / Validation
- Guardrails and session template now explicitly encode tier-based behavior.
- Tier minimums align with expected blast radius of change.

## References (Required for Tier 1/2 decisions)
- Official docs/specs/RFCs:
  - N/A - process baseline ADR
- Maintainer repo / release notes:
  - N/A - no tool-specific choice
