---
description: "Diagnose a bug or failure with root-cause analysis before proposing or applying a fix."
agent: agent
argument-hint: "Bug description, error message, or failing test"
tools: [search, usages, problems, runCommands, runTests, testFailure]
---

# Debug Issue

Follow [architecture-standards](../instructions/architecture-standards.instructions.md) for baseline expectations.

Issue: $ARGUMENTS

## Steps

1. Reproduce the problem first: run the failing test/command, or find concrete evidence (stack trace,
   logs, diagnostics) rather than theorizing from the description alone.
2. Trace the failure to its root cause — follow the actual code path, don't stop at the first
   plausible-looking suspect. Verify hypotheses with evidence (add temporary logging, run the
   debugger, re-read the exact failing line) before concluding.
3. Check for related occurrences of the same bug pattern elsewhere in the codebase.
4. Propose the smallest correct fix that addresses the root cause, not just the symptom.
5. Apply the fix, then re-run the reproduction to confirm it's resolved.
6. Add or update a test that would have caught this bug, if one doesn't already exist.

## Output

- Root cause explanation (not just "what" but "why").
- The fix applied, and why it's the right scope (not broader/narrower than needed).
- Confirmation the reproduction now passes.
- Any related risk areas found but not yet fixed, for the user to decide on.

Do not apply a speculative fix without first confirming the root cause.
