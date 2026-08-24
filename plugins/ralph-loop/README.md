# Ralph Loop (Copilot Plugin)

Copilot-native port of the Ralph Wiggum iterative loop technique from the Claude plugin ecosystem.

## Included assets

- Prompts:
  - [`ralph-loop`](./prompts/ralph-loop.prompt.md)
  - [`resume-ralph`](./prompts/resume-ralph.prompt.md)
  - [`cancel-ralph`](./prompts/cancel-ralph.prompt.md)
  - [`help`](./prompts/help.prompt.md)
- Shared standards:
  - [`ralph-loop-standards.instructions.md`](./instructions/ralph-loop-standards.instructions.md)
  - [`ralph-loop-resume.instructions.md`](./instructions/ralph-loop-resume.instructions.md)
- Scripts:
  - [`setup-ralph-loop.ps1`](./scripts/setup-ralph-loop.ps1)
  - [`continue-ralph.ps1`](./scripts/continue-ralph.ps1)
  - [`resume-ralph.ps1`](./scripts/resume-ralph.ps1)
  - [`cancel-ralph.ps1`](./scripts/cancel-ralph.ps1)

## What this plugin does

- Starts an iterative loop for a stable task prompt.
- Persists loop state in `.copilot/ralph-loop.local.md`.
- Supports stop controls:
  - `--max-iterations N` (defaults to `5` when omitted)
  - `--completion-promise TEXT`
- Provides a cancel command to stop active loops.

## Important runtime difference

This is a Copilot-native emulation of the Claude plugin, not a full runtime parity implementation. Claude Code uses a Stop hook to block exit and auto-feed prompts. Copilot has no equivalent stop-hook runtime, so this plugin intentionally uses persisted state and a prompt-driven iteration loop instead.

In practice, a Ralph loop in Copilot works like this:

1. Run `/ralph-loop "..." --max-iterations N --completion-promise "TEXT"`.
2. The plugin writes `.copilot/ralph-loop.local.md` with the task, iteration count, and completion promise.
3. Work on the task, run validation, and update the code.
4. If the task is not complete, continue the same task with the same prompt on the next cycle.
5. Stop only when the completion promise is genuinely true or the max iteration limit is reached.

This is a workflow approximation of the Claude behavior, not a direct drop-in replacement for Claude's automatic re-entry logic.

## Runtime differences from Claude Code

| Claude Code | Copilot |
| --- | --- |
| Real Stop hook intercepts exit and re-injects the same prompt | No equivalent exit hook exists in Copilot |
| Loop is automatic once the plugin is installed | Loop is session-managed through prompt state and explicit continuation |
| `.claude/ralph-loop.local.md` state file | `.copilot/ralph-loop.local.md` state file |
| Command lifecycle is native to Claude Code | Prompt, instruction, and script flow must be installed in the target repo |

## Iteration continuation workflow

After every verification pass, continue the same task using the same prompt until either:

- the completion promise is verifiably true, or
- the max iteration count is reached.

If an active loop already exists, read `.copilot/ralph-loop.local.md` before starting a new cycle so the iteration count and task context remain consistent.

## Install into a project

**Quick install from PowerShell:**

Run this command from the root of the target repository. It downloads the prompts, instructions,
and PowerShell scripts directly from GitHub:

```powershell
$base = "https://raw.githubusercontent.com/dhananjay09892/Github-Copilot-Plugins/main/plugins/ralph-loop"; New-Item -ItemType Directory -Force .github/prompts, .github/instructions, scripts | Out-Null; @("cancel-ralph", "help", "ralph-loop", "resume-ralph") | ForEach-Object { Invoke-WebRequest "$base/prompts/$_.prompt.md" -OutFile ".github/prompts/$_.prompt.md" }; @("ralph-loop-standards.instructions.md", "ralph-loop-resume.instructions.md") | ForEach-Object { Invoke-WebRequest "$base/instructions/$_" -OutFile ".github/instructions/$_" }; @("cancel-ralph", "continue-ralph", "resume-ralph", "setup-ralph-loop") | ForEach-Object { Invoke-WebRequest "$base/scripts/$_.ps1" -OutFile "scripts/$_.ps1" }
```

After the command completes, reload VS Code and run `/ralph-loop` in Copilot Chat. Review existing
files with the same names before running this command because the downloads replace those files.

`continue-ralph.ps1` is part of the loop lifecycle as well; it checks the current `.copilot/ralph-loop.local.md` state and helps you continue the last task without creating a second loop.

Copy files into target repo:

- `prompts/*.prompt.md` -> `.github/prompts/`
- `instructions/*.instructions.md` -> `.github/instructions/`
- `scripts/*.ps1` -> `scripts/` at the target repository root

The prompts call `./scripts/setup-ralph-loop.ps1`, `./scripts/resume-ralph.ps1`, `./scripts/cancel-ralph.ps1`, and `./scripts/continue-ralph.ps1`, so keep the scripts in that location unless you also update the prompt files.

Reload VS Code, then run `/ralph-loop` in Copilot Chat.

## Expected loop lifecycle in Copilot

1. Start a task with `/ralph-loop "..." --max-iterations N --completion-promise "TEXT"`.
2. The plugin writes `.copilot/ralph-loop.local.md`.
3. Perform implementation, testing, and debugging steps.
4. When the task is still incomplete, continue the same prompt in the next iteration instead of pretending the platform auto-restarts it.
5. Use `/cancel-ralph` to clear the state when you want to stop early.
6. If needed, call `./scripts/continue-ralph.ps1` to inspect the active state and resume from the last known iteration.

This repository version intentionally documents the workflow as a manual continuation loop because Copilot does not expose Claude's automatic Stop-hook behavior.

## Resume active loop

When a task is already in progress, do not start a second loop.

Use either:

- `/resume-ralph`
- or `./scripts/resume-ralph.ps1`

This reads the active `.copilot/ralph-loop.local.md` state and prints the current iteration, max iteration cap, completion promise, and the saved task prompt so the same task can continue safely.

## Usage examples

- `/ralph-loop "Fix flaky auth tests" --max-iterations 12 --completion-promise "AUTH STABLE"`
- `/resume-ralph`
- `/cancel-ralph`
- `/help`

## References

- https://ghuntley.com/ralph/
- https://github.com/mikeyobrien/ralph-orchestrator
