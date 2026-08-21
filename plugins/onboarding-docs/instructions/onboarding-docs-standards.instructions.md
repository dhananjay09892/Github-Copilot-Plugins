---
description: "Shared standards for onboarding-docs prompts. Defines accuracy discipline for repo-wide onboarding documentation."
applyTo: "**"
---

# Onboarding Docs Standards

Use this file as the single source of truth for all onboarding-docs prompts.

## Purpose

- Produce the documents a brand-new contributor needs on day one: how to contribute, how to set up
  a local dev environment, and a map of the codebase's structure.
- This is repository-wide onboarding documentation, distinct from feature/module-specific docs
  (that's the `documentation` prompt in the `dev-workflow` plugin).

## Scope boundary

- Do not duplicate `dev-workflow`'s `documentation` prompt. That prompt documents a specific
  feature/module; these prompts document the whole repository for a first-time contributor.
- If a `CONTRIBUTING.md`, dev-setup guide, or architecture diagram already exists, update it in
  place rather than creating a competing file.

## Accuracy discipline

- Every command in a generated setup guide must come from an actual file in the repo (e.g.
  `package.json` scripts, a `Makefile`, a `Dockerfile`, `pyproject.toml`, CI workflow files) — never
  invent a plausible-sounding command.
- Prefer read-only verification (reading manifest/script files, checking tool versions with
  `--version` flags) over running full install/build commands, unless the user explicitly asks to
  run them.
- If a command cannot be verified against the repo, mark it clearly as unverified rather than
  presenting it as confirmed to work.

## Architecture diagram discipline

- Base the Mermaid diagram on actual module/folder boundaries and real import relationships found in
  the code — do not guess a plausible-looking architecture.
- Keep the diagram at a level a new contributor can absorb in one read: top-level modules/services
  and their real dependencies, not every file.

## Quality bar

- Keep `CONTRIBUTING.md` and the dev-setup guide scannable: numbered steps, short sections, no prose
  walls.
- Call out anything a new contributor is likely to get stuck on (missing env vars, required local
  services, non-obvious build order) explicitly.

## Copilot Runtime Note

- These prompts primarily read and write Markdown/Mermaid files. Running verification commands is
  optional and should default to read-only checks unless the user opts into executing setup/build
  steps.
