# Commit Workflow (Copilot Plugin)

Generate Conventional Commits-style commit messages and Keep a Changelog-style changelog entries,
grounded in the actual staged diff — not a guess of what changed.

## Included assets

- Prompts:
  - [`generate-commit-message`](./prompts/generate-commit-message.prompt.md)
  - [`generate-changelog-entry`](./prompts/generate-changelog-entry.prompt.md)
- Shared standards:
  - [`commit-workflow-standards.instructions.md`](./instructions/commit-workflow-standards.instructions.md)

## What this plugin does

- `/generate-commit-message` reads the real staged diff (`git diff --staged`) and drafts a
  [Conventional Commits](https://www.conventionalcommits.org/) message, flagging diffs that mix
  unrelated changes instead of writing one message that glosses over them.
- `/generate-changelog-entry` drafts a [Keep a Changelog](https://keepachangelog.com/)-style entry
  from the real diff or recent commits, written from the user's perspective.

## Scope boundary

This plugin covers commit messages and changelog entries only. PR titles/descriptions are handled by
`draft-pr-description` in the [`pr-issue-workflow`](../pr-issue-workflow) plugin.

## Prerequisites

- Run this inside a Git repository with a working tree and staged changes.
- The prompts are built around the real staged diff (`git diff --staged`), so they work best when
  you stage the files for the change you actually want summarized.
- If no staged changes exist, the prompts can still draft a general message from your context, but the
  quality will be lower because the repo diff is empty.

## Safety model

Neither prompt runs `git commit`, `git push`, or edits `CHANGELOG.md` without showing the exact
message/entry first and getting your explicit confirmation.

## Install into a project

**Quick install from PowerShell:**

Run this command from the root of the target repository. It downloads the plugin directly from
GitHub and creates the required VS Code folders:

```powershell
$base = "https://raw.githubusercontent.com/dhananjay09892/Github-Copilot-Plugins/main/plugins/commit-workflow"; New-Item -ItemType Directory -Force .github/prompts, .github/instructions | Out-Null; @("generate-commit-message", "generate-changelog-entry") | ForEach-Object { Invoke-WebRequest "$base/prompts/$_.prompt.md" -OutFile ".github/prompts/$_.prompt.md" }; Invoke-WebRequest "$base/instructions/commit-workflow-standards.instructions.md" -OutFile ".github/instructions/commit-workflow-standards.instructions.md"
```

After the command completes, reload VS Code and run `/generate-commit-message` or
`/generate-changelog-entry` in Copilot Chat.

Review existing files with the same names before running this command because the downloads replace
those files.

**Manual copy:**

- `prompts/*.prompt.md` -> `.github/prompts/`
- `instructions/*.instructions.md` -> `.github/instructions/`

## Usage examples

- `/generate-commit-message`
- `/generate-changelog-entry 1.4.0`
