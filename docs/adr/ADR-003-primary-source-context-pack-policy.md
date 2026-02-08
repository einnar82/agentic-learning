# ADR-003: Primary-Source Context Pack Policy

## Status
- Accepted

## Context
- AI-generated suggestions are helpful but can be outdated or incorrect.
- The guardrail system needs a repeatable way to ground technical decisions in reliable evidence.
- We need a lightweight standard that works for both learning and implementation decisions.
- Constraints (time, scale, team, deadlines):
  - Evidence workflow must stay lightweight
  - Must be reusable across stacks and providers
  - Should not force long research docs for every change
- Quality attributes we care about (top 3):
  - correctness
  - maintainability
  - security

## Decision Drivers
- Reduce incorrect implementation from stale guidance.
- Keep citation overhead low.
- Prioritize official and authoritative references.

## Options Considered
### Option A: No required source hierarchy
- Pros:
  - Minimal process overhead
- Cons:
  - Weak quality control on recommendations
  - Higher chance of adopting bad patterns
- Risks:
  - Hidden design regressions and security mistakes
- Notes:
  - Unsuitable for non-trivial behavior changes

### Option B: Primary-source-first context pack for non-trivial work
- Pros:
  - Better confidence in implementation decisions
  - Reproducible reasoning for future review
  - Supports learning through verified materials
- Cons:
  - Requires short research step
- Risks:
  - Can become too heavy if applied to trivial changes
- Notes:
  - Restrict required use to Tier 1 and Tier 2 changes

## Decision
- For Tier 1 and Tier 2 work, we require a mini context pack:
  - 2-5 links
  - short summary in own words
  - validated assumptions
- Source priority:
  - official docs/specs/RFCs
  - maintainer repositories and release notes
  - trusted engineering references
- For Tier 0 work, context pack is optional.

## Consequences
- Positive:
  - Stronger evidence quality for decisions
  - Better knowledge retention over time
  - Lower risk from unverified AI output
- Negative:
  - Adds small upfront time cost
  - Requires discipline to keep summaries concise
- Follow-ups / mitigation:
  - Cap links to 5 maximum
  - Keep summaries short and decision-focused

## Proof / Validation
- Guardrails include Web-First verification and citation requirements.
- Session template has a Context Pack section aligned with this policy.

## References (Required for Tier 1/2 decisions)
- Official docs/specs/RFCs:
  - N/A - process baseline ADR
- Maintainer repo / release notes:
  - N/A - no tool-specific decision
