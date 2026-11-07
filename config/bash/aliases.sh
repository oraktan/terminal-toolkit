# Portable aliases: only active in the Toolkit shell.
alias ll='ls -alhF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias dir='ls -alh --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias gs='git status -sb'
alias gd='git diff'
alias gl='git --no-pager log --oneline -10'
alias v='nvim'
alias vim='nvim'
alias y='yazi'
alias home='cd ~'
alias downloads='cd ~/Downloads'
alias nedir='cat /etc/os-release'
alias pyserve='python3 -m http.server'
alias untar='tar -xzvf'
alias duf='du -sh -- * 2>/dev/null | sort -h'
command -v tree >/dev/null 2>&1 && alias tree='tree -C'
command -v lsd >/dev/null 2>&1 && alias ls='lsd'
if command -v bat >/dev/null 2>&1; then
 alias catx='bat --paging=never'
 alias catp='bat --paging=never'
elif command -v batcat >/dev/null 2>&1; then
 alias catx='batcat --paging=never'
 alias catp='batcat --paging=never'
fi
croot() { cd -- "$TERMINAL_TOOLKIT_ROOT" || return; }
ff() {
 command -v fd >/dev/null 2>&1 && command -v fzf >/dev/null 2>&1 || { echo 'fd ve fzf gerekli' >&2; return 1; }
 fd -H -t f -E .git | fzf
}
vf() { local file; file="$(ff)" || return; [[ -n "$file" ]] && nvim -- "$file"; }
cf() {
 command -v fd >/dev/null 2>&1 && command -v fzf >/dev/null 2>&1 || { echo 'fd ve fzf gerekli' >&2; return 1; }
 local dir; dir="$(fd -H -t d -E .git | fzf)" || return
 [[ -n "$dir" ]] && cd -- "$dir"
}
fif() {
 command -v rg >/dev/null 2>&1 && command -v fzf >/dev/null 2>&1 || { echo 'rg ve fzf gerekli' >&2; return 1; }
 local match file line
 match="$(rg --line-number --no-heading --color never --smart-case -- "${1:-.}" | fzf)" || return
 file="${match%%:*}"; line="${match#*:}"; line="${line%%:*}"
 [[ -f "$file" ]] && nvim "+$line" -- "$file"
}
doctor() { bash "$TERMINAL_TOOLKIT_ROOT/scripts/doctor.sh" "${TOOLKIT_MODE:-server}"; }
if [[ -f "$TERMINAL_TOOLKIT_ROOT/config/bash/functions.sh" ]]; then
 source "$TERMINAL_TOOLKIT_ROOT/config/bash/functions.sh"
fi
