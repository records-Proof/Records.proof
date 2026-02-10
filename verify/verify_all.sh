#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")/.."

echo "[1/2] Verifying root pack..."
sha256sum -c hashes/root_pack_v1.0.sha256

if [ -f hashes/records_proof_gateway_v1.sha256 ]; then
  echo "[2/2] Verifying records.proof gateway pack..."
  sha256sum -c hashes/records_proof_gateway_v1.sha256
else
  echo "[2/2] Skipping gateway pack (hashes/records_proof_gateway_v1.sha256 not present)"
fi

echo "OK: verification complete (integrity only; no truth/authority asserted)."
