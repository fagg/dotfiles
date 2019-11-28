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

PROMPT='%{$fg[cyan]%}[%n@%m]%{$fg[green]%}[%~]%{$fg[yellow]%}${vcs_info_msg_0_}%{$fg[red]%}[%?]%{$fg[white]%} -> '

# Coloring.
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Aliases
alias ll='LC_ALL=C ls -l'                # Show permissions etc
alias ls='LC_ALL=C ls -a'                # Show all files and types by default
alias l.='LC_ALL=C ls -d .[a-zA-Z0-9]*'  # Show hidden (dot files) only
alias em='emacsclient -n'

# Default environment
export MY_BIN=$HOME/bin
export PATH=$MY_BIN:$PATH
