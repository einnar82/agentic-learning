# Agentic Learning Docs Framework

A lightweight, reusable documentation system for learning by building with AI assistants.

This repository defines a practical workflow to:
- learn technical topics while shipping real work
- keep decisions explicit with ADRs
- balance speed and rigor using risk tiers
- avoid over-engineering and unverified AI output

Start here for the end-to-end operating flow: `docs/WORKFLOW.md`.

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
- `docs/WORKING_SESSION.md`: reusable session template (required vs optional fields)
- `docs/sessions/`: dated session logs (`YYYY-MM-DD.md`)
- `docs/LEARNING_PROFESSOR_PLAYBOOK.md`: session intake, tracks, workflow, rubric
- `docs/adr/`: ADR templates, accepted decisions, and index
- `docs/llm/`: model-specific entrypoint instructions and startup prompt
- `AGENTS.md`: root entrypoint for Codex compatibility
- `docs/llm/SESSION_START.md`: copy-paste startup prompt for any model
- `docs/llm/CODEX.md`, `docs/llm/CLAUDE.md`, `docs/llm/CURSOR.md`, `docs/llm/GEMINI.md`: model-specific startup guides

## Quick Start

1. Create your project brief (new runnable projects only):
- If starting a new project under `apps/`, fill `docs/PROJECT_BRIEF.md`.
- For docs/process-only sessions, this step is optional.

2. Start a learning session:
- Use `docs/llm/SESSION_START.md` as your startup prompt in a new AI chat.
- Reply to intake picks using `LG-TC-DL-SM-TB` (example: `1-2-3-4-2`).
- Optional quick presets:
  - Basics tutorial: `2-4-1-2-1`
  - Basics concept lesson: `1-4-1-1-1`
  - Customize: send any valid `LG-TC-DL-SM-TB` value
- Session intake example:
  - `2-4-2-3-1` = Build a real feature, APIs and integrations, Intermediate, Debug clinic, 25 minutes.

3. Run the session with minimum ceremony:
- Copy `docs/WORKING_SESSION.md` to `docs/sessions/YYYY-MM-DD.md`.
- Update required fields in `docs/sessions/YYYY-MM-DD.md`.
- Execute each task using `Explain -> Change -> Prove`.

4. Capture architecture decisions:
- If a decision is hard to reverse, create a new ADR from `docs/adr/ADR-000-TEMPLATE.md`.
- Register it in `docs/adr/README.md`.

For the full lifecycle (start -> execute -> close), use `docs/WORKFLOW.md`.

## Tool-Specific Usage

- Codex: uses root `AGENTS.md` automatically; optional guide in `docs/llm/CODEX.md`
- Claude: use `docs/llm/CLAUDE.md` as the startup instruction source
- Cursor: use `docs/llm/CURSOR.md` as the startup instruction source
- Gemini: use `docs/llm/GEMINI.md`

## Canonical Intake Guard

- CI guard: `.github/workflows/canonical-intake-menu.yml` runs `scripts/check_canonical_intake_menu.sh` on pull requests and pushes to `main`.
- Validation mode: structural (required section headers in order, case-insensitive header matching, option counts, and numbering sequence). Option wording can be edited as long as structure stays valid.
- Local guard (pre-commit): enable repository hooks once with:
  - `git config core.hooksPath .githooks`
- Manual run:
  - `./scripts/check_canonical_intake_menu.sh`

## Minimum Viable Ceremony (Default)

Required artifacts:
- `docs/WORKING_SESSION.md` (template)
- `docs/sessions/YYYY-MM-DD.md` (per-session log)
- `docs/PROJECT_BRIEF.md` (required for new runnable project kickoff in `apps/`; optional for docs/process-only sessions)
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
