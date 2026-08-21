---
description: "Draft a Conventional Commits-style commit message from the actual staged diff."
agent: agent
argument-hint: "Optional: extra context about why this change was made"
tools: [search, changes, runCommands, problems]
---

# Generate Commit Message

Follow [commit-workflow-standards](../instructions/commit-workflow-standards.instructions.md).

Extra context: $ARGUMENTS

## Goal

Produce an accurate, Conventional Commits-style message grounded in the real staged diff.

## Steps

1. Read the actual staged diff (`git diff --staged`). If nothing is staged, say so and ask whether
   to look at unstaged changes instead.
2. Identify the correct `type` (`feat`, `fix`, `docs`, `refactor`, `test`, `chore`, etc.) and `scope`
   from the files actually changed — don't default to `chore` when the diff clearly adds a feature
   or fixes a bug.
3. Write a summary line under ~72 characters, and a body only if the change needs more explanation
   than the summary can hold.
4. If the diff contains a breaking change, mark it with `!` and add a `BREAKING CHANGE:` footer
   describing the actual break.
5. If the diff mixes clearly unrelated changes, flag this and suggest splitting into separate
   commits instead of writing one message that covers everything.

## Output

- The drafted commit message.
- Whether the diff looked like it should be split into multiple commits.

Do not run `git commit` without showing the message first and getting explicit confirmation.
