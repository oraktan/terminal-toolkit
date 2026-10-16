# Portable aliases only. No personal paths, credentials, sudo or destructive shortcuts.
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dir='ls -alh'
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
elif command -v batcat >/dev/null 2>&1; then
  alias catx='batcat --paging=never'
fi
source "$TERMINAL_TOOLKIT_ROOT/config/bash/functions.sh"
