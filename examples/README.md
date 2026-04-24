# Examples

Vendor-side reference material for prospects evaluating sureops.

## What's here

| Path | What it is |
|---|---|
| [`webhooks/datadog/`](./webhooks/datadog) | Sample Datadog alert payload + signature-verification snippet |
| [`webhooks/pagerduty/`](./webhooks/pagerduty) | Sample PagerDuty incident payload + signature-verification snippet |
| [`mcp/`](./mcp) | MCP tool manifest schema template |

## What's NOT here

These are **vendor-public** examples — they describe the input formats sureops consumes and the schemas we expect. They do **not** contain our wrapper code, our integration internals, or any proprietary handling logic. That code lives in a private repo.

If you're looking for:

- "How does sureops integrate with Datadog?" — see [docs.sureops.ai/integrations/datadog](https://sureops.ai/docs).
- "How do I write a custom MCP tool sureops can call?" — see [`mcp/manifest-template.json`](./mcp/manifest-template.json) and [docs.sureops.ai/mcp](https://sureops.ai/docs).
- "How do I add a new vendor integration?" — file an [Integration request](https://github.com/codehaus-ai/sureops-ai-public/issues/new?template=integration-request.yml).
