---
description: "Audit code for OWASP Top 10 and other security vulnerabilities, reporting findings before making any fixes."
agent: agent
argument-hint: "Files, module, or feature to audit"
tools: [search, usages, problems]
---

# Security Audit

Follow [architecture-standards](../instructions/architecture-standards.instructions.md) for baseline expectations.

Scope: $ARGUMENTS (if empty, audit recently changed files first, then expand as needed)

## Steps

1. Check for OWASP Top 10 classes relevant to the scope: injection (SQL/NoSQL/command/template),
   broken auth/session handling, sensitive data exposure, XXE, broken access control, security
   misconfiguration, XSS, insecure deserialization, vulnerable dependencies, insufficient logging.
2. Trace user-controlled input from entry point to sink (DB call, shell exec, file path, HTML render,
   external request) to confirm whether it's properly validated/escaped/parameterized.
3. Check secrets handling: no hardcoded credentials/keys, no secrets in logs or error messages.
4. Check dependency manifests for known-vulnerable or unpinned versions if tooling is available.
5. Do not attempt exploitation, do not write proof-of-concept exploit code, and do not scan systems
   the user doesn't own.

## Output

- Findings grouped by severity (critical/high/medium/low), each with the vulnerable file/line,
  the exploit scenario, and a concrete remediation.
- Explicitly flag anything that needs the user's decision (e.g. accepting risk vs. fixing now).
- Do not apply fixes automatically — wait for the user to confirm which findings to address, then
  use `refactor` or direct edits for the approved fixes.
