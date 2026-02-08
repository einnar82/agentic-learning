#!/usr/bin/env bash
set -euo pipefail

PLAYBOOK_FILE="docs/LEARNING_PROFESSOR_PLAYBOOK.md"
CANONICAL_HEADER="Canonical Intake Menu (copy verbatim when prompting the learner):"

if [[ ! -f "$PLAYBOOK_FILE" ]]; then
  echo "ERROR: Missing file: $PLAYBOOK_FILE"
  exit 1
fi

header_count="$(grep -cFx "$CANONICAL_HEADER" "$PLAYBOOK_FILE" || true)"
if [[ "$header_count" -ne 1 ]]; then
  echo "ERROR: Expected exactly one canonical intake header, found $header_count."
  exit 1
fi

actual_block="$(
  awk -v header="$CANONICAL_HEADER" '
    $0 == header { in_header=1; next }
    in_header && $0 == "```text" { in_block=1; next }
    in_block && $0 == "```" { exit }
    in_block { print }
  ' "$PLAYBOOK_FILE"
)"

if [[ -z "$actual_block" ]]; then
  echo "ERROR: Could not extract canonical intake block from $PLAYBOOK_FILE."
  exit 1
fi

is_blank() {
  [[ -z "${1//[[:space:]]/}" ]]
}

normalize_for_header_match() {
  printf '%s' "$1" | sed 's/^[[:space:]]*//; s/[[:space:]]*$//' | tr '[:upper:]' '[:lower:]'
}

skip_blank_lines() {
  while (( idx < total_lines )) && is_blank "${lines[idx]}"; do
    ((idx++))
  done
}

error_with_context() {
  local msg="$1"
  echo "ERROR: $msg"
  exit 1
}

lines=()
while IFS= read -r line; do
  lines+=("$line")
done < <(printf '%s\n' "$actual_block")
total_lines="${#lines[@]}"
idx=0

section_names=(
  "Learning Goal"
  "Topic Category"
  "Depth Level"
  "Session Mode"
  "Timebox"
)
section_option_counts=(5 8 4 5 3)

for s in "${!section_names[@]}"; do
  section="${section_names[$s]}"
  expected_count="${section_option_counts[$s]}"

  skip_blank_lines
  if (( idx >= total_lines )); then
    error_with_context "Missing section header '$section'."
  fi
  if [[ "$(normalize_for_header_match "${lines[idx]}")" != "$(normalize_for_header_match "$section")" ]]; then
    error_with_context "Expected section header '$section' at line $((idx + 1)), got '${lines[idx]}'."
  fi
  ((idx++))

  for ((expected_num=1; expected_num<=expected_count; expected_num++)); do
    if (( idx >= total_lines )); then
      error_with_context "Section '$section' is missing option $expected_num."
    fi

    line="${lines[idx]}"
    if [[ ! "$line" =~ ^([0-9]+)\.\ (.+)$ ]]; then
      error_with_context "Section '$section' has invalid option format at line $((idx + 1)): '$line'. Expected '<n>. <text>'."
    fi

    option_num="${BASH_REMATCH[1]}"
    option_text="${BASH_REMATCH[2]}"
    if [[ "$option_num" -ne "$expected_num" ]]; then
      error_with_context "Section '$section' expected option number $expected_num but found $option_num at line $((idx + 1))."
    fi
    if is_blank "$option_text"; then
      error_with_context "Section '$section' has empty option text at line $((idx + 1))."
    fi

    ((idx++))
  done

  if (( idx < total_lines )) && [[ "${lines[idx]}" =~ ^[0-9]+\.\  ]]; then
    error_with_context "Section '$section' has extra options starting at line $((idx + 1))."
  fi
done

skip_blank_lines
if (( idx >= total_lines )); then
  error_with_context "Missing 'Reply format: LG-TC-DL-SM-TB' line."
fi

reply_line="${lines[idx]}"
normalized_reply="${reply_line//\`/}"
normalized_reply="${normalized_reply//[[:space:]]/}"
if [[ "$normalized_reply" != "Replyformat:LG-TC-DL-SM-TB" ]]; then
  error_with_context "Invalid reply format line at line $((idx + 1)): '$reply_line'."
fi
((idx++))

skip_blank_lines
if (( idx < total_lines )); then
  error_with_context "Unexpected trailing content in canonical block at line $((idx + 1)): '${lines[idx]}'."
fi

echo "OK: Canonical intake menu structure is valid."
