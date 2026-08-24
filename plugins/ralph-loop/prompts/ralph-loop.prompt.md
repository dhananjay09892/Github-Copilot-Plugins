---
description: "Start an iterative Ralph loop for a task with max-iteration and completion-promise controls."
agent: agent
argument-hint: "TASK [--max-iterations N (default: 5)] [--completion-promise TEXT]"
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
   - `--max-iterations N` (optional, default 5; use a larger value only when needed)
   - `--completion-promise TEXT` (optional)
2. If `.copilot/ralph-loop.local.md` already exists, read it and continue the same task instead of starting a fresh loop. Otherwise initialize the loop state by running:
   - PowerShell: `./scripts/setup-ralph-loop.ps1 $ARGUMENTS`
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
7. Treat this as a prompt-driven emulation of Claude's auto-loop behavior, not as a perfect runtime parity feature: the agent must explicitly continue the same task across cycles until the promise is verifiably true.

## Critical rule

If a completion promise is set, never output it unless it is fully and verifiably true.
