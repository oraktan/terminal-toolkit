# Portable Bash helpers. Dependencies are checked when invoked.
croot() { cd -- "$TERMINAL_TOOLKIT_ROOT" || return; }
mkcd() { [[ $# -eq 1 ]] || { echo 'Kullanim: mkcd DIZIN' >&2; return 2; }; mkdir -p -- "$1" && cd -- "$1"; }
ff() {
  command -v fzf >/dev/null 2>&1 || { echo 'fzf gerekli' >&2; return 127; }
  if command -v fd >/dev/null 2>&1; then fd -H -t f -E .git | fzf
  elif command -v fdfind >/dev/null 2>&1; then fdfind -H -t f -E .git | fzf
  else find . -type f -not -path '*/.git/*' | fzf; fi
}
vf() { local file; file="$(ff)" || return; [[ -n "$file" ]] && nvim -- "$file"; }
cf() {
  command -v fzf >/dev/null 2>&1 || { echo 'fzf gerekli' >&2; return 127; }
  local dir
  if command -v fd >/dev/null 2>&1; then dir="$(fd -H -t d -E .git | fzf)" || return
  elif command -v fdfind >/dev/null 2>&1; then dir="$(fdfind -H -t d -E .git | fzf)" || return
  else dir="$(find . -type d -not -path '*/.git/*' | fzf)" || return; fi
  [[ -n "$dir" ]] && cd -- "$dir"
}
fif() {
  [[ $# -ge 1 ]] || { echo 'Kullanim: fif ARANACAK_METIN' >&2; return 2; }
  command -v rg >/dev/null 2>&1 && command -v fzf >/dev/null 2>&1 || { echo 'rg ve fzf gerekli' >&2; return 127; }
  local match file line
  match="$(rg --line-number --no-heading --color never --smart-case -- "$1" | fzf)" || return
  file="${match%%:*}"; line="${match#*:}"; line="${line%%:*}"
  [[ -f "$file" ]] && nvim "+$line" -- "$file"
}
psg() { [[ $# -ge 1 ]] || { echo 'Kullanim: psg KELIME' >&2; return 2; }; ps aux | grep -i -- "[${1:0:1}]${1:1}"; }
myip() { command -v curl >/dev/null 2>&1 || { echo 'curl gerekli' >&2; return 127; }; curl -fsS --max-time 8 https://api.ipify.org && printf '\n'; }
ports() { if command -v ss >/dev/null 2>&1; then ss -tuln; elif command -v netstat >/dev/null 2>&1; then netstat -tuln; else echo 'ss veya netstat gerekli' >&2; return 127; fi; }
maxdosya() { local n="${1:-10}"; [[ "$n" =~ ^[0-9]+$ ]] || { echo 'Sayi gerekli' >&2; return 2; }; du -ah -- . 2>/dev/null | sort -rh | head -n "$n"; }
duh() { du -h --max-depth=1 -- "${1:-.}" 2>/dev/null || du -h -d 1 -- "${1:-.}"; }
doctor() { bash "$TERMINAL_TOOLKIT_ROOT/scripts/doctor.sh" "${TOOLKIT_MODE:-server}"; }

# Dosya yollarinda buyuk/kucuk harf duyarsiz arama.
fhere() {
  if [ "$#" -ne 1 ]; then
    printf 'Kullanim: fhere aranacak-ifade\n' >&2
    return 2
  fi
  find . -iname "*$1*"
}
