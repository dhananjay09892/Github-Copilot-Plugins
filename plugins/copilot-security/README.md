# Copilot Security (Copilot Plugin)

A security-focused Copilot plugin that helps review code for vulnerabilities, map the attack surface, and validate findings before reporting them. It is structured as a staged workflow: inventory the repository, research likely issues, verify the risk, and only then recommend remediation.

## Included assets

- Orchestrator agent: [`copilot-security`](./agents/copilot-security.md)
- Inventory agent: [`security-scan-inventory`](./agents/security-scan-inventory.md)
- Research agent: [`security-scan-researcher`](./agents/security-scan-researcher.md)
- Verification agent: [`security-scan-verifier`](./agents/security-scan-verifier.md)
- Patch generator: [`security-patch-generator`](./agents/security-patch-generator.md)
- Patch verifier: [`security-patch-verifier`](./agents/security-patch-verifier.md)
- Shared workflow standards: [`security-workflow.instructions.md`](./instructions/security-workflow.instructions.md)
- Report template: [`security-report-template.md`](./reports/security-report-template.md)

## What it does

- Maps the repository and identifies the likely attack surface
- Searches for real vulnerability patterns instead of noise-heavy guesses
- Verifies whether a candidate issue is genuinely exploitable
- Recommends a minimal remediation path for confirmed or high-confidence findings
- Keeps output conservative and evidence-driven

## Prerequisites

- Run this against a checked-out repository with file access so the inventory and verification agents can inspect the real code and config.
- This workflow is for reviewing local source code and security-relevant config, not for staging or publishing a release.
- Use it on a repo or branch you are comfortable reviewing; the plugin is designed to be conservative and evidence-based rather than broad or noisy.

## Recommended workflow

1. Run the orchestrator agent: `copilot-security`
2. Let it scope the repo and identify likely high-risk areas
3. Use the inventory/research/verification sub-agents to narrow the findings
4. Use the patch generator for confirmed issues
5. Run the patch verifier before treating the remediation as accepted
6. Record the result in the report template under `reports/`

## Report and patch contract

This plugin follows a verification-first contract:

- Findings are grouped as confirmed, likely, or rejected
- Each issue should describe the location, impact, conditions, and evidence
- A patch is only generated for confirmed or high-confidence issues
- A patch must be reviewed by `security-patch-verifier` before it is treated as accepted
- Results should be captured in a report using the included template

## Install into a project

Copy the agent files into your repository's `.github/agents/` folder and reload VS Code:

```powershell
New-Item -ItemType Directory -Force .github/agents | Out-Null
Copy-Item "C:\path\to\Github-Copilot-Plugins\plugins\copilot-security\agents\*.md" ".github\agents\"
```

Then open Copilot Chat and use the custom agent named `copilot-security`.

## Notes

This Copilot version is intentionally a pragmatic, reduced-scope security review workflow rather than a literal one-to-one clone of the Anthropic plugin. It follows the same principles—inventory, research, verification, and remediation—but adapts them to the agent model available in GitHub Copilot.
