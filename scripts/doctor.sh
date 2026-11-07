#!/usr/bin/env bash
set -u
mode="${1:-${TOOLKIT_MODE:-server}}"
printf 'Terminal Toolkit v0.2 | Profil: %s\n' "$mode"
for app in bash git nvim fzf fd rg tmux; do
  if [[ "$app" == nvim || "$app" == yazi ]]; then found="$(PATH="${TOOLKIT_SYSTEM_PATH:-$PATH}" type -P "$app" || true)"; else found="$(command -v "$app" || true)"; fi
  if [[ -n "$found" ]]; then printf '✓ %-10s %s\n' "$app" "$found"; else printf '✗ %-10s eksik\n' "$app"; fi
done
if [[ "$mode" == full ]]; then
  for app in yazi bat lsd wl-copy; do
    if [[ "$app" == nvim || "$app" == yazi ]]; then found="$(PATH="${TOOLKIT_SYSTEM_PATH:-$PATH}" type -P "$app" || true)"; else found="$(command -v "$app" || true)"; fi
  if [[ -n "$found" ]]; then printf '✓ %-10s %s\n' "$app" "$found"; else printf '· %-10s opsiyonel\n' "$app"; fi
  done
fi
printf 'OS: '; sed -n 's/^PRETTY_NAME=//p' /etc/os-release 2>/dev/null | head -1
printf 'Toolkit: %s\n' "${TERMINAL_TOOLKIT_ROOT:-<etkin degil>}"
printf 'Sistem XDG_CONFIG_HOME: %s\n' "${XDG_CONFIG_HOME:-<varsayilan>}"
