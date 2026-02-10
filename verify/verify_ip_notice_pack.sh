#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")/.."
sha256sum -c hashes/ip_notice_pack_v1.0.sha256
echo "OK: IP_NOTICE pack verified (integrity only; no truth/authority asserted)."
