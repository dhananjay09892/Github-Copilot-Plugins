---
description: "Audit this repository's .github/prompts, .github/instructions, and .github/agents files for missing frontmatter, broken links, and duplicated rules."
agent: agent
argument-hint: "Optional: a specific folder or plugin to audit"
tools: [search, problems]
---

# Audit Customizations

Follow [customization-manager-standards](../instructions/customization-manager-standards.instructions.md).

Scope: $ARGUMENTS (if empty, audit all of `.github/prompts`, `.github/instructions`, and
`.github/agents`)

## Goal

Find concrete, fixable problems in this repository's own Copilot customization files before they
confuse contributors or Copilot itself.

## Steps

1. List every `*.prompt.md`, `*.instructions.md`, and `*.agent.md` file in scope.
2. For each prompt file, check: has a `description`; if it references architecture/requirements
   guidance, links to a real `*.instructions.md` file (verify the relative path actually resolves).
3. For each instruction file, check: has a non-empty `description`; has an `applyTo` pattern.
4. For each agent file, check: has a `description`; ideally has `tools` and `model`.
5. Look for duplicated rules: two instruction files covering the same topic/`applyTo` scope with
   overlapping content.
6. Look for orphaned files: prompts/instructions that exist but are never linked from any README or
   `plugin.json`.

## Output

- A table of findings: file path, issue, and the specific fix needed.
- Group findings by severity: broken link (blocking) > missing required field (should-fix) >
  duplicated rule (should-fix) > orphaned file (nice-to-have).
- Ask which findings the user wants fixed before making any edits.

Do not modify any files during the audit itself.
