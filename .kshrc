. /etc/ksh.kshrc

EDITOR='emacsclient -nw'
ALTERNATE_EDITOR='vim'

GREEN="\[\033[0;32m\]"
CYAN="\[\033[0;36m\]"
BCYAN="\[\033[1;36m\]"
BLUE="\[\033[1;34m\]"
GRAY="\[\033[0;37m\]"
WHITE="\[\033[1;37m\]"
RED="\[\033[0;31m\]"
DEFAULT="\[\033[0;39m\]"
YELLOW="\[\033[0;33m\]"

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

PS1='$CYAN[\u@\h]$GREEN[\W]$RED[$?]$YELLOW$(parse_git_branch)$DEFAULT -> '

export EDITOR ALTERNATE_EDITOR PS1
