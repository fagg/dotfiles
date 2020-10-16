autoload colors && colors
setopt prompt_subst

# Git branch info.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '[%b]'

# Prompt builder.
precmd () {
	vcs_info
}

PROMPT='%{$fg[cyan]%}[%n@%m]%{$fg[green]%}[%1~]%{$fg[yellow]%}${vcs_info_msg_0_}%{$fg[red]%}[%?]%{$fg[white]%} -> '

# Coloring.
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Aliases
alias ll='LC_ALL=C ls -l'                # Show permissions etc
alias ls='LC_ALL=C ls -a'                # Show all files and types by default
alias l.='LC_ALL=C ls -d .[a-zA-Z0-9]*'  # Show hidden (dot files) only
alias em='emacsclient -n'
alias zzz='systemctl suspend'
alias mutt='neomutt'
alias checkmail='mbsync -a && neomutt'

# Editor
export EDITOR='emacsclient -t'
export ALTERNATE_EDITOR='vim'

# Default environment
export MY_BIN=$HOME/bin
export PYTHON_BIN=$HOME/.local/bin
export GOLANG_BIN=$HOME/go/bin
export PATH=$MY_BIN:$PYTHON_BIN:$GOLANG_BIN:$PATH

# Configure depending on what sort of box this is.
case "$OSTYPE" in
  darwin*)
	  export HOMEBREW_PATH=/usr/local/bin
	  export PIP_PATH=~/Library/Python/3.7/bin
	  export PATH=$PIP_PATH:$HOMEBREW_PATH:$PATH
  ;;
  linux*)
  ;;
  dragonfly*|freebsd*|netbsd*|openbsd*)
  ;;
esac
