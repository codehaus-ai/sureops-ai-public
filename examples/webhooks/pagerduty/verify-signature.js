// Verifies the X-Sureops-Signature header on an inbound PagerDuty webhook.
//
// sureops re-signs every webhook payload with HMAC-SHA256 using a per-integration
// secret (see Settings → Integrations → PagerDuty → Webhook secret). Compare the
// computed digest against the header value using a constant-time check to avoid
// timing attacks.
//
// Usage:
//   node verify-signature.js < sample-incident.json
//
// In a real handler you'd plug this into Express / Fastify / Lambda etc.
//   const ok = verifySignature(rawBody, req.headers['x-sureops-signature'], secret);

const crypto = require("crypto");

/**
 * @param {string|Buffer} rawBody  Raw request body — must be the exact bytes received.
 * @param {string} signatureHeader The value of the X-Sureops-Signature header.
 * @param {string} secret          The shared webhook secret from sureops.
 * @returns {boolean} true if the signature is valid.
 */
function verifySignature(rawBody, signatureHeader, secret) {
  if (!signatureHeader || !secret) return false;

  const expected = crypto
    .createHmac("sha256", secret)
    .update(rawBody)
    .digest("hex");

  // Constant-time compare; both buffers must be the same length.
  const a = Buffer.from(expected, "hex");
  const b = Buffer.from(signatureHeader, "hex");
  if (a.length !== b.length) return false;
  return crypto.timingSafeEqual(a, b);
}

module.exports = { verifySignature };

// Demo run when invoked directly.
if (require.main === module) {
  const secret = process.env.SUREOPS_WEBHOOK_SECRET || "replace-me";
  const body = require("fs").readFileSync(0, "utf8"); // stdin
  const sig = crypto.createHmac("sha256", secret).update(body).digest("hex");
  console.log("X-Sureops-Signature:", sig);
  console.log("verifySignature() ->", verifySignature(body, sig, secret));
}
