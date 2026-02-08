# ADR-005: Architecture Learning Ladder

## Status
- Accepted

## Context
- We want to learn architecture progressively without jumping into complexity too early.
- Learning projects can fail when advanced patterns are introduced before core system thinking is strong.
- Constraints (time, scale, team, deadlines):
  - Solo developer
  - Limited weekly learning time
  - Need practical output while learning
- Quality attributes we care about (top 3):
  - maintainability
  - clarity
  - delivery predictability

## Decision Drivers
- Build durable architecture fundamentals first.
- Keep learning sequence aligned with actual project maturity.
- Avoid resume-driven architecture choices.

## Options Considered
### Option A: Learn advanced architecture patterns immediately
- Pros:
  - Fast exposure to modern patterns
- Cons:
  - Weak fundamentals
  - Higher implementation failure risk
- Risks:
  - Over-engineering and shallow understanding
- Notes:
  - High cognitive load for limited practical gain early

### Option B: Use a staged architecture learning ladder
- Pros:
  - Better concept retention
  - Cleaner decision quality
  - Lower complexity during early builds
- Cons:
  - Slower exposure to advanced patterns
- Risks:
  - Delayed distributed systems practice
- Notes:
  - Tradeoff is acceptable for stronger long-term foundation

## Decision
- We will follow this staged learning ladder:
  1. Module boundaries and data flow in a modular monolith
  2. Error handling, observability, and operability basics
  3. Performance and scalability fundamentals (caching, indexing, load testing)
  4. Distributed patterns only when trigger conditions exist

## Consequences
- Positive:
  - Higher signal-to-noise in architecture decisions
  - Better transfer of learning to real projects
  - Less process and implementation churn
- Negative:
  - Advanced distributed topics arrive later
  - Requires discipline to defer complex patterns
- Follow-ups / mitigation:
  - Track completion of each stage in session notes
  - Re-evaluate stage progression monthly

## Proof / Validation
- Existing guardrails already enforce vertical slice first, ADR triggers, and complexity budget.
- This ADR defines the explicit learning order for architecture depth.

## References (Required for Tier 1/2 decisions)
- Official docs/specs/RFCs:
  - N/A - learning-process architecture ADR
- Maintainer repo / release notes:
  - N/A - no tool-specific decision
