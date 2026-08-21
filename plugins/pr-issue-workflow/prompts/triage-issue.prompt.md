---
description: "Read a GitHub issue and propose labels, priority, and next action, grounded in the actual issue body and comments."
agent: agent
argument-hint: "Issue number or URL"
tools: [search, runCommands, problems]
---

# Triage Issue

Follow [pr-issue-workflow-standards](../instructions/pr-issue-workflow-standards.instructions.md).

Issue: $ARGUMENTS

## Goal

Propose an accurate triage (labels, priority, next action) based on what the issue actually says,
not just its title.

## Steps

1. Confirm `gh auth status` succeeds. If `gh` is missing or unauthenticated, ask the user to paste
   the issue body/comments instead of failing silently.
2. Read the full issue body and comments: `gh issue view <number> --comments`.
3. Identify: issue type (bug/feature/question/duplicate), affected area, severity/priority, and
   whether it's reproducible or missing information.
4. Propose specific labels that match the repository's existing label set
   (`gh label list`) rather than inventing new ones.
5. Propose one next action: fix now, needs more info (draft the exact question to ask), duplicate of
   issue #N, or won't-fix with reasoning.
6. If the user approves applying labels or commenting, show the exact command before running it:
   - `gh issue edit <number> --add-label "..."`
   - `gh issue comment <number> --body "..."`

## Output

- Triage summary: type, priority, proposed labels, and recommended next action.
- Any question that should be asked of the reporter, if information is missing.
- The exact `gh` command(s) to apply the triage, not yet run, pending user approval.
