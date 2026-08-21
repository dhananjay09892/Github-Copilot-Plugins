---
description: "Generate a Mermaid architecture diagram of this repository's real module/folder structure and dependencies for new contributors."
agent: agent
argument-hint: "Optional: area/module to focus the diagram on"
tools: [search, usages, edit]
---

# Generate Architecture Diagram

Follow [onboarding-docs-standards](../instructions/onboarding-docs-standards.instructions.md).

Focus area: $ARGUMENTS (if empty, diagram the whole repository at a high level)

## Goal

Give a new contributor a one-read map of how the codebase is actually structured, based on real
module boundaries — not a guessed, idealized architecture.

## Steps

1. Identify the top-level modules/services/folders and what each one is responsible for.
2. Trace real dependencies between them (actual imports, API calls, shared config) rather than
   assuming a typical layered architecture.
3. Choose an appropriate Mermaid diagram type (`flowchart`, `graph`, or `classDiagram` for
   object-heavy codebases) for what the structure actually looks like.
4. Keep the diagram at a level a newcomer can absorb in one read — top-level modules and their real
   dependencies, not every file or function.
5. Save the diagram to a docs file (e.g. `docs/ARCHITECTURE.md` or alongside `CONTRIBUTING.md`),
   checking first whether an existing architecture doc should be updated instead.

## Output

- The Mermaid diagram source, embedded in the target doc file.
- A short caption explaining what each node/group represents.
- Anything ambiguous about module boundaries, flagged for the user to confirm.
