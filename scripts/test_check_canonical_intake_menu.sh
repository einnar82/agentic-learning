#!/usr/bin/env bash
set -euo pipefail

CHECK_SCRIPT="./scripts/check_canonical_intake_menu.sh"
MISSING_SEPARATOR_FIXTURE="scripts/fixtures/intake-menu-missing-separator.md"
EXPECTED_ERROR_SUBSTRING="must be followed by exactly one blank line before the next section"

"$CHECK_SCRIPT" >/dev/null

tmp_output="$(mktemp)"
trap 'rm -f "$tmp_output"' EXIT

if PLAYBOOK_FILE="$MISSING_SEPARATOR_FIXTURE" "$CHECK_SCRIPT" >"$tmp_output" 2>&1; then
  echo "ERROR: Expected checker to fail for missing-separator fixture."
  cat "$tmp_output"
  exit 1
fi

if ! grep -q "$EXPECTED_ERROR_SUBSTRING" "$tmp_output"; then
  echo "ERROR: Checker failed for fixture, but not for the expected reason."
  cat "$tmp_output"
  exit 1
fi

echo "OK: Checker rejects missing-separator fixture with the expected error."
