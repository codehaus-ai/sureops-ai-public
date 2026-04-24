<!--
  This is the canonical MCP manifest.json schema that sureops loads at runtime.
  An MCP (Model Context Protocol) server advertises its tools via a manifest;
  sureops reads that manifest, registers each tool with the agent runtime, and
  routes tool calls back to your server over the MCP transport.
-->

# MCP Tool Manifest Template

This directory contains a starter `manifest.json` for building a custom MCP
(Model Context Protocol) tool server that sureops agents can call.

## Files

| File | Purpose |
|---|---|
| `manifest-template.json` | Empty MCP manifest. Copy, rename to `manifest.json`, and fill in your tools. |

## Schema

```jsonc
{
  "name": "string",         // Stable identifier for the server.
  "version": "semver",      // Bump on every breaking change.
  "description": "string",  // Human-readable summary shown in the sureops UI.
  "tools": [
    {
      "name": "string",
      "description": "string",
      "input_schema": {
        "type": "object",
        "properties": { /* JSON Schema fragment per argument */ },
        "required": [ /* required arg names */ ]
      }
    }
  ]
}
```

## How sureops loads it

1. Register your MCP server in **Settings → Integrations → MCP servers** with
   its URL and any required auth.
2. sureops fetches the manifest, validates it against the schema above, and
   registers every tool with the agent runtime.
3. Agents can then invoke your tools as part of incident triage / diagnosis /
   resolution. Tool calls flow over the MCP transport — sureops does not
   execute tool logic itself.

For the full Model Context Protocol spec, see
<https://modelcontextprotocol.io>.
