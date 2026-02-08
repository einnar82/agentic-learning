# ADR-004: Walking Skeleton Before Breadth

## Status
- Accepted

## Context
- Learning projects often fail by building horizontal layers in isolation and integrating too late.
- Late integration hides design problems and slows feedback loops.
- We need a default sequencing rule that validates architecture early with minimal build scope.
- Constraints (time, scale, team, deadlines):
  - Solo development
  - Need fast evidence of viability
  - Limited tolerance for integration surprises
- Quality attributes we care about (top 3):
  - delivery predictability
  - reliability
  - learning velocity

## Decision Drivers
- Validate end-to-end viability early.
- Reduce rework from late integration failures.
- Keep scope narrow before expansion.

## Options Considered
### Option A: Build complete layers first, integrate later
- Pros:
  - Local progress feels straightforward
- Cons:
  - High integration risk
  - Delayed proof of architecture viability
- Risks:
  - Big-bang integration failures
  - Expensive rework
- Notes:
  - Common failure mode in early projects

### Option B: Build walking skeleton first, then add breadth
- Pros:
  - Early end-to-end proof
  - Faster detection of integration issues
  - Better sequencing for uncertainty reduction
- Cons:
  - Requires discipline to defer nice-to-have features
- Risks:
  - Teams may prematurely broaden scope after first slice
- Notes:
  - Pair with v1 feature cap and session planning

## Decision
- We will build one minimal end-to-end flow first (walking skeleton).
- Additional features are added only after the skeleton is working and provable.
- Session plans should prioritize vertical progress over horizontal completeness.

## Consequences
- Positive:
  - Earlier confidence in architecture
  - Better risk management and integration quality
  - Faster practical learning feedback
- Negative:
  - Some components remain intentionally thin at first
  - Requires scope discipline
- Follow-ups / mitigation:
  - Keep v1 cap at 3 core features
  - Use weekly review to prevent scope creep

## Proof / Validation
- Guardrails already enforce vertical slice first and feature cap for v1.
- Project brief template includes explicit walking skeleton definition.

## References (Required for Tier 1/2 decisions)
- Official docs/specs/RFCs:
  - N/A - process baseline ADR
- Maintainer repo / release notes:
  - N/A - no tool-specific technology decision
