---
description: "Shared architecture and quality standards referenced by all dev-workflow prompts. Ensures every prompt (analyze, plan, implement, debug, test, review, audit, refactor, document) operates against the same approved requirements."
applyTo: "**"
---

# Architecture & Requirements Standards

This file is the single source of truth that every prompt in the `dev-workflow` plugin must follow.
Update it when architecture decisions change — all prompts link back here instead of duplicating rules.

## Approved Architecture Baseline

- Confirm and record the current architecture (layers, modules, data flow, key dependencies) before
  proposing changes. If no architecture doc exists in the repo, derive one from `analyze-repository`
  output and treat it as the working baseline until the user corrects it.
- New code must fit existing module boundaries and naming conventions. Do not introduce a new
  pattern (state management, folder layout, framework) when an established one already solves the
  problem, unless the user explicitly approves the change.
- Cross-cutting concerns (auth, logging, error handling, config) must go through existing shared
  utilities rather than being reimplemented locally.

## Requirements Discipline

- Do not implement beyond what was requested. Flag scope gaps as questions rather than assumptions.
- Any ambiguity in requirements must be surfaced explicitly and confirmed before implementation
  begins (see `plan-feature`).
- Non-functional requirements (performance, security, accessibility, backward compatibility) are
  first-class — call them out even if the user didn't mention them.

## Quality Bar (applies to every prompt in this plugin)

- Follow the OWASP Top 10 for anything touching input handling, auth, data storage, or external
  calls. Never introduce a known-vulnerable pattern to save time.
- Match existing code style, linting rules, and test conventions found in the repo.
- Prefer editing existing files/abstractions over creating new ones "just in case".
- Every change that alters behavior needs a corresponding test or an explicit note on why one
  isn't feasible.
- Keep comments minimal — only where code cannot explain itself.

## Consistency Contract

Every prompt below must:
1. Link to this file for architecture/requirements context.
2. State clearly which phase of the workflow it covers (no overlapping responsibilities).
3. Hand off cleanly to the next prompt in the sequence (e.g. `plan-feature` → `implement-feature` → `review-code`).

## Suggested Workflow Order

`analyze-repository` → `plan-feature` → `implement-feature` → `generate-tests` → `review-code` →
`security-audit` → `refactor` (as needed) → `documentation`. `debug-issue` can be entered at any
point when something is broken.
