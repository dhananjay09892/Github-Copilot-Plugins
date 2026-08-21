# Dev Workflow (Copilot Plugin)

Reusable [VS Code Copilot prompt files](https://code.visualstudio.com/docs/copilot/customization/prompt-files)
covering the full development lifecycle, all grounded in a single shared
[architecture-standards](./instructions/architecture-standards.instructions.md) instructions file so
every step of the workflow stays consistent with the same approved architecture and requirements.

## Prompts

| Prompt | Phase | Use it to... |
|--------|-------|---------------|
| [`analyze-repository`](./prompts/analyze-repository.prompt.md) | Discovery | Map architecture, conventions, and key files before doing anything else |
| [`plan-feature`](./prompts/plan-feature.prompt.md) | Planning | Turn a feature request into an approved, concrete plan (no code yet) |
| [`implement-feature`](./prompts/implement-feature.prompt.md) | Implementation | Build a feature from an approved plan, following conventions |
| [`debug-issue`](./prompts/debug-issue.prompt.md) | Debugging | Root-cause a bug/failure before fixing it |
| [`generate-tests`](./prompts/generate-tests.prompt.md) | Testing | Add tests matching existing conventions |
| [`review-code`](./prompts/review-code.prompt.md) | Review | Get a severity-ranked review of a diff/PR |
| [`security-audit`](./prompts/security-audit.prompt.md) | Security | Check for OWASP Top 10 issues before merging |
| [`refactor`](./prompts/refactor.prompt.md) | Refactoring | Improve structure without changing behavior |
| [`documentation`](./prompts/documentation.prompt.md) | Docs | Keep README/API docs/comments accurate and consistent |

Suggested order: `analyze-repository` → `plan-feature` → `implement-feature` → `generate-tests` →
`review-code` → `security-audit` → `refactor` (as needed) → `documentation`. `debug-issue` can be
run any time something is broken.

## Install

**Quick install from PowerShell:**

Run this command from the root of the target repository. It downloads the plugin directly from
GitHub and creates the required VS Code folders:

```powershell
$base = "https://raw.githubusercontent.com/dhananjay09892/Github-Copilot-Plugins/main/plugins/dev-workflow"; New-Item -ItemType Directory -Force .github/prompts, .github/instructions | Out-Null; @("analyze-repository", "debug-issue", "documentation", "generate-tests", "implement-feature", "plan-feature", "refactor", "review-code", "security-audit") | ForEach-Object { Invoke-WebRequest "$base/prompts/$_.prompt.md" -OutFile ".github/prompts/$_.prompt.md" }; Invoke-WebRequest "$base/instructions/architecture-standards.instructions.md" -OutFile ".github/instructions/architecture-standards.instructions.md"
```

After the command completes, reload VS Code and use the prompts as `/` commands in Copilot Chat.
Review existing files with the same names before running this command because the downloads replace
those files.

**Option A — copy into a consumer repo (recommended):**

Copy `prompts/*.prompt.md` into that repo's `.github/prompts/` and `instructions/*.instructions.md`
into `.github/instructions/`, then reload the window. They'll show up as `/` slash commands in chat.

**Option B — point VS Code at this folder directly:**

Add to the consumer repo's `.vscode/settings.json`:

```json
{
  "chat.promptFilesLocations": {
    "<path-to-this-repo>/plugins/dev-workflow/prompts": true
  },
  "chat.instructionsFilesLocations": {
    "<path-to-this-repo>/plugins/dev-workflow/instructions": true
  }
}
```

**Option C — user profile (personal, all workspaces):**

Copy the same files into `<profile>/prompts/` (no `instructions` subfolder needed there — instruction
files at user scope go alongside prompts and are still picked up by relative links).

## Customizing

Edit [`architecture-standards.instructions.md`](./instructions/architecture-standards.instructions.md)
whenever the project's approved architecture or requirements change — every prompt links back to it,
so there's one place to update instead of nine.
