# sureops

> AI-powered incident management. Triage, diagnose, and resolve production
> incidents with autonomous agents that ask for approval before they act.

[sureops.ai](https://sureops.ai) · [Docs](https://sureops.ai/docs) · [Changelog](https://sureops.ai/changelog) · [Discussions](https://github.com/sureops/sureops-public/discussions)

---

## What's in this repo

This is the **public** repo for sureops. Source code for the backend, frontend,
and agents lives in a private repo — what's here is everything customer-facing
that benefits from being open:

| Path | What it is |
|---|---|
| [`docs/`](./docs) | Public documentation (rendered at [sureops.ai/docs](https://sureops.ai/docs)) |
| [`charts/sureops/`](./charts/sureops) | Helm chart for self-hosted Kubernetes deployment |
| [`examples/`](./examples) | Example webhook payloads, MCP tool manifests |
| [`CHANGELOG.md`](./CHANGELOG.md) | Auto-generated from [GitHub Releases](https://github.com/sureops/sureops-public/releases) |

## Install the Helm chart

```bash
helm repo add sureops https://sureops.github.io/sureops-public
helm repo update
helm install sureops sureops/sureops --namespace sureops --create-namespace
```

See [`charts/sureops/README.md`](./charts/sureops/README.md) for configuration.

## Contributing & feedback

- 🐛 **Bug** → [File a bug](https://github.com/sureops/sureops-public/issues/new?template=bug-report.yml)
- 💡 **Feature request** → [File a request](https://github.com/sureops/sureops-public/issues/new?template=feature-request.yml)
- 🔌 **Integration request** → [File a request](https://github.com/sureops/sureops-public/issues/new?template=integration-request.yml)
- 📝 **Docs issue** → [File a docs issue](https://github.com/sureops/sureops-public/issues/new?template=docs-issue.yml)
- 💬 **Question or discussion** → [Discussions](https://github.com/sureops/sureops-public/discussions)
- 🛡️ **Security vulnerability** → email [security@sureops.ai](mailto:security@sureops.ai) — never file as a public issue.

See [`CONTRIBUTING.md`](./CONTRIBUTING.md) for our triage workflow and SLA targets.

## License

[MIT](./LICENSE)
