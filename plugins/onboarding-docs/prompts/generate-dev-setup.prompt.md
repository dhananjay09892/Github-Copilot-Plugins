---
description: "Generate a local dev-setup guide covering prerequisites, install steps, environment variables, and how to run/build/test, verified against real repo files."
agent: agent
argument-hint: "Optional: target OS or environment to focus on"
tools: [search, edit, runCommands, problems]
---

# Generate Dev Setup Guide

Follow [onboarding-docs-standards](../instructions/onboarding-docs-standards.instructions.md).

Target environment: $ARGUMENTS (if empty, cover the primary supported environment)

## Goal

Produce a dev-setup guide a new contributor can follow start to finish without getting stuck,
using only commands that actually exist in this repository's tooling.

## Steps

1. Identify prerequisites (language/runtime versions, required global tools) from actual manifest
   files and any existing setup docs — not from general assumptions about the stack.
2. List install steps in order: dependency installation, environment file setup (`.env.example` if
   present), and any required local services.
3. List the exact commands to build, run, test, and lint, copied from real `package.json`
   scripts/`Makefile` targets/CI workflow steps — do not invent flags or commands that don't exist
   in the repo.
4. Where possible, verify a command exists by reading its source (e.g. confirm a `package.json`
   script name) rather than running the full command. Only execute a command if the user explicitly
   asks you to verify it by running it.
5. Call out anything likely to trip up a newcomer: required environment variables with no default,
   services that must be running first, or platform-specific steps.

## Output

- The dev-setup guide content (as a new file or a section to add to `CONTRIBUTING.md`, per user
  preference).
- Which commands were verified by reading their source versus verified by actually running them.
