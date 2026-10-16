#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
MODE=server
TMUX=0
case "${1:-}" in
  --help|-h) printf 'Kullanim: bash toolbox.sh [--server|--full] [--tmux]\n       bash toolbox.sh --doctor [--server|--full]\n'; exit 0;;
esac
DOCTOR=0
for arg in "$@"; do
  case "$arg" in
    --server) MODE=server;;
    --full) MODE=full;;
    --tmux) TMUX=1;;
    --doctor) DOCTOR=1;;
    *) printf 'Bilinmeyen secenek: %s\n' "$arg" >&2; exit 2;;
  esac
done
export TERMINAL_TOOLKIT_ROOT="$ROOT" TOOLKIT_MODE="$MODE"
export TOOLKIT_SYSTEM_PATH="$PATH"
# Keep original XDG settings for unrelated programs; wrappers isolate only Neovim/Yazi.
export PATH="$ROOT/bin:$PATH"
export TOOLKIT_STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/terminal-toolkit"
mkdir -p -- "$TOOLKIT_STATE_DIR"
if (( DOCTOR )); then exec bash "$ROOT/scripts/doctor.sh" "$MODE"; fi
printf '🧰 Terminal Toolkit v0.3 (%s). doctor / nvim / yazi / vf / cf / exit\n' "$MODE"
if [[ "$MODE" == full ]]; then
  for app in yazi bat lsd; do command -v "$app" >/dev/null 2>&1 || printf 'Not: %s kurulu degil (opsiyonel).\n' "$app"; done
fi
if (( TMUX )); then
  if ! command -v tmux >/dev/null 2>&1; then echo 'tmux bulunamadi. Normal shell aciliyor.' >&2
  else
    # Attach or create a persistent session. The session runs the same isolated shell.
    printf -v inner 'exec bash --noprofile --rcfile %q -i' "$ROOT/config/bash/bashrc"
    exec tmux new-session -A -s terminal-toolkit "$inner"
  fi
fi
exec bash --noprofile --rcfile "$ROOT/config/bash/bashrc" -i
