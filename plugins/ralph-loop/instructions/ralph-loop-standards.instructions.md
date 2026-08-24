---
description: "Shared standards for Ralph loop prompts. Defines safe iterative loop behavior and completion discipline."
applyTo: "**"
---

# Ralph Loop Standards

Use this file as the single source of truth for all Ralph loop prompts.

## Purpose

- Ralph loop is for iterative autonomous task execution with repeat-evaluate-improve cycles.
- Keep the prompt stable across iterations so improvements are driven by persisted work and verification feedback.

## Safety and Control

- Require at least one stop condition:
  - explicit completion promise, or
  - max iteration count.
- Do not claim completion unless the completion statement is verifiably true.
- If blocked, report blocker details and stop at iteration limit instead of fabricating success.

## Iteration Contract

Per iteration:
1. Re-state current objective and acceptance checks.
2. Execute the next smallest useful step.
3. Run verification (tests/lint/build/checks as applicable).
4. Record outcome and next action.

## Quality Bar

- Changes that alter behavior should include tests or a clear note on why tests are not feasible.
- Prefer minimal, scoped edits per iteration.
- Preserve existing architecture and conventions.

## State File

- Store loop state in `.copilot/ralph-loop.local.md`.
- Track at minimum: active flag, iteration, max iterations, completion promise, timestamps, and prompt text.
- If an active loop already exists, continue it instead of creating a second state file; the state file is the source of truth for the current task.

## Copilot Runtime Note

- Copilot has no stop-hook mechanism like Claude Code.
- This plugin is an emulation of the Ralph loop, not full runtime parity with the Claude implementation.
- Prompts should emulate loop behavior by reading/writing loop state, continuing the same task across iterations, and stopping only when the completion promise is genuinely true or the max iteration count is reached.
- If `.copilot/ralph-loop.local.md` already exists, continue that active loop instead of creating a second one.
