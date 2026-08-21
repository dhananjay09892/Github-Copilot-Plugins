# Ralph Loop (Copilot Plugin)

Copilot-native port of the Ralph Wiggum iterative loop technique from the Claude plugin ecosystem.

## Included assets

- Prompts:
  - [`ralph-loop`](./prompts/ralph-loop.prompt.md)
  - [`cancel-ralph`](./prompts/cancel-ralph.prompt.md)
  - [`help`](./prompts/help.prompt.md)
- Shared standards:
  - [`ralph-loop-standards.instructions.md`](./instructions/ralph-loop-standards.instructions.md)
- Scripts:
  - [`setup-ralph-loop.ps1`](./scripts/setup-ralph-loop.ps1)
  - [`cancel-ralph.ps1`](./scripts/cancel-ralph.ps1)

## What this plugin does

- Starts an iterative loop for a stable task prompt.
- Persists loop state in `.copilot/ralph-loop.local.md`.
- Supports stop controls:
  - `--max-iterations N`
  - `--completion-promise TEXT`
- Provides a cancel command to stop active loops.

## Important runtime difference

Claude Code uses a Stop hook to block exit and auto-feed prompts. Copilot has no equivalent stop-hook runtime.
This plugin emulates the workflow with state files and prompt-driven iterations inside the session.

## Install into a project

Copy files into target repo:

- `prompts/*.prompt.md` -> `.github/prompts/`
- `instructions/*.instructions.md` -> `.github/instructions/`
- `scripts/*.ps1` -> any project script folder you prefer

Reload VS Code, then run `/ralph-loop` in Copilot Chat.

## Usage examples

- `/ralph-loop "Fix flaky auth tests" --max-iterations 12 --completion-promise "AUTH STABLE"`
- `/cancel-ralph`
- `/help`

## References

- https://ghuntley.com/ralph/
- https://github.com/mikeyobrien/ralph-orchestrator
