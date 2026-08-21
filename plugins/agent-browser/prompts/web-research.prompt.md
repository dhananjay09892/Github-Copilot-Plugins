---
description: "Research a question using live web/GitHub tools, citing the exact source for every claim instead of answering from memory alone."
agent: agent
argument-hint: "QUESTION"
tools: [fetch, githubRepo, search]
---

# Web Research

Follow [agent-browser-standards](../instructions/agent-browser-standards.instructions.md).

Question: $ARGUMENTS

## Goal

Answer the question using live web/GitHub tools rather than only training knowledge, so the user
gets an up-to-date, verifiable answer with sources.

## Steps

1. Check whether `fetch`/`githubRepo`/`search` are actually available. If a required tool is
   disabled or a call fails, stop and report the blocker instead of answering from memory as if it
   were live research.
2. Form 2-4 targeted search queries; run them and prioritize authoritative sources (official docs,
   the primary repository, standards bodies) over blogs or aggregators.
3. Fetch the actual page for any source before citing it — never cite a title or URL that was not
   fetched in this session.
4. Cross-check any surprising or high-impact claim against a second independent source before
   including it.
5. Note publish/update dates when available so the user can judge freshness.

## Output

- A direct answer to the question.
- Each claim paired with the exact URL fetched to support it.
- Anything that could not be verified live, flagged explicitly rather than filled in from memory.

Do not fabricate URLs, titles, or search results. If the required tools are unavailable, say so
plainly and offer to answer from general knowledge instead, clearly labeled as such.
