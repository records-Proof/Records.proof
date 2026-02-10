#!/usr/bin/env sh
set -eu
sha256sum -c hashes/root_pack_v1.0.sha256
echo "OK: root.proof pack verified (integrity only; no truth/authority asserted)."
