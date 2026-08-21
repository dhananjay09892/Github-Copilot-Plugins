---
description: "Generate comprehensive test cases for specified code, following existing test conventions in the repo."
agent: agent
argument-hint: "File, function, or feature to test"
tools: [search, usages, edit, runTests]
---

# Generate Tests

Follow [architecture-standards](../instructions/architecture-standards.instructions.md) for baseline expectations.

Target: $ARGUMENTS

## Steps

1. Identify the existing test framework, file naming, and assertion style used in the repo — match it
   exactly rather than introducing a new style.
2. Read the target code to understand its inputs, outputs, side effects, and error paths.
3. Cover: happy path, boundary/edge cases, invalid input, error handling, and any concurrency or
   async behavior if relevant.
4. Avoid redundant tests that only re-assert the same branch; each test should cover a distinct case.
5. Add tests in the correct location relative to existing test structure.
6. Run the new tests to confirm they pass (and that they'd fail without the code under test, when
   feasible, to confirm they're meaningful).

## Output

- List of test cases added, grouped by what each one verifies.
- Any gaps you couldn't cover (e.g. missing test doubles/fixtures) and why.
- Confirmation tests were run and pass.
