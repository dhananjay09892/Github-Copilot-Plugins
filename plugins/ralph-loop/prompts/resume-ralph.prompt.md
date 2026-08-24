---
description: "Resume the active Ralph loop from the saved state and continue the same task."
agent: agent
argument-hint: "[OPTIONAL CONTEXT]"
tools: [search, edit, runCommands, runTests, problems]
---

# Resume Ralph

Follow [ralph-loop-standards](../instructions/ralph-loop-standards.instructions.md).

## Goal

Resume the current Ralph loop using the existing state file rather than starting a second loop.

## Behavior

1. Check whether `.copilot/ralph-loop.local.md` exists.
2. If it does not exist, respond: "No active Ralph loop found. Run /ralph-loop to start one."
3. If it exists:
   - read the state file,
   - summarize the task, iteration number, max iteration limit, and completion promise,
   - restate the objective and the acceptance criteria,
   - continue the same task with the same prompt instead of creating a new one,
   - run validation relevant to the task,
   - decide either to continue iterating or to stop when the completion promise is genuinely true.
4. Never claim completion unless the promise is fully and verifiably true.
5. If max iterations are reached without completion, report blockers and the next best action clearly.

## Resume contract

This is a Copilot emulation of the Claude Ralph loop. It does not automatically re-trigger on exit. The agent must explicitly resume from the persistent state and continue the exact task from the last saved iteration.
