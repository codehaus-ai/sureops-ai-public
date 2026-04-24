# Security Policy

## Reporting a Vulnerability

**Do not file security issues as public GitHub Issues.**

Email **security@sureops.ai** with:

- A description of the issue and the impact you observed.
- Steps to reproduce, or a proof-of-concept if you have one.
- The sureops version and deployment shape (SaaS vs self-hosted Helm).
- Your name / handle for credit (optional — anonymous reports are accepted).

We acknowledge receipt within **2 business days** and aim to provide an initial assessment within **5 business days**. For confirmed vulnerabilities we coordinate disclosure with you before any public advisory.

## Disclosure

We do not maintain a public CVE log yet. Confirmed vulnerabilities and their fixes are published as advisories at:

<https://github.com/codehaus-ai/sureops-ai-public/security/advisories>

Subscribe to the repository's "Security advisories" notifications to receive these.

## Supported Versions

sureops is in private beta. Only the latest minor release is supported with security fixes.

| Version | Supported |
|---|---|
| `0.x.x` (current beta) | Yes — latest minor only |
| `< 0.1.0` | No |

The version range will be revised after the v1.0 GA release.

## Scope

In scope:

- The sureops Helm chart and its templates ([`charts/sureops/`](./charts/sureops)).
- The hosted SaaS at `*.sureops.ai`.
- The example webhook handlers in [`examples/`](./examples) — vulnerabilities in *our* sample code, not in upstream vendor APIs.

Out of scope:

- Third-party services we integrate with (Datadog, PagerDuty, Slack, GitHub, etc.) — report those to the vendor directly.
- Self-hosted deployments running modified forks.
- Social engineering, physical access, or rate-limiting issues without a working PoC.

## Safe Harbor

We will not pursue legal action against good-faith security research that:

- Avoids privacy violations, data destruction, and service degradation.
- Stops at the minimum testing necessary to demonstrate the issue.
- Does not access, modify, or exfiltrate customer data beyond your own test tenant.
- Gives us a reasonable disclosure window before going public.

If in doubt, ask first — we'd rather hear from you than read about it on Twitter.
