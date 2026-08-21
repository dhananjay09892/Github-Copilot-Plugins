---
description: "Shared safety standards for pr-issue-workflow prompts. Defines confirmation discipline for GitHub CLI actions on issues and pull requests."
applyTo: "**"
---

# PR & Issue Workflow Standards

Use this file as the single source of truth for all pr-issue-workflow prompts.

## Purpose

- Help developers draft PR descriptions, triage issues, and convert review feedback into task
  lists, grounded in the actual diff/issue/comment content rather than assumptions.
- All GitHub interaction goes through the `gh` CLI so the plugin works in any repo without
  requiring a specific MCP server or extension to be configured.

## Prerequisites

- `gh` (GitHub CLI) installed and authenticated (`gh auth status`). If `gh` is unavailable, the
  prompt must say so and offer the drafted text for the user to paste manually instead of failing
  silently.

## Read vs. write actions

- Read-only `gh` calls (`gh pr diff`, `gh issue view`, `gh pr view --comments`, `gh issue list`) may
  run without asking first.
- Any `gh` call that changes GitHub state (`gh pr create`, `gh pr edit`, `gh issue edit`,
  `gh issue comment`, `gh pr comment`, adding/removing labels) must be shown to the user as the exact
  command before running it, and only run after explicit confirmation.
- Never merge a pull request, close an issue, or force-push as part of these prompts.

## Grounding discipline

- Base PR descriptions on the actual diff (`git diff`/`gh pr diff`), not on a guess of what changed.
- Base issue triage on the actual issue body/comments (`gh issue view`), not on the issue title
  alone.
- Base task checklists on the actual review comments read, quoting or closely paraphrasing each one
  rather than inventing action items.

## Quality bar

- Keep PR descriptions and checklists concise and scannable — bullet points over prose walls.
- Flag anything ambiguous (e.g. a vague review comment) as a question rather than guessing the
  intended fix.

## Copilot Runtime Note

- These prompts use `runCommands` to invoke `gh`. If the user's tool picker has `runCommands`
  disabled, say so and offer to draft output from information already visible in the editor/chat
  instead of failing silently.
