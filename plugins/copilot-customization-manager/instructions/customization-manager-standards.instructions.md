---
description: "Shared conventions for copilot-customization-manager prompts. Defines required frontmatter and consistency rules for prompt, instruction, and agent files."
applyTo: "**"
---

# Copilot Customization Manager Standards

Use this file as the single source of truth for all copilot-customization-manager prompts.

## Purpose

- Help a repository maintain its own `.github/prompts`, `.github/instructions`, and `.github/agents`
  files: auditing them for gaps and scaffolding new ones that follow VS Code's conventions.

## Required frontmatter (verified against VS Code/GitHub Copilot customization guidelines)

### Prompt files (`*.prompt.md`, in `.github/prompts/`)

- `description` — recommended, one sentence, actionable outcome.
- `agent` — recommended: `ask`, `edit`, `agent`, or a custom agent name.
- `tools` — optional list of tool/tool-set names the prompt needs.
- `argument-hint` — optional hint text shown in the chat input.
- Filenames: kebab-case, ending in `.prompt.md`.

### Instruction files (`*.instructions.md`, in `.github/instructions/`)

- `description` — required, single-quoted, non-empty.
- `applyTo` — required glob pattern(s) for the files this instruction covers (e.g. `'**/*.ts'`,
  `'**'` for repo-wide standards).
- Filenames: kebab-case, ending in `.instructions.md`.

### Agent files (`*.agent.md`, in `.github/agents/`)

- `description` — required, single-quoted.
- `tools` — recommended.
- `model` — strongly recommended.
- Filenames: kebab-case, ending in `.agent.md`.

## Consistency rules

- Every prompt that has architecture/requirements guidance should link to a shared
  `*.instructions.md` file instead of repeating the rules inline.
- Do not create a new instruction file that duplicates rules already covered by an existing one —
  extend the existing file or narrow its `applyTo` instead.
- Keep each prompt scoped to one focused task; split a prompt that tries to do two unrelated jobs.

## Audit discipline

- Base every finding on the actual file content read, not on the filename alone.
- Report exact file paths and the specific missing/duplicated element — not a generic "needs
  cleanup" note.
- Do not silently fix files during an audit; propose changes and apply them only after the user
  confirms which ones to make.

## Copilot Runtime Note

- These prompts only read and write Markdown/JSON customization files in this repository — they do
  not require internet access or GitHub API tools.
