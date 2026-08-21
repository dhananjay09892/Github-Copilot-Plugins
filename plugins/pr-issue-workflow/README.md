# PR & Issue Workflow (Copilot Plugin)

Draft PR descriptions, triage issues, and turn review comments into task checklists — grounded in
the real diff/issue/comment content and driven through the GitHub CLI (`gh`).

## Included assets

- Prompts:
  - [`draft-pr-description`](./prompts/draft-pr-description.prompt.md)
  - [`triage-issue`](./prompts/triage-issue.prompt.md)
  - [`review-comments-to-tasks`](./prompts/review-comments-to-tasks.prompt.md)
- Shared standards:
  - [`pr-issue-workflow-standards.instructions.md`](./instructions/pr-issue-workflow-standards.instructions.md)

## What this plugin does

- `/draft-pr-description` reads the actual diff against a base branch and drafts a PR title and
  description, then offers the exact `gh pr create` command for you to approve.
- `/triage-issue` reads a real issue's body and comments and proposes labels, priority, and a next
  action using the repository's existing label set.
- `/review-comments-to-tasks` turns a PR's review comments into an ordered, per-file checklist
  instead of you re-reading the whole thread manually.

## Safety model

- Read-only `gh` commands run automatically.
- Any `gh` command that changes GitHub state (`gh pr create`, `gh issue edit`, `gh pr comment`,
  labeling) is shown to you first and only runs after you approve it.
- These prompts never merge a PR, close an issue, or force-push.

## Prerequisites

- [GitHub CLI](https://cli.github.com/) (`gh`) installed and authenticated: `gh auth login`.
- If `gh` is missing or unauthenticated, the prompts fall back to drafting from information you
  paste in in the chat instead of failing silently.

## Install into a project

**Quick install from PowerShell:**

Run this command from the root of the target repository. It downloads the plugin directly from
GitHub and creates the required VS Code folders:

```powershell
$base = "https://raw.githubusercontent.com/dhananjay09892/Github-Copilot-Plugins/main/plugins/pr-issue-workflow"; New-Item -ItemType Directory -Force .github/prompts, .github/instructions | Out-Null; @("draft-pr-description", "triage-issue", "review-comments-to-tasks") | ForEach-Object { Invoke-WebRequest "$base/prompts/$_.prompt.md" -OutFile ".github/prompts/$_.prompt.md" }; Invoke-WebRequest "$base/instructions/pr-issue-workflow-standards.instructions.md" -OutFile ".github/instructions/pr-issue-workflow-standards.instructions.md"
```

After the command completes, reload VS Code and run `/draft-pr-description`, `/triage-issue`, or
`/review-comments-to-tasks` in Copilot Chat.

Review existing files with the same names before running this command because the downloads replace
those files.

**Manual copy:**

- `prompts/*.prompt.md` -> `.github/prompts/`
- `instructions/*.instructions.md` -> `.github/instructions/`

## Usage examples

- `/draft-pr-description main`
- `/triage-issue 482`
- `/review-comments-to-tasks 517`
