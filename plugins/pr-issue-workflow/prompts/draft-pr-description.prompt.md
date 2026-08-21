---
description: "Draft a pull request title and description from the actual diff on the current branch, then optionally open the PR via gh."
agent: agent
argument-hint: "Optional: base branch (default: repo default branch)"
tools: [search, usages, changes, runCommands, problems]
---

# Draft PR Description

Follow [pr-issue-workflow-standards](../instructions/pr-issue-workflow-standards.instructions.md).

Base branch: $ARGUMENTS (if empty, use the repository's default branch)

## Goal

Produce an accurate PR title and description grounded in the real diff, then offer to open the PR.

## Steps

1. Confirm `gh auth status` succeeds. If `gh` is missing or unauthenticated, say so and continue
   using only `git diff`/`git log` for drafting (skip the "open PR" step).
2. Read the actual diff against the base branch (`git diff <base>...HEAD` or `gh pr diff` if a PR
   already exists) — do not guess what changed.
3. Draft:
   - A concise, conventional-commit-style title.
   - A description covering: what changed and why, how it was tested/verified, and any follow-ups
     or known limitations.
4. Show the drafted title/description to the user for review before doing anything else.
5. If the user approves, show the exact command before running it:
   - `gh pr create --title "..." --body "..." --base <base>`
6. Do not run `gh pr create`, comment, or edit anything without explicit confirmation.

## Output

- The drafted PR title and description.
- The exact `gh pr create` command (not yet run) for the user to approve.
- Confirmation of whether the PR was actually opened, only after the user approves.
