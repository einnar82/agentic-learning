# Agentic Learning Docs Framework

A lightweight, reusable documentation system for learning by building with AI assistants.

This repository defines a practical workflow to:
- learn technical topics while shipping real work
- keep decisions explicit with ADRs
- balance speed and rigor using risk tiers
- avoid over-engineering and unverified AI output

## Who This Is For

- Solo developers learning new stacks
- Builders who want structure without heavy process
- Teams that want a generic, stack-agnostic learning workflow

## Core Principles

- Plan first before code
- Keep changes small and reversible
- Use `Explain -> Change -> Prove`
- Verify non-trivial decisions with primary sources
- Record hard-to-reverse decisions as ADRs

## Repository Structure

- `docs/GUARDRAILS.md`: full policy and minimum viable ceremony
- `docs/PROJECT_BRIEF.md`: one-page kickoff scope and constraints
- `docs/WORKING_SESSION.md`: session log template (required vs optional fields)
- `docs/LEARNING_PROFESSOR_PLAYBOOK.md`: session intake, tracks, workflow, rubric
- `docs/adr/`: ADR templates, accepted decisions, and index
- `docs/llm/`: model-specific entrypoint instructions and startup prompt
- `AGENTS.md`: root entrypoint for Codex compatibility
- `CLAUDE.md`: root entrypoint for Claude compatibility
- `.cursorrules`: root rules for Cursor compatibility

## Quick Start

1. Create your project brief:
- Fill `docs/PROJECT_BRIEF.md`.

2. Start a learning session:
- Use `docs/llm/SESSION_START.md` as your startup prompt in a new AI chat.

3. Run the session with minimum ceremony:
- Update required fields in `docs/WORKING_SESSION.md`.
- Execute each task using `Explain -> Change -> Prove`.

4. Capture architecture decisions:
- If a decision is hard to reverse, create a new ADR from `docs/adr/ADR-000-TEMPLATE.md`.
- Register it in `docs/adr/README.md`.

## Tool-Specific Usage

- Codex: uses root `AGENTS.md` automatically; optional guide in `docs/llm/CODEX.md`
- Claude: use root `CLAUDE.md`
- Cursor: uses root `.cursorrules` automatically; optional guide in `docs/llm/CURSOR.md`
- Gemini: use `docs/llm/GEMINI.md`

## Minimum Viable Ceremony (Default)

Required artifacts:
- `docs/PROJECT_BRIEF.md`
- `docs/WORKING_SESSION.md`
- ADRs only when triggered by hard-to-reverse decisions

Required per-session fields:
- Date
- Session Goal
- Plan (max 3 tasks)
- Build Log (`Explain -> Change -> Prove`)
- What I Can Now Explain
- Next Session Plan

Risk tiers:
- Tier 0: no behavior change, proof optional
- Tier 1: behavior change, proof required
- Tier 2: sensitive changes, proof + ADR + threat note + rollback + references required

## Current ADR Set

- ADR-001: Manual-first enforcement (optional automation)
- ADR-002: Risk-tiered process gates
- ADR-003: Primary-source context pack policy
- ADR-004: Walking skeleton first
- ADR-005: Architecture learning ladder
- ADR-006: Trigger-based scalability learning
- ADR-007: Weekly architecture review cadence

See `docs/adr/README.md` for the full index and status definitions.
