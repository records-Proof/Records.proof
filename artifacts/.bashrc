# records.proof / dev.proof safe environment
# Author: Kam Swygert
# Status: Informational • Non-Binding
# Purpose: deterministic, audit-friendly local shell state (no authority asserted)

##### Locale (deterministic output for hashing / JSON)
export LC_ALL=C
export LANG=C

##### PATH (Termux defaults + local bin)
export PATH="$HOME/bin:$PATH"

##### Shell behavior (safe defaults)
set -o pipefail
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000

##### Disable noisy command-not-found handler (quiet, deterministic)
unset -f command_not_found_handle 2>/dev/null || true

##### Scoped env (non-authoritative)
export RECORDS_PROOF_HOME="$HOME/record.proof"
export DEV_PROOF_HOME="$HOME/record.proof/dev.proof"

##### Deterministic helper aliases
alias ll='ls -lah'
alias jqf='jq .'
alias sha='sha256sum'
alias serve8080='python -m http.server 8080'

##### .proof prompt semantics (fail-closed)
# [OK] = last command exit 0
# [FAIL:n] = last command exit non-zero (surfaced)
proof_status() {
  local s=$?
  if [ "$s" -eq 0 ]; then
    printf "OK"
  else
    printf "FAIL:%s" "$s"
  fi
}

# ANCHOR = working inside a local .proof publication root (signal only)
proof_anchor() {
  local d="$PWD"
  while [ "$d" != "/" ]; do
    if [ -f "$d/root_pack_v1.0.sha256" ] || [ -f "$d/root.proof/index.json" ]; then
      printf " ANCHOR"
      return 0
    fi
    d="${d%/*}"
    [ -z "$d" ] && d="/"
  done
  return 0
}

PS1='[ $(proof_status) ]$(proof_anchor) \u@\h:\w \$ '

##### Safety notice (non-authoritative)
# This environment asserts no authority, registry, DNS delegation,
# endorsement, or governance role. Local dev + verification only.
