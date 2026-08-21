---
description: "Scaffold a new *.instructions.md file with correct frontmatter, checking first that it doesn't duplicate an existing instruction file's scope."
agent: agent
argument-hint: "Topic or file pattern this instruction file should cover"
tools: [search, edit]
---

# Create Instruction File

Follow [customization-manager-standards](../instructions/customization-manager-standards.instructions.md).

Topic: $ARGUMENTS

## Goal

Add a new `*.instructions.md` file only when no existing file already covers this topic/scope.

## Steps

1. Search existing `.github/instructions/*.instructions.md` (and any `plugins/*/instructions/`) for
   a file whose `applyTo` pattern or content already covers this topic. If one exists, propose
   extending it instead of creating a new file.
2. If a new file is genuinely needed, pick a kebab-case filename ending in `.instructions.md` that
   names the topic, not a generic label like `rules.instructions.md`.
3. Write frontmatter with a non-empty, single-quoted `description` and a concrete `applyTo` glob
   (not `'**'` unless the guidance really is repo-wide).
4. Write the body as concise, natural-language rules with concrete examples of what code should and
   shouldn't look like — avoid restating generic best practices with no project-specific value.
5. If any existing prompt should link to this new instruction file, say so and offer to add the
   link.

## Output

- The path and full content of the new instruction file (or the proposed extension to an existing
  one, if a duplicate was found).
- Which prompts, if any, should now link to it.
