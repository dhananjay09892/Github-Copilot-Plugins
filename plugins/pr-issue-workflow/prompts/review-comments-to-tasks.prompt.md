---
description: "Convert a pull request's review comments into an ordered, actionable task checklist grounded in the actual comments."
agent: agent
argument-hint: "PR number or URL"
tools: [search, usages, runCommands, problems]
---

# Review Comments to Tasks

Follow [pr-issue-workflow-standards](../instructions/pr-issue-workflow-standards.instructions.md).

Pull request: $ARGUMENTS

## Goal

Turn scattered review feedback into a concrete, ordered checklist the author can work through,
without inventing action items that weren't actually requested.

## Steps

1. Confirm `gh auth status` succeeds. If `gh` is missing or unauthenticated, ask the user to paste
   the review comments instead of failing silently.
2. Read the actual review comments: `gh pr view <number> --comments` (and inline review comments via
   `gh api` if needed for file/line-anchored feedback).
3. Group comments by file, then convert each into a specific task: what to change and why, quoting
   or closely paraphrasing the reviewer's actual words.
4. Flag any comment that is unclear or contradicts another comment as a question for the user,
   rather than guessing the intended fix.
5. Order tasks by blocking severity first (must-fix before nice-to-have) based on the reviewer's own
   wording (e.g. "blocking", "nit").

## Output

- An ordered checklist: one task per distinct review comment, with file reference.
- Any comments that need clarification before they can be turned into a task.
- Do not apply any fix in this prompt — hand off to `implement-feature`/`debug-issue` from
  `dev-workflow`, or direct edits, once the user confirms which tasks to do first.
