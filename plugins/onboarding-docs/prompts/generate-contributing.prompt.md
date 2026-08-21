---
description: "Generate or update CONTRIBUTING.md with setup, conventions, and PR process, grounded in the actual repository."
agent: agent
argument-hint: "Optional: specific section to focus on"
tools: [search, edit, problems]
---

# Generate Contributing Guide

Follow [onboarding-docs-standards](../instructions/onboarding-docs-standards.instructions.md).

Focus: $ARGUMENTS (if empty, cover the whole `CONTRIBUTING.md`)

## Goal

Give a new contributor everything needed to make their first change: how to set up, what
conventions to follow, and how to submit a change — without duplicating feature-specific docs.

## Steps

1. Check whether `CONTRIBUTING.md` already exists. If it does, update it in place rather than
   replacing it wholesale — preserve sections that are still accurate.
2. Identify the actual tech stack, package manager, and test/lint commands from real files
   (`package.json`, `pyproject.toml`, `Makefile`, CI workflow files) rather than assuming a stack.
3. Cover: prerequisites, how to get a local copy running, coding conventions actually observed in
   the codebase, how to run tests/lint, and the PR process (branch naming, review expectations) if
   one is evident from existing docs or workflow files.
4. Link to the dev-setup guide and architecture diagram (from this plugin) instead of repeating
   their content inline, if they exist.
5. Flag anything about the contribution process that isn't documented anywhere in the repo as a
   question for the user, rather than inventing a process.

## Output

- The updated or new `CONTRIBUTING.md` content.
- Anything verified against actual repo files versus anything the user should confirm.
