# Portable, read-only-by-default helper functions.
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status -sb'
alias gd='git diff'
alias gl='git --no-pager log --oneline -10'
alias v='nvim'
alias y='yazi'
command -v lsd >/dev/null 2>&1 && alias ls='lsd'
command -v bat >/dev/null 2>&1 && alias catp='bat --paging=never'
croot() { cd -- "$TERMINAL_TOOLKIT_ROOT" || return; }
ff() {
  if ! command -v fd >/dev/null 2>&1 || ! command -v fzf >/dev/null 2>&1; then echo 'fd ve fzf gerekli' >&2; return 1; fi
  fd -H -t f -E .git | fzf
}
vf() { local file; file="$(ff)" || return; [[ -n "$file" ]] && nvim -- "$file"; }
cf() {
  local dir
  if ! command -v fd >/dev/null 2>&1 || ! command -v fzf >/dev/null 2>&1; then echo 'fd ve fzf gerekli' >&2; return 1; fi
  dir="$(fd -H -t d -E .git | fzf)" || return
  [[ -n "$dir" ]] && cd -- "$dir"
}
fif() {
  local match file line
  if ! command -v rg >/dev/null 2>&1 || ! command -v fzf >/dev/null 2>&1; then echo 'rg ve fzf gerekli' >&2; return 1; fi
  match="$(rg --line-number --no-heading --color never --smart-case -- "${1:-.}" | fzf)" || return
  file="${match%%:*}"; line="${match#*:}"; line="${line%%:*}"
  [[ -f "$file" ]] && nvim "+$line" -- "$file"
}
doctor() { bash "$TERMINAL_TOOLKIT_ROOT/scripts/doctor.sh" "${TOOLKIT_MODE:-server}"; }
