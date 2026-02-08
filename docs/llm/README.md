# LLM Entrypoints

This folder groups model-specific and startup prompt files to keep the repo root clean.

## Files

- `docs/llm/CODEX.md`
- `docs/llm/CLAUDE.md`
- `docs/llm/CURSOR.md`
- `docs/llm/GEMINI.md`
- `docs/llm/SESSION_START.md`

## Compatibility Notes

- Runtime hook files must remain at locations required by each tool (for example, root `AGENTS.md` for Codex).
- Files in `docs/llm/` are mirrored entrypoints and copy-paste templates; keep their startup policy aligned with root runtime hook files.
