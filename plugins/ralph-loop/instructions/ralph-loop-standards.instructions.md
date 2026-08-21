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

## Copilot Runtime Note

- Copilot has no stop-hook mechanism like Claude Code.
- Prompts should emulate loop behavior by reading/writing loop state and continuing iterations within the session.
