# ADR-006: Trigger-Based Scalability Learning

## Status
- Accepted

## Context
- Scalability topics are important, but premature scaling adds complexity and reduces learning clarity.
- We need a consistent way to decide when to study and apply deeper scalability patterns.
- Constraints (time, scale, team, deadlines):
  - Solo developer workflow
  - Most learning projects begin with low traffic
  - Limited time for operating complex infrastructure
- Quality attributes we care about (top 3):
  - performance
  - reliability
  - maintainability

## Decision Drivers
- Learn scalability when bottlenecks are observable.
- Keep architecture simple until data indicates stress.
- Use measurable triggers rather than intuition.

## Options Considered
### Option A: Design for high scale from the start
- Pros:
  - Future-ready architecture surface
- Cons:
  - High upfront complexity
  - Slower learning loops
- Risks:
  - Building unneeded infrastructure
- Notes:
  - Poor fit for early learning stages

### Option B: Trigger-based scalability progression
- Pros:
  - Better cost/benefit balance
  - Stronger understanding of why each scale pattern exists
  - Lower maintenance overhead
- Cons:
  - Requires basic measurement and load checks
- Risks:
  - Under-scaling if triggers are ignored
- Notes:
  - Risk is mitigated with explicit threshold review

## Decision
- We will adopt trigger-based scalability learning:
  - Start with single service and single primary datastore.
  - Add scalability mechanisms only after evidence from tests or production-like load.
- Trigger examples for deeper scalability study:
  - sustained p95 latency above target
  - sustained resource saturation (CPU or DB utilization)
  - repeated timeout/retry incidents under expected load

## Consequences
- Positive:
  - Scalability work is justified and easier to reason about
  - Lower risk of over-engineering
  - Better alignment between learning effort and system needs
- Negative:
  - Requires instrumentation and periodic performance review
  - Some scalability topics are intentionally deferred
- Follow-ups / mitigation:
  - Define target latency/SLO for each project brief
  - Add lightweight load testing before major releases

## Proof / Validation
- This aligns with complexity budget and evidence-over-confidence guardrails.
- Scalability exploration now has explicit trigger conditions instead of ad hoc decisions.

## References (Required for Tier 1/2 decisions)
- Official docs/specs/RFCs:
  - N/A - learning-process architecture ADR
- Maintainer repo / release notes:
  - N/A - no tool-specific decision
