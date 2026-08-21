---
description: "Review code changes for correctness, simplicity, and adherence to project conventions — without applying fixes unless asked."
agent: agent
argument-hint: "Files, PR, or diff to review"
tools: [search, usages, problems, changes]
---

# Review Code

Follow [architecture-standards](../instructions/architecture-standards.instructions.md) for baseline expectations.

Scope: $ARGUMENTS (if empty, review the current uncommitted changes)

## Steps

1. Read the diff/changed files in full context, not just the changed lines — check how they're used
   elsewhere.
2. Evaluate for: correctness/bugs, simplicity and DRY-ness, adherence to existing conventions and
   abstractions, and readability.
3. Check for scope creep: does the change do more (or less) than it should?
4. Check test coverage for the change — flag missing tests for new/changed behavior.
5. Rank findings by severity (blocking, should-fix, nice-to-have) rather than listing everything flat.

## Output

- Findings grouped by severity, each with file/line reference and concrete suggestion.
- A short overall verdict (ready to merge / needs changes / needs discussion).
- Explicitly ask the user which findings they want addressed before making any edits.

Do not modify code in this prompt unless the user asks you to apply a specific fix.
