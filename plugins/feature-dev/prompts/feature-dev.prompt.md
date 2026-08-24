---
description: Guided seven-phase feature development workflow with codebase exploration, architecture design, implementation approval, and quality review
argument-hint: Optional feature description
tools: [read, search, edit, execute, agent, todo]
---

# Feature Development

Follow [feature-development-standards](../instructions/feature-development-standards.instructions.md) throughout this workflow.

Feature request: $ARGUMENTS

Use the following seven phases. Keep a concise decision record and task checklist as you work.

## Working record

Start with this checklist and show its updated state at each phase transition:

```text
- [ ] Discovery and success criteria confirmed
- [ ] Codebase exploration consolidated
- [ ] Clarifying questions resolved
- [ ] Architecture approved
- [ ] Implementation and tests complete
- [ ] Quality review disposition decided
- [ ] Summary and validation recorded
```

Record key decisions, user approvals, validation commands, and unresolved risks alongside the checklist. Do not mark a phase complete until its output is available.

## Phase 1: Discovery

Clarify the problem, desired behavior, constraints, scope, and success criteria. Summarize your understanding and ask focused questions for anything ambiguous. Do not design or implement until the requirements are clear.

## Phase 2: Codebase Exploration

Use the `code-explorer` agent for three distinct perspectives: (1) similar features and end-to-end execution flow, (2) architecture, dependencies, and integration boundaries, and (3) UI, tests, configuration, and operational constraints. Run these passes in parallel when the runtime supports it; otherwise run them sequentially and preserve the same three perspectives. Consolidate the results, remove contradictions, then inspect the essential files they identify. Present the relevant entry points, flow, conventions, and risks.

## Phase 3: Clarifying Questions

Using the request and exploration findings, ask about unresolved edge cases, error handling, integration points, backward compatibility, performance, security, and user experience. Wait for answers before architecture design. If the user delegates a decision, make and record a recommendation.

## Phase 4: Architecture Design

Use the `code-architect` agent for an implementation-ready blueprint. When meaningful trade-offs exist, require three approaches: minimal changes, clean architecture, and pragmatic balance. Compare their risks and benefits, recommend one grounded in existing patterns, and present the file-by-file plan, data flow, and test plan. Ask the user to select or confirm an approach before implementation.

## Phase 5: Implementation

After explicit approval, implement the confirmed plan. Read relevant files, preserve local conventions, update the task checklist, and add or update tests for behavior changes. Run focused validation after each meaningful slice and report blockers instead of guessing.

## Phase 6: Quality Review

Use the `code-reviewer` agent for three distinct passes: correctness/security, simplicity/maintainability, and conventions/tests. Run these passes in parallel when supported; otherwise run them sequentially. Consolidate only high-confidence findings, remove duplicates, then ask whether to fix them now, defer them, or proceed. Apply requested fixes and rerun focused validation.

## Phase 7: Summary

Confirm the checklist is complete. Summarize what changed, important decisions, files modified, tests and validation run, known gaps, and suggested next steps. Do not claim completion when validation is unavailable or a blocker remains.

## Handoff rules

- Do not skip discovery or clarification for a complex or ambiguous feature.
- Do not start implementation before plan approval.
- Keep exploration, design, implementation, and review outputs separate.
- Use repository evidence and exact paths rather than assumptions.
