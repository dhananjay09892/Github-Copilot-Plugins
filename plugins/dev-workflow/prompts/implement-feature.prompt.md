---
description: "Implement a feature from an approved plan, following existing codebase conventions and architecture standards."
agent: agent
argument-hint: "Approved plan or feature description"
tools: [search, edit, runCommands, problems]
---

# Implement Feature

Follow [architecture-standards](../instructions/architecture-standards.instructions.md) for baseline expectations.

Plan / feature to implement: $ARGUMENTS

## Preconditions

- Only proceed if the plan is approved (from `plan-feature`) or the task is small/unambiguous enough
  to not need one. If requirements are still unclear, stop and ask instead of guessing.

## Steps

1. Re-read the relevant files identified in the plan/analysis before editing — do not rely on memory
   of a summary.
2. Implement strictly within the scope of the approved plan. Do not add unrequested features,
   refactors, or abstractions.
3. Match existing patterns: naming, error handling, logging, module boundaries.
4. Keep changes minimal and focused; prefer editing existing files over creating new ones.
5. Run relevant build/lint/test commands as you go to catch issues early.
6. Update or add tests for new/changed behavior (or hand off explicitly to `generate-tests`).

## Output

- Summary of files changed and why.
- Any deviations from the plan, with justification.
- Remaining follow-ups (e.g. "run `review-code` and `security-audit` next").

Do not silently expand scope beyond what was planned or requested.
