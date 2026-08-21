---
description: "Verify a specific claim, citation, or URL by fetching it directly before it gets reused elsewhere."
agent: agent
argument-hint: "CLAIM or URL to verify"
tools: [fetch, search]
---

# Verify Source

Follow [agent-browser-standards](../instructions/agent-browser-standards.instructions.md).

Claim or URL: $ARGUMENTS

## Goal

Confirm whether a specific claim, citation, or URL is accurate before it is used elsewhere (a report,
a doc, a commit message), rather than trusting a remembered summary of it.

## Steps

1. If given a URL, fetch it directly — do not rely on a remembered summary of what that page
   probably contains.
2. If given a claim without a URL, search for the most authoritative source, fetch it, and confirm
   the claim's wording matches the source's actual content.
3. Note any mismatch precisely: what the claim says versus what the source actually says.
4. If the source cannot be found or fetched, report that clearly — do not report the claim as
   verified.

## Output

- Verdict: Verified / Not verified / Could not check, with the reason.
- The exact URL(s) checked.
- Any correction needed if the original claim was inaccurate or overstated.

Never mark something as verified without having actually fetched the source in this session.
