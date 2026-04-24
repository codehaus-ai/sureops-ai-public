---
title: Quickstart
description: Get sureops running in 10 minutes.
category: getting-started
order: 1
---

> Docs content forthcoming. The shape of this directory — frontmatter contract, sidebar manifest, "Edit on GitHub" deep-link — is owned by [spec #19](https://github.com/sureops/sureops-public/issues). Track that issue for the rollout.

## Install the Helm chart

```bash
helm repo add sureops https://sureops.github.io/sureops-public
helm repo update
helm install sureops sureops/sureops --namespace sureops --create-namespace
```

See [`charts/sureops/README.md`](https://github.com/sureops/sureops-public/tree/main/charts/sureops) for full configuration.

## Next steps

- Read the [Helm chart README](https://github.com/sureops/sureops-public/tree/main/charts/sureops) for self-hosted configuration.
- Browse [example webhook payloads](https://github.com/sureops/sureops-public/tree/main/examples) to see what sureops ingests.
- File a [bug report](https://github.com/sureops/sureops-public/issues/new?template=bug-report.yml), [feature request](https://github.com/sureops/sureops-public/issues/new?template=feature-request.yml), or [beta feedback](https://github.com/sureops/sureops-public/issues/new?template=beta-feedback.yml).
