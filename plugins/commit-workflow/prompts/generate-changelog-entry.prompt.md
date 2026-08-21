---
description: "Draft a Keep a Changelog-style entry from the actual staged diff or recent commits."
agent: agent
argument-hint: "Optional: version/release heading this entry belongs under"
tools: [search, changes, runCommands, edit, problems]
---

# Generate Changelog Entry

Follow [commit-workflow-standards](../instructions/commit-workflow-standards.instructions.md).

Release heading: $ARGUMENTS (if empty, add under an `Unreleased` section)

## Goal

Add an accurate changelog entry grounded in the real change, written for the people using the
project rather than as an internal implementation note.

## Steps

1. Read the actual staged diff (`git diff --staged`) or recent commits (`git log`) that this entry
   should describe — don't guess from a commit title alone.
2. Categorize the change using Keep a Changelog headings: Added, Changed, Deprecated, Removed,
   Fixed, Security.
3. Write one concise bullet per change, from the user's perspective (what they'll notice), not the
   internal mechanism.
4. Check whether `CHANGELOG.md` already exists and follows this format. If it does, insert the entry
   under the correct heading/section. If not, ask before introducing a new format.

## Output

- The drafted changelog entry.
- The exact section/heading it should go under.

Do not modify `CHANGELOG.md` without showing the entry first and getting explicit confirmation.
