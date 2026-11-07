#!/usr/bin/env bash
set -u
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
mode="${1:-${TOOLKIT_MODE:-server}}"
printf 'Terminal Toolkit v0.3 | Profil: %s\n' "$mode"
for app in bash git nvim yazi fzf fd rg; do
 if [[ -x "$ROOT/bin/$app" ]]; then
  found="$ROOT/bin/$app"
 else
  found="$(command -v "$app" 2>/dev/null || true)"
 fi
 if [[ -n "$found" ]]; then printf '✓ %-10s %s\n' "$app" "$found"; else printf '✗ %-10s eksik\n' "$app"; fi
done
if [[ "$mode" == full ]]; then
 for app in tmux bat lsd wl-copy starship; do
  found="$(command -v "$app" 2>/dev/null || true)"
  if [[ -n "$found" ]]; then printf '✓ %-10s %s\n' "$app" "$found"; else printf '· %-10s opsiyonel\n' "$app"; fi
 done
fi
printf 'OS: '; sed -n 's/^PRETTY_NAME=//p' /etc/os-release 2>/dev/null | head -1
printf 'Toolkit: %s\n' "$ROOT"
printf 'Not: Wrapper varligi, gercek binary ve kutuphane uyumlulugunu garanti etmez.\n'
