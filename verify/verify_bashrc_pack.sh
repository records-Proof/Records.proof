#!/usr/bin/env sh
set -e

ROOT="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
cd "$ROOT"

echo "Verifying bashrc pack (integrity only)..."
sha256sum -c hashes/bashrc_pack_v1.0.sha256
echo "OK: bashrc pack verification complete (integrity only; no authority asserted)."
