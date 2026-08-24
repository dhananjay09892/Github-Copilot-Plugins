# Code Simplifier (Copilot Plugin)

An agent-focused plugin that simplifies and refines code for clarity, consistency, and maintainability while preserving all behavior.

## Included asset

- Agent: [`code-simplifier`](./agents/code-simplifier.md)

## What it does

- Reviews recently modified code and applies targeted simplifications
- Keeps behavior unchanged while improving readability and maintainability
- Follows established project standards and best practices
- Prefers explicit clarity over clever but dense code patterns

## Install into a project

Copy the agent file into your repository's `.github/agents/` folder and reload VS Code:

```powershell
New-Item -ItemType Directory -Force .github/agents | Out-Null
Copy-Item "C:\path\to\Github-Copilot-Plugins\plugins\code-simplifier\agents\code-simplifier.md" ".github\agents\code-simplifier.md"
```

Then open Copilot Chat and invoke the agent with the agent name `code-simplifier` or use it as a custom agent in supported workflows.

## Notes

This plugin mirrors the Anthropic official `code-simplifier` design, adapted for this Copilot plugin catalog.
