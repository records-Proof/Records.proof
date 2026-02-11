#!/usr/bin/env sh
set -e

ROOT="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
cd "$ROOT"

echo "Verifying docs.proof pack (integrity only)..."

sha256sum -c hashes/docs_proof_pack_v1.0.sha256

echo "OK: docs.proof verification complete (integrity only; no authority asserted)."
