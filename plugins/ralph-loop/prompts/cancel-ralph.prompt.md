---
description: "Cancel the active Ralph loop by removing local loop state."
agent: agent
tools: [search, runCommands]
---

# Cancel Ralph

Follow [ralph-loop-standards](../instructions/ralph-loop-standards.instructions.md).

## Steps

1. Check if `.copilot/ralph-loop.local.md` exists.
2. If not found, respond: "No active Ralph loop found."
3. If found, run:
   - PowerShell: `./scripts/cancel-ralph.ps1`
4. Report cancellation with the last known iteration from state.
5. Treat the state file as the source of truth for the active iteration; if the file is missing, the loop is considered inactive.
