#!/usr/bin/env sh
set -eu
sha256sum -c finalize_pack_v1.0.sha256
echo "OK: finalize pack verified (integrity only; no truth/authority asserted)."
