# Copilot Customization Manager (Copilot Plugin)

Audit and create this repository's own `.github/prompts`, `.github/instructions`, and
`.github/agents` files, catching missing frontmatter, broken links, and duplicated rules before they
confuse contributors or Copilot itself.

## Included assets

- Prompts:
  - [`audit-customizations`](./prompts/audit-customizations.prompt.md)
  - [`create-instruction-file`](./prompts/create-instruction-file.prompt.md)
  - [`create-prompt-file`](./prompts/create-prompt-file.prompt.md)
- Shared standards:
  - [`customization-manager-standards.instructions.md`](./instructions/customization-manager-standards.instructions.md)

## What this plugin does

- `/audit-customizations` scans `.github/prompts`, `.github/instructions`, and `.github/agents` for
  missing required frontmatter, broken relative links between prompts and instructions, duplicated
  rules across instruction files, and orphaned files nothing references.
- `/create-instruction-file` scaffolds a new `*.instructions.md` file with correct frontmatter —
  but first checks whether an existing file already covers the same topic, to avoid duplication.
- `/create-prompt-file` scaffolds a new `*.prompt.md` file for one focused task, linked to the
  right shared instructions file instead of repeating rules inline.

## Required frontmatter this plugin checks for

| File type | Required fields |
|---|---|
| `*.prompt.md` | `description` (recommended), `agent` (recommended) |
| `*.instructions.md` | `description` (required, non-empty), `applyTo` (required glob) |
| `*.agent.md` | `description` (required), `tools`/`model` (recommended) |

## Install into a project

**Quick install from PowerShell:**

Run this command from the root of the target repository. It downloads the plugin directly from
GitHub and creates the required VS Code folders:

```powershell
$base = "https://raw.githubusercontent.com/dhananjay09892/Github-Copilot-Plugins/main/plugins/copilot-customization-manager"; New-Item -ItemType Directory -Force .github/prompts, .github/instructions | Out-Null; @("audit-customizations", "create-instruction-file", "create-prompt-file") | ForEach-Object { Invoke-WebRequest "$base/prompts/$_.prompt.md" -OutFile ".github/prompts/$_.prompt.md" }; Invoke-WebRequest "$base/instructions/customization-manager-standards.instructions.md" -OutFile ".github/instructions/customization-manager-standards.instructions.md"
```

After the command completes, reload VS Code and run `/audit-customizations`,
`/create-instruction-file`, or `/create-prompt-file` in Copilot Chat.

Review existing files with the same names before running this command because the downloads replace
those files.

**Manual copy:**

- `prompts/*.prompt.md` -> `.github/prompts/`
- `instructions/*.instructions.md` -> `.github/instructions/`

## Usage examples

- `/audit-customizations`
- `/create-instruction-file Astro component conventions`
- `/create-prompt-file Generate a changelog entry from the current diff`

## References

- https://code.visualstudio.com/docs/copilot/customization/prompt-files
