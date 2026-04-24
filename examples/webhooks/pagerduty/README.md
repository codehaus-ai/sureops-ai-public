# PagerDuty Webhook Example

This directory shows what a PagerDuty incident event looks like when it arrives
at the sureops webhook endpoint, and how to verify its signature.

## Files

| File | Purpose |
|---|---|
| `sample-incident.json` | A representative `incident.triggered` v3 event payload. Use this as a fixture in tests or local replay tools. |
| `verify-signature.js` | Node.js snippet that verifies the `X-Sureops-Signature` HMAC-SHA256 header against your webhook secret. |

## Wiring up the webhook in PagerDuty

1. In sureops: **Settings → Integrations → PagerDuty → Generate webhook URL**.
   Copy the URL and the secret.
2. In PagerDuty: **Integrations → Generic Webhooks (v3) → New Webhook**.
   Paste the sureops URL and select the events you want to forward
   (at minimum: `incident.triggered`, `incident.acknowledged`, `incident.resolved`).
3. Scope the webhook to the services / teams you want sureops to manage.

## Verifying the signature

Every webhook from sureops carries an `X-Sureops-Signature` header containing
the hex-encoded HMAC-SHA256 of the raw body using your integration secret.
Always verify before acting on the payload.

```bash
# Quick smoke test
SUREOPS_WEBHOOK_SECRET=your-secret-here \
  node verify-signature.js < sample-incident.json
```

In production, compute the HMAC over the **raw** request bytes (before any JSON
parsing) and compare with `crypto.timingSafeEqual` to avoid timing attacks. The
included `verify-signature.js` does both.
