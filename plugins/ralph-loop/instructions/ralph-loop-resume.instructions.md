---
description: "Resume the active Ralph loop from saved state, avoid restarting, and continue the same task safely."
applyTo: "**"
---

# Ralph Loop Resume Instructions

Use this file when the user wants to continue an active Ralph loop in Copilot.

## Rules

- If `.copilot/ralph-loop.local.md` exists, resume that loop instead of creating a second one.
- Re-read the saved prompt and verify the current iteration count, max iterations, and completion promise.
- Re-state the objective and acceptance criteria before changing code.
- Run the smallest validation needed for the task.
- Continue iterating until either the completion promise is fully true or the max iteration limit is reached.
- Never output a completion promise unless it is verifiably true.
- If the task is blocked, document the blocker and the next best action instead of pretending success.
