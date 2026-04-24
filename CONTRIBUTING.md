# Contributing to sureops

Thanks for helping make sureops better. This guide explains how we triage issues, how to file good ones, and what you can expect from us.

## Where to file what

See the table in our [welcome thread](https://github.com/codehaus-ai/sureops-ai-public/discussions/categories/announcements). TL;DR:

- **Bug or feature request** → [open an issue](https://github.com/codehaus-ai/sureops-ai-public/issues/new/choose) using the right template.
- **How-to or open question** → [Discussions Q&A](https://github.com/codehaus-ai/sureops-ai-public/discussions/categories/q-a).
- **Security vulnerability** → email `security@sureops.ai`. Never file publicly.

## Filing a great issue

- **Search first.** Every Issue Form has a "search existing" callout at the top. Add a 👍 instead of duplicating.
- **Use the template.** Blank issues are disabled — pick a template that fits.
- **Be specific.** "It's broken" tells us nothing. "Clicking 'Take control' on incident X returns a 500 with `interrupt_requested already set`" tells us a lot.
- **One issue, one problem.** If you have three bugs, file three issues. They get tracked, prioritized, and closed independently.
- **Link, don't paste secrets.** Redact API keys, tokens, customer data. Our in-app feedback widget redacts automatically; for direct issues, you're on your honor.

## How we triage

1. **Daily triage** (every weekday morning): we filter `is:open label:triage` and process every new issue.
2. **Triage actions**: apply `cmp:*` (component), apply `priority:*` (P0/P1/P2/P3), remove `triage`, add `status:accepted`, add to the [project board](https://github.com/orgs/codehaus-ai/projects/1).
3. **Project board** (Backlog → Up Next → In Progress → Shipped) is public. You can see what's coming.
4. **Closing rules**:
   - Bug fixed → close with `status:shipped` + a link to the changelog entry.
   - Feature shipped → close with `status:shipped` + link to the release notes.
   - Won't fix → close with `won't-fix` + a brief explanation; we'll suggest a different angle if there's one we'd consider.
   - Duplicate → close with `duplicate` + link to the canonical issue.
   - Not reproducible → close with `not-reproducible` + a comment explaining what we tried.

## Saved triage searches (for maintainers)

| Filter | Link |
|---|---|
| 🆕 New (last 7 days) | [`is:open label:triage created:>7d`](https://github.com/codehaus-ai/sureops-ai-public/issues?q=is%3Aopen+label%3Atriage+created%3A%3E7d) |
| 🤖 Bot-flagged dupes | [`is:open commenter:sureops-bot label:triage`](https://github.com/codehaus-ai/sureops-ai-public/issues?q=is%3Aopen+commenter%3Asureops-bot+label%3Atriage) |
| 👀 Customer-reported | [`is:open label:customer-reported`](https://github.com/codehaus-ai/sureops-ai-public/issues?q=is%3Aopen+label%3Acustomer-reported) |
| 👍 Top-voted features | [`is:open label:type:feature sort:reactions-+1-desc`](https://github.com/codehaus-ai/sureops-ai-public/issues?q=is%3Aopen+label%3Atype%3Afeature+sort%3Areactions-%2B1-desc) |
| 🚨 P0/P1 untriaged | [`is:open label:triage label:priority:p0,priority:p1`](https://github.com/codehaus-ai/sureops-ai-public/issues?q=is%3Aopen+label%3Atriage+label%3Apriority%3Ap0%2Cpriority%3Ap1) |

## Internal SLA targets (private beta)

These are commitments we hold ourselves to internally. Not promised publicly until we've sustained them through 3 cohorts.

| Issue type | Target first response |
|---|---|
| `customer-reported` | **1 business day** |
| `priority:p0` (any source) | **4 hours, 24/7 best-effort** |
| `priority:p1` | **1 business day** |
| `priority:p2` | **1 week** |
| `priority:p3` | Best-effort, no firm target |
| Discussions Q&A | **1 business day** |

"First response" = a comment from a maintainer, not necessarily a fix. Often it's "we see this, we're investigating, will update by Friday."

## Contributing code

We accept PRs for:
- **Documentation** (`docs/**`) — typo fixes, clarifications, new how-tos.
- **Helm chart** (`charts/**`) — values surface improvements, template fixes.
- **Examples** (`examples/**`) — new vendor webhook samples.

We do **not** accept PRs for:
- Backend, frontend, or agent source — those live in a private repo. File a feature request instead.

## Code of Conduct

This project follows the [Contributor Covenant 2.1](./CODE_OF_CONDUCT.md). Be kind. Don't be a jerk. Email `conduct@sureops.ai` to report violations.

## License

By contributing, you agree your contributions are licensed under [MIT](./LICENSE).
