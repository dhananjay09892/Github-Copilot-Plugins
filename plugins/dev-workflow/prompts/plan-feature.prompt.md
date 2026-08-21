---
description: "Turn a feature request into a concrete, reviewable implementation plan grounded in the codebase, without writing code yet."
agent: plan
argument-hint: "Feature description"
tools: [search, usages]
---

# Plan Feature

Follow [architecture-standards](../instructions/architecture-standards.instructions.md) for baseline expectations.

Feature request: $ARGUMENTS

## Goal

Produce an approved plan before any implementation happens. Do not write or edit code in this prompt.

## Steps

1. If context on the relevant area is missing, run `analyze-repository` first (or inline-equivalent
   exploration) to ground the plan in real code, not assumptions.
2. Identify every ambiguity, edge case, and underspecified requirement. Ask the user directly —
   do not guess silently. If the user says "whatever you think is best," give a recommendation and
   get explicit confirmation.
3. Propose 1-3 implementation approaches when there's a meaningful trade-off (e.g. minimal change vs.
   cleaner abstraction), with your recommendation and reasoning.
4. Break the chosen approach into ordered, concrete steps: files to touch, new abstractions (if any),
   data/API changes, and test coverage needed.
5. Call out non-functional requirements (security, performance, backward compatibility) relevant to
   this feature.

## Output

- Restated requirements (including answers to clarifying questions).
- Chosen approach with rationale.
- Ordered step-by-step plan, file-by-file where possible.
- Test plan (what `generate-tests` should cover).
- Explicit ask: "Confirm this plan before I start `implement-feature`."

Stop and wait for user approval — do not proceed to implementation from this prompt.
