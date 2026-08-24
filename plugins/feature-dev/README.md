# Feature Development (Copilot Plugin)

A structured feature-development workflow adapted for VS Code Copilot. It turns the official feature-dev process into a reusable slash command plus three focused custom agents for exploration, architecture, and review.

## Included assets

- Workflow prompt: [`feature-dev`](./prompts/feature-dev.prompt.md)
- Exploration agent: [`code-explorer`](./agents/code-explorer.md)
- Architecture agent: [`code-architect`](./agents/code-architect.md)
- Review agent: [`code-reviewer`](./agents/code-reviewer.md)
- Shared standards: [`feature-development-standards.instructions.md`](./instructions/feature-development-standards.instructions.md)

## Seven phases

1. **Discovery**: Clarify the problem, scope, constraints, and success criteria.
2. **Codebase exploration**: Trace related features, architecture, dependencies, UI, and tests.
3. **Clarifying questions**: Resolve behavior, edge cases, compatibility, and non-functional requirements.
4. **Architecture design**: Produce a recommended file-by-file implementation blueprint.
5. **Implementation**: Build only after explicit plan approval, with focused validation and tests.
6. **Quality review**: Review correctness, security, maintainability, conventions, and test coverage.
7. **Summary**: Record decisions, changes, validation, gaps, and next steps.

The workflow pauses for user input before architecture decisions and implementation. Specialist agents provide focused analysis; the main prompt remains responsible for coordinating the phases and carrying decisions forward. The prompt maintains a visible seven-phase checklist and decision record, and asks for three exploration and review perspectives. Copilot runtimes may execute those perspectives sequentially rather than in parallel.

## Example

```text
/feature-dev Add audit logging for administrative actions
```

The workflow first maps related logging and authorization code, asks about retention and privacy requirements, compares implementation approaches, waits for approval, then implements and reviews the change.

## Direct agent usage

Use the specialist agents independently when a full workflow is unnecessary:

```text
Use code-explorer to trace the existing notification delivery flow.
Use code-architect to compare approaches for adding retry support to that flow.
Use code-reviewer to review my current diff for correctness and missing tests.
```

## Install into a project

**Quick install from PowerShell:**

Run this command from the root of the target repository. It downloads the plugin directly from
GitHub and creates the required VS Code folders:

```powershell
$base = "https://raw.githubusercontent.com/dhananjay09892/Github-Copilot-Plugins/main/plugins/feature-dev"; New-Item -ItemType Directory -Force .github/prompts, .github/instructions, .github/agents | Out-Null; Invoke-WebRequest "$base/prompts/feature-dev.prompt.md" -OutFile ".github/prompts/feature-dev.prompt.md"; Invoke-WebRequest "$base/instructions/feature-development-standards.instructions.md" -OutFile ".github/instructions/feature-development-standards.instructions.md"; @("code-architect", "code-explorer", "code-reviewer") | ForEach-Object { Invoke-WebRequest "$base/agents/$_.md" -OutFile ".github/agents/$_.md" }
```

After the command completes, reload VS Code and use `/feature-dev` in Copilot Chat.

**Copy from a local checkout:**

Copy the prompt and instruction files into `.github/prompts/` and `.github/instructions/`, and the agent files into `.github/agents/`, then reload VS Code:

```powershell
$source = "C:\path\to\Github-Copilot-Plugins\plugins\feature-dev"
New-Item -ItemType Directory -Force .github/prompts, .github/instructions, .github/agents | Out-Null
Copy-Item "$source\prompts\feature-dev.prompt.md" .github/prompts/
Copy-Item "$source\instructions\feature-development-standards.instructions.md" .github/instructions/
Copy-Item "$source\agents\*.md" .github/agents/
```

Use `/feature-dev` in Copilot Chat with an optional feature description. The specialist agents can also be selected directly when you need only exploration, architecture, or review.

## When to use it

Use this workflow for features spanning multiple files, architectural decisions, or unclear requirements. For small, well-defined changes, a direct implementation or the `dev-workflow` prompts may be faster.

## Copilot runtime notes

This translation uses Copilot-native prompts and custom agents. Claude-specific `model`, `color`, `TodoWrite` behavior, and guaranteed parallel agent orchestration have no repository-independent Copilot equivalent, so the workflow expresses those expectations as explicit instructions and a visible checklist. The agents restrict themselves to supported `read` and `search` tools; the main workflow uses editing, execution, delegation, and task-list tools when available in the active Copilot session.
