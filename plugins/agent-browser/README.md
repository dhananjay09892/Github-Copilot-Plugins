# Agent Browser (Copilot Plugin)

Citation-disciplined, prompt-injection-aware research prompts built on top of VS Code Copilot Chat's
built-in web/GitHub tools (`fetch`, `githubRepo`, `search`).

## Included assets

- Prompts:
  - [`web-research`](./prompts/web-research.prompt.md)
  - [`verify-source`](./prompts/verify-source.prompt.md)
- Shared standards:
  - [`agent-browser-standards.instructions.md`](./instructions/agent-browser-standards.instructions.md)

## What this plugin does

- `/web-research` answers a question using live web/GitHub tools instead of only training knowledge,
  citing the exact URL fetched for each claim.
- `/verify-source` fact-checks one specific claim or URL before you rely on it (e.g. before citing it
  in a report or a commit message).
- Both prompts stop and report a blocker instead of fabricating results if a required tool is
  disabled or a call fails.

## Important limitation

VS Code Copilot's `fetch`, `githubRepo`, and search tools are enabled or disabled **per session** by
the user in the chat tool picker. This plugin cannot force those tools on — it only gives the model a
stable, safety-checked prompt to use them correctly when they are available. If a tool is disabled,
the prompts will say so instead of quietly answering from memory.

## Install into a project

**Quick install from PowerShell:**

Run this command from the root of the target repository. It downloads the plugin directly from
GitHub and creates the required VS Code folders:

```powershell
$base = "https://raw.githubusercontent.com/dhananjay09892/Github-Copilot-Plugins/main/plugins/agent-browser"; New-Item -ItemType Directory -Force .github/prompts, .github/instructions | Out-Null; @("web-research", "verify-source") | ForEach-Object { Invoke-WebRequest "$base/prompts/$_.prompt.md" -OutFile ".github/prompts/$_.prompt.md" }; Invoke-WebRequest "$base/instructions/agent-browser-standards.instructions.md" -OutFile ".github/instructions/agent-browser-standards.instructions.md"
```

After the command completes, reload VS Code, enable `fetch`/`githubRepo` in the Copilot Chat tool
picker if they aren't already on, and run `/web-research` or `/verify-source`.

Review existing files with the same names before running this command because the downloads replace
those files.

**Manual copy:**

- `prompts/*.prompt.md` -> `.github/prompts/`
- `instructions/*.instructions.md` -> `.github/instructions/`

Reload VS Code afterward. Prompts appear as `/` slash commands in chat.

## Usage examples

- `/web-research What's the latest stable version of the Claude Agent SDK for TypeScript?`
- `/verify-source https://example.com/some-blog-post-claiming-a-cve`

## References

- https://code.visualstudio.com/docs/copilot/customization/prompt-files
