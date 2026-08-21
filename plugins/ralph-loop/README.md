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
  - `--max-iterations N` (defaults to `5` when omitted)
  - `--completion-promise TEXT`
- Provides a cancel command to stop active loops.

## Important runtime difference

Claude Code uses a Stop hook to block exit and auto-feed prompts. Copilot has no equivalent stop-hook runtime.
This plugin emulates the workflow with state files and prompt-driven iterations inside the session.

## Install into a project

**Quick install from PowerShell:**

Run this command from the root of the target repository. It downloads the prompts, instructions,
and PowerShell scripts directly from GitHub:

```powershell
$base = "https://raw.githubusercontent.com/dhananjay09892/Github-Copilot-Plugins/main/plugins/ralph-loop"; New-Item -ItemType Directory -Force .github/prompts, .github/instructions, scripts | Out-Null; @("cancel-ralph", "help", "ralph-loop") | ForEach-Object { Invoke-WebRequest "$base/prompts/$_.prompt.md" -OutFile ".github/prompts/$_.prompt.md" }; Invoke-WebRequest "$base/instructions/ralph-loop-standards.instructions.md" -OutFile ".github/instructions/ralph-loop-standards.instructions.md"; @("cancel-ralph", "setup-ralph-loop") | ForEach-Object { Invoke-WebRequest "$base/scripts/$_.ps1" -OutFile "scripts/$_.ps1" }
```

After the command completes, reload VS Code and run `/ralph-loop` in Copilot Chat. Review existing
files with the same names before running this command because the downloads replace those files.

Copy files into target repo:

- `prompts/*.prompt.md` -> `.github/prompts/`
- `instructions/*.instructions.md` -> `.github/instructions/`
- `scripts/*.ps1` -> `scripts/` at the target repository root

The prompts call `./scripts/setup-ralph-loop.ps1` and `./scripts/cancel-ralph.ps1`, so keep the
scripts in that location unless you also update the prompt files.

Reload VS Code, then run `/ralph-loop` in Copilot Chat.

## Usage examples

- `/ralph-loop "Fix flaky auth tests" --max-iterations 12 --completion-promise "AUTH STABLE"`
- `/cancel-ralph`
- `/help`

## References

- https://ghuntley.com/ralph/
- https://github.com/mikeyobrien/ralph-orchestrator
