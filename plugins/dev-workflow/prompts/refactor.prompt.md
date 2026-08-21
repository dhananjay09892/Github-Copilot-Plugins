---
description: "Refactor code to improve structure, readability, or remove duplication without changing observable behavior."
agent: agent
argument-hint: "Code, file, or pattern to refactor"
tools: [search, usages, edit, runCommands, runTests]
---

# Refactor

Follow [architecture-standards](../instructions/architecture-standards.instructions.md) for baseline expectations.

Target: $ARGUMENTS

## Preconditions

- Confirm there are passing tests covering the target's current behavior before refactoring. If
  coverage is thin, add characterization tests first (or hand off to `generate-tests`) so the
  refactor can be verified as behavior-preserving.

## Steps

1. Identify the specific improvement goal (duplication, unclear naming, tangled responsibilities,
   outdated pattern) — don't refactor without a concrete reason.
2. Make changes incrementally; avoid mixing refactoring with new functionality in the same step.
3. Preserve existing public APIs/contracts unless the user explicitly approved a breaking change.
4. Run tests after each meaningful step to confirm behavior is unchanged.
5. Keep the diff as small as possible for the stated goal — do not opportunistically rewrite
   unrelated code.

## Output

- What was refactored and why (the concrete problem it solves).
- Confirmation tests still pass, with no behavior change.
- Any follow-up refactors identified but intentionally left out of scope.
