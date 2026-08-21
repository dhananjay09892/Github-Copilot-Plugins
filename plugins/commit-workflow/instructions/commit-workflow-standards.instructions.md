---
description: "Shared standards for commit-workflow prompts. Defines grounding and scope rules for commit messages and changelog entries."
applyTo: "**"
---

# Commit Workflow Standards

Use this file as the single source of truth for all commit-workflow prompts.

## Purpose

- Generate an accurate commit message or changelog entry from the actual staged diff, rather than
  from a guess of what changed.

## Scope boundary

- This plugin covers commit messages and changelog entries only. PR titles/descriptions are covered
  by `draft-pr-description` in the `pr-issue-workflow` plugin — do not duplicate that here.

## Grounding discipline

- Read the actual staged diff (`git diff --staged`) before drafting anything. If nothing is staged,
  say so and offer to look at unstaged changes instead of guessing.
- Never invent a change that isn't in the diff, and never omit a change that is in it.
- If the diff mixes unrelated changes, say so and suggest splitting into separate commits rather
  than writing one commit message that glosses over an unrelated change.

## Commit message format

- Follow [Conventional Commits](https://www.conventionalcommits.org/): `type(scope): summary`, with
  `type` one of `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `perf`, `build`, `ci`.
- Keep the summary line under ~72 characters; put details in the body if needed.
- Mark a breaking change with `!` after the type/scope and a `BREAKING CHANGE:` footer, only when
  the diff actually contains one.

## Changelog format

- Follow [Keep a Changelog](https://keepachangelog.com/) categories: Added, Changed, Deprecated,
  Removed, Fixed, Security.
- Write from the user's perspective (what changed for them), not an internal implementation note.

## Safety

- Never run `git commit`, `git push`, or modify `CHANGELOG.md` without showing the exact
  message/entry first and getting explicit confirmation.

## Copilot Runtime Note

- These prompts read `git diff` output and write to the commit message or `CHANGELOG.md`. They do
  not require network access or GitHub API tools.
