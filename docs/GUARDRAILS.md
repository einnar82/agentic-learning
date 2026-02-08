# AI-Assisted Learning-by-Building Guardrails

These guardrails define how we learn new tech by creating a new project **without losing control, quality, or deadlines**.  
They apply to any stack (Node/TS, Go, PHP, etc.) and assume AI tools may be used.

---

## 0. Minimum Viable Ceremony (Default Operating Mode)

Use this as the default baseline. Escalate to stricter process only when risk is higher.

### 0.1 Required Artifacts

Create and maintain:
- `docs/PROJECT_BRIEF.md` (once per project)
- `docs/WORKING_SESSION.md` (updated each session)
- ADR files only when ADR trigger conditions are met

### 0.2 Required Session Fields (10-minute overhead target)

For each session, complete only:
- Date
- Session Goal
- Plan (max 3 tasks)
- Build Log (Explain -> Change -> Prove)
- What I Can Now Explain
- Next Session Plan

Everything else in `WORKING_SESSION.md` is optional unless risk tier requires it.

### 0.3 ADR Trigger (Write ADR only if hard to reverse)

ADR is required for decisions involving:
- auth/permissions model
- data model or migrations
- deployment/runtime architecture
- queue/caching/eventing strategy
- major framework/library adoption that affects architecture

### 0.4 Risk Tier Minimums

- Tier 0: docs/format/refactor with no behavior change
  - Proof optional
- Tier 1: normal feature/bugfix behavior changes
  - Proof required
  - References recommended
- Tier 2: security/data/infra/concurrency-sensitive changes
  - Proof required
  - ADR required
  - Threat note required
  - Rollback note required
  - References required

### 0.5 Efficiency Guard

- Process budget target: ceremony should stay under 20% of total session time.
- If ceremony feels heavy for two sessions in a row, remove one required field from your session checklist and reassess after one week.
- Default to Tier 1 unless a change is clearly Tier 0 or Tier 2.

---

## A. Prime Directives (Non‑negotiables)

1) **Plan First, Always**  
   No code until a written plan exists (even if short).

2) **You Must Own the Code**  
   If you can’t explain a change, it doesn’t go in.

3) **Evidence Over Confidence**  
   AI suggestions require verification (tests, docs, measurements).

4) **Small, Reversible Steps**  
   Prefer changes you can revert quickly (feature flags, small diffs, isolated commits).

---

## B. Project Scoping Guardrails

5) **One‑Page Project Brief Required**  
   Include: goal, non‑goals, success criteria, target users, constraints (time/resources).

6) **Vertical Slice First**  
   Build 1 end‑to‑end flow before adding breadth.

7) **Feature Cap for v1**  
   Max **3 core features** for the first milestone.

8) **Timebox Learning Spikes**  
   Unknowns must be timeboxed; if not proven, revert or park.

---

## C. Decision‑Making Guardrails (Architecture)

9) **ADR‑Lite for Any Non‑Trivial Decision**  
   Use ADRs for choices that affect architecture/behavior: auth, data model, queueing, caching, deployment, etc.

10) **Default‑First Principle**  
   Start with boring defaults (simple modules, standard libs, minimal services). Add complexity only with justification.

11) **Complexity Budget**  
   Each project has an explicit complexity budget (e.g., “no microservices/queues” unless ADR‑approved).

12) **Quality Attributes Chosen Upfront**  
   Pick top 3 (e.g., reliability, security, maintainability). Decisions must optimize these.

13) **Risk Tiering for Changes**  
   - **Tier 0:** docs/typos/refactors, no behavior change  
   - **Tier 1:** normal feature/bugfix  
   - **Tier 2:** auth, payments, permissions, data migrations, infra, concurrency, security-sensitive behavior  
   Higher tier = stricter proof + review.

---

## D. Planning Guardrails (Before You Code)

14) **Design Checklist Must Be Completed**
   - domain model sketch (entities + relationships)
   - API or UI surface list (routes/endpoints/screens)
   - data storage plan (where, format, schema)
   - error handling approach (codes/messages/retries)
   - observability plan (logs/metrics/traces)
   - testing plan (minimum viable tests)
   - rollout/rollback plan (flags, migrations, reversibility)

15) **Assumptions Log**
   Any assumption must be listed. If critical, verify via docs or a spike.

16) **Acceptance Criteria Written First**
   “Done means…” with observable outcomes.

---

## E. Implementation Guardrails (How We Code)

17) **Small Diffs Rule**
   One concept per change; keep diffs small and reviewable.

18) **Explain → Change → Prove (Mandatory Loop)**
   Every chunk must include:
   - **Explain:** your words, what and why  
   - **Change:** minimal patch  
   - **Prove:** tests/logs/repro steps/benchmark

19) **No Unbounded Refactors**
   Refactors require a safety net (tests) and must be isolated from feature work.

