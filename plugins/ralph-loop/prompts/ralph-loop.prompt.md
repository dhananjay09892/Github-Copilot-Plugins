---
description: "Start an iterative Ralph loop for a task with max-iteration and completion-promise controls."
agent: agent
argument-hint: "TASK [--max-iterations N] [--completion-promise TEXT]"
tools: [search, edit, runCommands, runTests, problems]
---

# Ralph Loop

Follow [ralph-loop-standards](../instructions/ralph-loop-standards.instructions.md).

Arguments: $ARGUMENTS

## Goal

Start or continue a deterministic iteration loop over one stable prompt.

## Behavior

1. Parse arguments:
   - task prompt text (required)
   - `--max-iterations N` (optional, default unlimited)
   - `--completion-promise TEXT` (optional)
2. Initialize loop state by running:
   - PowerShell: `./plugins/ralph-loop/scripts/setup-ralph-loop.ps1 $ARGUMENTS`
3. Read `.copilot/ralph-loop.local.md` and execute iterations in this session.
4. On each iteration:
   - perform one or more focused implementation/debug steps,
   - run verification commands,
   - update state iteration counter and append short progress notes,
   - check completion promise truth conditions.
5. Stop when one condition is met:
   - completion promise is true and you can honestly output `<promise>TEXT</promise>`, or
   - max iteration count reached.
6. If max iterations reached without completion, report blockers and next best actions.

## Critical rule

If a completion promise is set, never output it unless it is fully and verifiably true.
