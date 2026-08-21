# Copilot Agent Plugins Marketplace

A public collection of reusable **VS Code Copilot** customizations: prompts, instructions, and
agents. The plugins use VS Code's native customization primitives (`.prompt.md`,
`.instructions.md`, and `.agent.md`).

VS Code Copilot discovers these files from a repository's `.github/` folder. There is currently no
separate install command for this type of Copilot customization. This README shows how to install a
plugin from this public GitHub repository into any project.

## Why this structure

VS Code Copilot discovers customizations by **file location**:

- `.github/prompts/` contains reusable slash commands.
- `.github/instructions/` contains automatically applied project guidance.
- `.github/agents/` contains specialized custom agents.

The `marketplace.json` file is a catalog of the available bundles. It does not install files by
itself; installation means copying the selected bundle into the target repository.

## Structure

```
copilot-agent-plugins/
├── marketplace.json              # catalog of available plugins
├── plugins/
│   ├── ralph-loop/                # Iterative Ralph loop workflow bundle
│   ├── agent-browser/             # Citation-disciplined web/GitHub research prompts
│   ├── pr-issue-workflow/         # GitHub CLI-driven PR description, issue triage, review-to-task prompts
│   ├── copilot-customization-manager/ # Audit/create this repo's own prompts, instructions, agents
│   ├── onboarding-docs/           # CONTRIBUTING.md, dev-setup guide, and architecture diagram generation
│   ├── commit-workflow/           # Conventional commit messages and changelog entries from the staged diff
│   └── dev-workflow/               # one plugin = one themed bundle of prompts/instructions
│       ├── plugin.json           # plugin metadata
│       ├── README.md             # what it does, how to install/use
│       ├── prompts/              # *.prompt.md — one file per single-focused task
│       └── instructions/         # *.instructions.md — shared standards all prompts link to
└── README.md
```

## Available plugins

| Plugin | Description |
|--------|-------------|
| [`ralph-loop`](./plugins/ralph-loop) | Run iterative self-referential development loops with max-iteration and completion controls |
| [`dev-workflow`](./plugins/dev-workflow) | Analyze repo, plan feature, implement feature, debug issue, generate tests, review code, security audit, refactor, documentation |
| [`agent-browser`](./plugins/agent-browser) | Research questions and verify sources using VS Code Copilot's built-in fetch/githubRepo/search tools, with citation and prompt-injection discipline |
| [`pr-issue-workflow`](./plugins/pr-issue-workflow) | Draft PR descriptions, triage issues, and turn review comments into task checklists using the GitHub CLI |
| [`copilot-customization-manager`](./plugins/copilot-customization-manager) | Audit and create this repository's own .github/prompts, .github/instructions, and .github/agents files |
| [`onboarding-docs`](./plugins/onboarding-docs) | Generate CONTRIBUTING.md, a dev-setup guide, and a Mermaid architecture diagram for new contributors |
| [`commit-workflow`](./plugins/commit-workflow) | Generate Conventional Commits-style commit messages and Keep a Changelog-style changelog entries from the staged diff |

## Installing from GitHub

The commands below use this repository's public GitHub URL:
`https://github.com/dhananjay09892/Github-Copilot-Plugins`.

### 1. Clone the public repository

Run this outside the project you want to configure:

```powershell
git clone https://github.com/dhananjay09892/Github-Copilot-Plugins.git
```

The same command works in macOS and Linux terminals. Change into the cloned directory before
running the copy commands below.

### 2. Copy one plugin into your project

Set these paths to the cloned plugin repository and your target project:

```powershell
$PluginsRepo = "C:\path\to\Github-Copilot-Plugins"
$TargetRepo = "C:\path\to\your-project"
$PluginName = "dev-workflow"

New-Item -ItemType Directory -Force "$TargetRepo\.github\prompts"
New-Item -ItemType Directory -Force "$TargetRepo\.github\instructions"

Copy-Item "$PluginsRepo\plugins\$PluginName\prompts\*.prompt.md" `
   "$TargetRepo\.github\prompts\"
Copy-Item "$PluginsRepo\plugins\$PluginName\instructions\*.instructions.md" `
   "$TargetRepo\.github\instructions\"
```

For `ralph-loop`, copy its PowerShell scripts to the target repository's root `scripts` directory:

```powershell
New-Item -ItemType Directory -Force "$TargetRepo\scripts"
Copy-Item "$PluginsRepo\plugins\ralph-loop\scripts\*.ps1" `
   "$TargetRepo\scripts\"
```

The Ralph prompts expect these scripts at `./scripts/`.

### 3. Reload VS Code

Open the target project in VS Code and run `Developer: Reload Window` from the Command Palette.
Prompts appear as `/` commands in Copilot Chat, and instruction files load automatically according
to their `applyTo` pattern.

Each plugin README contains its available commands and plugin-specific setup:

- [`dev-workflow`](./plugins/dev-workflow/README.md)
- [`ralph-loop`](./plugins/ralph-loop/README.md)
- [`agent-browser`](./plugins/agent-browser/README.md)
- [`pr-issue-workflow`](./plugins/pr-issue-workflow/README.md)
- [`copilot-customization-manager`](./plugins/copilot-customization-manager/README.md)
- [`onboarding-docs`](./plugins/onboarding-docs/README.md)
- [`commit-workflow`](./plugins/commit-workflow/README.md)

## Before using a plugin

1. Make sure VS Code, GitHub Copilot, and Copilot Chat are available in the target project.
2. Review the plugin README and inspect any scripts before running them.
3. Check for existing files with the same names in `.github/prompts`, `.github/instructions`, or
    `.github/agents`; merge them instead of overwriting them blindly.
4. Commit or stash important work before using prompts that can edit files.
5. Start with `/analyze-repository` or another read-only request and review the result.
6. Run the target project's normal tests, type checks, and lint checks after generated changes.
7. Commit the copied `.github/` files if the whole team should use the same plugin version.

Do not copy API keys or other secrets into plugin files. Keep secrets in local environment files and
never commit them.

## Contributing a new plugin

1. Create `plugins/<plugin-name>/` with a `plugin.json`, `README.md`, and a `prompts/` folder
   (add `instructions/` and `agents/` if the plugin needs shared standards or custom agents).
2. Follow the [prompt-file conventions](https://code.visualstudio.com/docs/copilot/customization/prompt-files):
   one prompt = one focused task, meaningful `description`, link to shared instructions instead of
   duplicating rules.
3. Add an entry to [`marketplace.json`](./marketplace.json).
4. Keep architecture/requirements guidance in a single `*.instructions.md` per plugin so all prompts
   in that plugin stay consistent — don't restate standards inside every prompt.

## Consistency requirement

Every prompt in every plugin must link to that plugin's shared instructions file (its "approved
architecture and requirements" doc) rather than embedding its own copy of the rules. This keeps all
prompts consistent automatically when the standards change — update the instructions file once,
every prompt picks it up.
