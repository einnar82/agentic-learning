# Session Logs

Use this folder for completed or in-progress session logs.

## Naming

- File format: `YYYY-MM-DD.md`
- Example: `2026-02-08.md`
- Keep one file per day. Append multiple working blocks to the same daily file.

## Workflow

1. Copy `docs/WORKING_SESSION.md` to `docs/sessions/YYYY-MM-DD.md` at session start.
2. If the session starts a new runnable project in `apps/`, fill or update `docs/PROJECT_BRIEF.md` (optional for docs/process-only sessions).
3. Fill required fields first:
- Date
- Session Goal
- Plan (max 3 tasks)
- Build Log (`Explain -> Change -> Prove`)
- What I Can Now Explain
- Next Session Plan
4. For behavior-changing work, include proof artifacts in the Build Log.
5. For hard-to-reverse decisions, create or update an ADR and link it in the session file.

## Completion Standard

A session log is complete when all required fields are present and the Build Log contains at least one `Explain -> Change -> Prove` entry.
