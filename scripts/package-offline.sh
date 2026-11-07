#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
NAME="$(basename "$ROOT")"

if [[ "$(uname -s)" != Linux || "$(uname -m)" != x86_64 ]]; then
  echo "Yalnizca Linux x86_64 destekleniyor." >&2
  exit 1
fi

for app in nvim yazi fzf fd rg starship; do
  if [[ ! -f "$ROOT/apps/$app/.entry" ]]; then
    echo "Eksik portable paket: $app" >&2
    exit 1
  fi
done

bash "$ROOT/toolbox.sh" --doctor --full

OUT="${1:-$ROOT/../terminal-toolkit-linux-x86_64.tar.gz}"

tar -C "$(dirname "$ROOT")" \
  --exclude="$NAME/.git" \
  --exclude="$NAME/.cache" \
  --exclude="$NAME/.state" \
  --exclude="$NAME/.gitignore" \
  --exclude="$NAME/setup-portable-toolkit.sh" \
  --exclude='*.previous' \
  --exclude='*.bak' \
  --exclude='__pycache__' \
  --exclude='*.pyc' \
  -czf "$OUT" "$NAME"

echo "Offline paket: $OUT"
sha256sum "$OUT"
