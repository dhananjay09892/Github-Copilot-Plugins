---
description: "Generate or update documentation (README, API docs, code comments) for a feature or module, matching existing doc conventions."
agent: agent
argument-hint: "Feature, module, or file to document"
tools: [search, edit]
---

# Documentation

Follow [architecture-standards](../instructions/architecture-standards.instructions.md) for baseline expectations.

Target: $ARGUMENTS

## Steps

1. Identify existing documentation conventions in the repo (README structure, docstring style,
   changelog format) and match them.
2. Determine the right doc surface for this change: README section, dedicated doc file, API
   reference, or inline code comments — don't default to creating a new file if an existing one
   should be updated instead.
3. Write for the actual audience (end users vs. contributors) — don't mix installation instructions
   with internal implementation notes.
4. Keep it accurate to the current code: verify described behavior, commands, and examples actually
   work before writing them down.
5. Keep inline comments minimal — only where the code's intent isn't obvious from reading it.

## Output

- List of doc files created/updated and why.
- Confirmation that any documented commands/examples were verified against the actual code.

Do not create new markdown files unless the user asked for one or no suitable existing doc exists.
