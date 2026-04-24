# Datadog Webhook Example

This directory shows what a Datadog alert looks like when it arrives at the
sureops webhook endpoint, and how to verify its signature.

## Files

| File | Purpose |
|---|---|
| `sample-alert.json` | A representative Datadog `query_alert_monitor` event payload. Use this as a fixture in tests or local replay tools. |
| `verify-signature.js` | Node.js snippet that verifies the `X-Sureops-Signature` HMAC-SHA256 header against your webhook secret. |

## Wiring up the webhook in Datadog

1. In sureops: **Settings → Integrations → Datadog → Generate webhook URL**.
   Copy the URL and the secret.
2. In Datadog: **Integrations → Webhooks → New** and paste the URL.
   Set `Custom Headers` to forward `X-Sureops-Signature` (sureops signs the
   outbound payload itself; if you re-sign in Datadog, use the secret from step 1).
3. Add `@webhook-sureops` to the relevant monitor message body so the alert
   actually fires the webhook.

## Verifying the signature

Every webhook from sureops carries an `X-Sureops-Signature` header containing
the hex-encoded HMAC-SHA256 of the raw body using your integration secret.
Always verify before acting on the payload.

```bash
# Quick smoke test
SUREOPS_WEBHOOK_SECRET=your-secret-here \
  node verify-signature.js < sample-alert.json
```

In production, compute the HMAC over the **raw** request bytes (before any JSON
parsing) and compare with `crypto.timingSafeEqual` to avoid timing attacks. The
included `verify-signature.js` does both.