20) **Stop‑the‑Line on Confusion**
   If you don’t understand an AI-generated block: pause, isolate, explain, or rewrite manually.

21) **Human‑Owned Interfaces**
   Public contracts (API schemas, DB schema, event payloads) must be authored/reviewed by a human.

---

## F. AI Usage Guardrails (Prompting + Control)

22) **Ask for a Plan Before Code**
   AI must propose steps + file touches + risks first.

23) **Minimal Patch Requests**
   Always request the smallest diff. Reject multi‑file rewrites unless necessary and justified.

24) **Clarifying Questions Rule**
   If requirements are ambiguous, questions must be asked (by AI or by you) before implementation.

25) **Assumption Disclosure**
   AI output must list assumptions; you confirm or correct them.

26) **AI is Not a Source**
   AI outputs are hypotheses, not evidence. Validate with docs or experiments.

---

## G. Debugging Guardrails (Where Learning Happens)

27) **You Read the Error First**
   Identify file/line/symptom before asking AI.

28) **Hypothesis First**
   Write a one‑sentence hypothesis before AI help.

29) **Repro Steps Required**
   Every bug fix needs a reproducible scenario (even minimal).

30) **Instrumentation Before Guessing**
   Add logs/traces or a small test to confirm reality.

---

## H. Testing & Verification Guardrails

31) **MVP Test Baseline**
   At least:
   - one smoke test (script or API call)
   - a few unit tests for core logic

32) **Definition of Proof**
   Proof must be one of:
   - passing tests
   - reproducible manual steps
   - measurable benchmark
   - logs showing expected behavior

33) **Regression Rule**
   Every bug fix adds a guard (test or check) to prevent recurrence.

---

## I. Security & Data Guardrails

34) **No Secrets / No PII in Prompts or Repo**
   Use `.env.example`, fake data, sanitized logs.

35) **Threat‑Check for Tier 2 Areas**
   For auth/permissions/data handling: list top 5 abuse/attack cases and mitigations.

36) **Dependency Discipline**
   Minimize dependencies; document why each is added.

---

## J. Observability & Operability Guardrails

37) **Structured Logging Minimum**
   Consistent fields (e.g., request_id, error_code; user identifiers only if safe).

38) **Health Checks**
   Provide readiness/liveness endpoints (or equivalent) when applicable.

39) **Runbook Lite**
   “How to run, debug, rollback” must exist in README.

---

## K. Web‑Verified, Cited Engineering (General Rule)

40) **Web‑First Verification Rule (Tier 1 + Tier 2)**
   Before implementing or approving non‑trivial behavior, verify via web search:
   - official docs (framework/library/provider)
   - specs/RFCs (when relevant)
   - maintainer repos / release notes (breaking changes)

41) **Primary Source Priority**
   1) Official docs/specs/RFCs  
   2) Maintainer repos (official org)  
   3) Trusted engineering references  
   4) Everything else only if cross‑checked

42) **Citation Requirement (Tier 1 + Tier 2)**
   Provide **1–5 links** (max) that support:
   - key technique used
   - architectural choice
   - any security/perf‑sensitive behavior

43) **Context Pack Before Build**
   For new subsystems/modules, create a mini context pack:
   - 2–5 official links
   - your summary bullets
   - validated constraints/assumptions

---

## L. Documentation & Knowledge Retention Guardrails

44) **Teach‑Back Notes**
   After each feature: short note explaining concept + tradeoffs.

45) **README as Contract**
   Setup, architecture bullets, key decisions (links to ADRs), known limitations.

46) **Glossary for New Tech**
   Define the 10 key terms used in the project.

---

## M. Completion / Graduation Guardrails

47) **Rebuild Test**
   You can rebuild the project from notes (without AI).

48) **Decision Review**
   Revisit ADRs: keep/change decisions based on what you learned.

49) **Postmortem Lite**
   What worked, what didn’t, next improvements.

---

## Appendix: PR Template (Default Sections)

Include these sections in PRs by default:

- Intent  
- Scope (what changed)  
- **Risk tier (when needed):** [ ] N/A  [ ] Tier 1  [ ] Tier 2  
- Risk + blast radius  
- Proof (tests/manual/benchmark)  
- Rollback  
- **References (default, nullable)**  
  - Links OR “N/A – <reason>” (e.g., Tier 0 / N/A, already covered by ADR, verified by experiment)

### How to use Risk Tiers (only when checked)

- If **Risk tier = N/A**: proceed normally.
- If **Risk tier = Tier 1**:
  - References should be included (or “N/A – reason” if genuinely not applicable).
  - Proof must be explicit (tests and/or clear reproducible manual steps).
- If **Risk tier = Tier 2**:
  - References are expected (rarely “N/A”).
  - Proof must include tests (or a documented, repeatable verification procedure if tests are not feasible).
  - Include a brief edge-case / threat note (top risks + mitigations).
