---
description: "Scaffold a new *.prompt.md file for one focused task, linked to the relevant shared instructions file instead of duplicating rules."
agent: agent
argument-hint: "Task this prompt should perform"
tools: [search, edit]
---

# Create Prompt File

Follow [customization-manager-standards](../instructions/customization-manager-standards.instructions.md).

Task: $ARGUMENTS

## Goal

Add a new `*.prompt.md` file scoped to exactly one focused task, following this repository's
existing conventions.

## Steps

1. Check whether an existing prompt already covers this task (even partially) before creating a new
   one; if so, propose extending it instead.
2. Identify which shared `*.instructions.md` file this prompt should link to. If none exists yet for
   this domain, say so and suggest running `create-instruction-file` first.
3. Pick a kebab-case filename ending in `.prompt.md` that names the action (e.g.
   `generate-changelog.prompt.md`, not `prompt1.prompt.md`).
4. Write frontmatter: `description` (one sentence, actionable outcome), `agent` (`ask`, `edit`,
   `agent`, or a custom agent), `tools` (least-privilege — only what the task actually needs), and
   `argument-hint` if the prompt takes an argument.
5. Structure the body: link to the shared instructions file first, then `## Goal`, `## Steps`,
   `## Output`, matching the pattern used by existing prompts in this repository.
6. If this prompt belongs to an existing plugin, also add it to that plugin's `plugin.json`
   `contents.prompts` array and its README's asset list.

## Output

- The path and full content of the new prompt file.
- The instruction file it links to.
- Any `plugin.json`/README updates needed to register it.
