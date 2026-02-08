# ADR Index and Usage Guide

This folder stores Architecture Decision Records (ADRs) for decisions that are hard to reverse.

## Quick Rules

Write an ADR when a decision changes architecture or long-term behavior, especially for:
- auth or permissions model
- data model or migrations
- deployment/runtime architecture
- queue/caching/eventing strategy
- major framework/library adoption with architectural impact

Do not write an ADR for:
- typo/docs-only changes
- routine refactors with no behavior change
- small implementation details that are easy to change later

## Status Definitions

- `Proposed`: under consideration, not final
- `Accepted`: chosen and active
- `Deprecated`: no longer recommended
- `Superseded`: replaced by a newer ADR

## Naming Convention

- File name format: `ADR-XXX-short-kebab-title.md`
- Example: `ADR-008-api-error-format.md`
- Keep numbering sequential and never reuse numbers.

## Current ADRs

| ADR | Title | Status |
|---|---|---|
| ADR-000 | Template | Template |
| ADR-001 | Manual-First Guardrail Enforcement (Optional Automation) | Accepted |
| ADR-002 | Risk-Tiered Process Gates | Accepted |
| ADR-003 | Primary-Source Context Pack Policy | Accepted |
| ADR-004 | Walking Skeleton Before Breadth | Accepted |
| ADR-005 | Architecture Learning Ladder | Accepted |
| ADR-006 | Trigger-Based Scalability Learning | Accepted |
| ADR-007 | Weekly Architecture Review Cadence | Accepted |

## How to Add a New ADR

1. Copy `ADR-000-TEMPLATE.md`.
2. Create next sequential file name (for example `ADR-008-...`).
3. Fill all sections with concrete tradeoffs and consequences.
4. Set status to `Proposed` during discussion, then `Accepted` when decided.
5. If replacing an older ADR, mark older one as `Superseded` and link the new ADR.
6. Update the table in this `README.md`.

## Quality Bar

Before accepting an ADR, confirm:
- Context includes real constraints.
- At least two options were considered.
- Decision includes rationale, not just a conclusion.
- Consequences include both positive and negative outcomes.
- Proof/validation is explicit.
- References are filled for Tier 1/Tier 2 decisions when applicable.
