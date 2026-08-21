# Onboarding Docs (Copilot Plugin)

Generate `CONTRIBUTING.md`, a local dev-setup guide, and a Mermaid architecture diagram — the docs a
brand-new contributor needs, grounded in the actual repository rather than a guessed structure.

## Included assets

- Prompts:
  - [`generate-contributing`](./prompts/generate-contributing.prompt.md)
  - [`generate-dev-setup`](./prompts/generate-dev-setup.prompt.md)
  - [`generate-architecture-diagram`](./prompts/generate-architecture-diagram.prompt.md)
- Shared standards:
  - [`onboarding-docs-standards.instructions.md`](./instructions/onboarding-docs-standards.instructions.md)

## What this plugin does

- `/generate-contributing` creates or updates `CONTRIBUTING.md`: setup, coding conventions actually
  observed in the codebase, and the PR process.
- `/generate-dev-setup` produces a dev-setup guide using only commands that actually exist in the
  repo's `package.json`/`Makefile`/CI files — never invented flags or commands.
- `/generate-architecture-diagram` produces a Mermaid diagram of the repository's real module
  boundaries and dependencies, not an idealized guess.

## Scope boundary

This plugin is repository-wide onboarding documentation for a first-time contributor. It is
distinct from the `documentation` prompt in the `dev-workflow` plugin, which documents a specific
feature or module.

## Install into a project

**Quick install from PowerShell:**

Run this command from the root of the target repository. It downloads the plugin directly from
GitHub and creates the required VS Code folders:

```powershell
$base = "https://raw.githubusercontent.com/dhananjay09892/Github-Copilot-Plugins/main/plugins/onboarding-docs"; New-Item -ItemType Directory -Force .github/prompts, .github/instructions | Out-Null; @("generate-contributing", "generate-dev-setup", "generate-architecture-diagram") | ForEach-Object { Invoke-WebRequest "$base/prompts/$_.prompt.md" -OutFile ".github/prompts/$_.prompt.md" }; Invoke-WebRequest "$base/instructions/onboarding-docs-standards.instructions.md" -OutFile ".github/instructions/onboarding-docs-standards.instructions.md"
```

After the command completes, reload VS Code and run `/generate-contributing`,
`/generate-dev-setup`, or `/generate-architecture-diagram` in Copilot Chat.

Review existing files with the same names before running this command because the downloads replace
those files.

**Manual copy:**

- `prompts/*.prompt.md` -> `.github/prompts/`
- `instructions/*.instructions.md` -> `.github/instructions/`

## Usage examples

- `/generate-contributing`
- `/generate-dev-setup macOS`
- `/generate-architecture-diagram`
