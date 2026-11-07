#!/usr/bin/env bash
set -u
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
fail=0
printf 'Terminal Toolkit portable | %s | %s\n' "$(uname -s)" "$(uname -m)"
for app in nvim yazi fzf fd rg starship; do
  if [[ ! -f "$ROOT/apps/$app/.entry" ]]; then
    printf '✗ %-10s portable paket eksik\n' "$app"; fail=1; continue
  fi
  if result="$("$ROOT/bin/$app" --version 2>&1)"; then
    printf '✓ %-10s %s\n' "$app" "$(printf '%s\n' "$result" | head -n 1)"
  else
    printf '✗ %-10s calismiyor: %s\n' "$app" "$result"; fail=1
  fi
done
exit "$fail"
