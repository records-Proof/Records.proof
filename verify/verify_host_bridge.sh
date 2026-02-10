#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")/.."
sha256sum -c hashes/host_bridge_v1.0.sha256
echo "OK: host.proof bridge verified (integrity only; no truth/authority asserted)."
