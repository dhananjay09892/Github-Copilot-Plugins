---
description: "Analyze a repository's architecture, conventions, and key modules to build grounded context before planning or implementing changes."
agent: agent
argument-hint: "Optional area/module to focus on"
tools: [search, usages, problems]
---

# Analyze Repository

Follow [architecture-standards](../instructions/architecture-standards.instructions.md) for baseline expectations.

Focus area: $ARGUMENTS (if empty, analyze the whole repository at a high level first).

## Goal

Produce a concise, accurate map of the codebase so later prompts (`plan-feature`, `implement-feature`,
`debug-issue`) can rely on it instead of re-discovering context.

## Steps

1. Identify the tech stack, entry points, build/test commands, and top-level module boundaries.
2. Trace how the focus area (or core feature paths if none given) flows through the code:
   key abstractions, data flow, external dependencies, and integration points.
3. Note existing conventions: naming, error handling, testing patterns, folder structure.
4. Identify any existing architecture docs (README, ADRs, `copilot-instructions.md`). If found,
   treat them as authoritative; if not, state that this analysis is being treated as the working
   baseline until confirmed.
5. Flag anything ambiguous, undocumented, or inconsistent that a future feature/plan should account for.

## Output

- A short architecture summary (bullets, not prose walls).
- A list of key files/dirs relevant to the focus area, with one line on what each does.
- Conventions to follow (style, testing, error handling).
- Open questions or risks worth surfacing before planning work.

Do not modify any files during this analysis.
