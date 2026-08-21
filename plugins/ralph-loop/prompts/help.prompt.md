---
description: "Explain Ralph loop, when to use it, and available commands."
agent: ask
---

# Ralph Loop Help

Explain to the user:

1. What Ralph loop is:
   - A repeat-evaluate-improve workflow with a stable prompt.
   - Work persists in files, and each iteration builds on previous outcomes.

2. Available prompts:
   - `/ralph-loop TASK [--max-iterations N] [--completion-promise TEXT]`
   - `/cancel-ralph`
   - `/help` (this prompt)

3. Completion promises:
   - Use `<promise>TEXT</promise>` only when statement is true.
   - Never fake completion to exit iteration loops.

4. When to use:
   - Good for well-scoped tasks with clear checks.
   - Not ideal for tasks requiring frequent human product decisions.

5. Practical tip:
   - Always set `--max-iterations` to avoid runaway loops.

6. References:
   - https://ghuntley.com/ralph/
   - https://github.com/mikeyobrien/ralph-orchestrator
