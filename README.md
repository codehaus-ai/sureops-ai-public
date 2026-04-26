# sureops

> AI-powered incident management. Triage, diagnose, and resolve production
> incidents with autonomous agents that ask for approval before they act.

[sureops.ai](https://sureops.ai) · [Docs](https://sureops.ai/docs) · [Changelog](https://sureops.ai/changelog) · [Discussions](https://github.com/codehaus-ai/sureops-ai-public/discussions)

---

## What's in this repo

This is the **public** repo for sureops. Source code for the backend, frontend,
and agents lives in a private repo — what's here is everything customer-facing
that benefits from being open:

| Path | What it is |
|---|---|
| [`docs/`](./docs) | Public documentation (rendered at [sureops.ai/docs](https://sureops.ai/docs)) |
| [`examples/`](./examples) | Example webhook payloads, MCP tool manifests |
| [`CHANGELOG.md`](./CHANGELOG.md) | Auto-generated from [GitHub Releases](https://github.com/codehaus-ai/sureops-ai-public/releases) |

## Hosted vs self-hosted

The hosted **sureops SaaS** at sureops.ai is currently in private beta. [Request access](https://sureops.ai) to join.

A **self-hosted Helm chart** is in development and not yet released for general use. We'll publish install instructions and a chart repo on this README when v1 ships — until then, please don't depend on the artifacts in `charts/`.

## Contributing & feedback

- 🐛 **Bug** → [File a bug](https://github.com/codehaus-ai/sureops-ai-public/issues/new?template=bug-report.yml)
- 💡 **Feature request** → [File a request](https://github.com/codehaus-ai/sureops-ai-public/issues/new?template=feature-request.yml)
- 🔌 **Integration request** → [File a request](https://github.com/codehaus-ai/sureops-ai-public/issues/new?template=integration-request.yml)
- 📝 **Docs issue** → [File a docs issue](https://github.com/codehaus-ai/sureops-ai-public/issues/new?template=docs-issue.yml)
- 💬 **Question or discussion** → [Discussions](https://github.com/codehaus-ai/sureops-ai-public/discussions)
- 🛡️ **Security vulnerability** → email [security@sureops.ai](mailto:security@sureops.ai) — never file as a public issue.

See [`CONTRIBUTING.md`](./CONTRIBUTING.md) for our triage workflow and SLA targets.

## License

[MIT](./LICENSE)
