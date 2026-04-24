# sureops Helm Chart

Self-hosted Kubernetes deployment for sureops.

## Install

```bash
helm repo add sureops https://codehaus-ai.github.io/sureops-ai-public
helm repo update
helm install sureops sureops/sureops \
  --namespace sureops --create-namespace \
  --set ingress.hosts[0].host=sureops.example.com \
  --set api.env.SUPABASE_URL=https://your-project.supabase.co \
  --set-string api.env.AUTH_MODE=oidc
```

## Configuration

Common values you'll want to override (see [`values.yaml`](./values.yaml) for the full list):

| Key | Default | Description |
|---|---|---|
| `api.replicaCount` | `2` | API pod replicas |
| `agentWorker.replicaCount` | `2` | Agent worker pod replicas |
| `postgresql.enabled` | `false` | Set true to deploy in-cluster Postgres (dev only) |
| `postgresql.external.host` | `postgres.example.com` | External Postgres host |
| `ingress.enabled` | `true` | Create an ingress resource |
| `ingress.className` | `nginx` | Ingress class |
| `ingress.hosts[0].host` | `sureops.example.com` | Hostname |

## Secrets

By default the chart creates a `sureops-secret` Secret with the keys it expects.
For production, set `secrets.externalManaged: true` and provision the Secret
out-of-band via External Secrets, Sealed Secrets, or `kubectl create secret`.

Required keys: `db-password`, `jwt-secret`, `supabase-secret-key`,
`anthropic-api-key`, `openai-api-key`, `encryption-key` (32-byte AES).

## Upgrading

```bash
helm repo update
helm upgrade sureops sureops/sureops -f my-values.yaml
```

Migrations run automatically on pod start (Alembic). To disable, set
`api.env.MIGRATIONS_ON_STARTUP=false` and run them out-of-band.

## Uninstall

```bash
helm uninstall sureops --namespace sureops
```

In-cluster Postgres PVCs are not deleted automatically — remove with
`kubectl delete pvc -l app.kubernetes.io/name=sureops -n sureops`.
