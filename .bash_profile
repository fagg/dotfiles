################################################################################################
# Ashton Fagg's .bash_profile
# Last Modified: 8 Sept, 2016
###############################################################################################

################################################################################
# Aliases
###############################################################################################
alias ll='LC_ALL=C ls -l'                # Show permissions etc
alias ls='LC_ALL=C ls -a'                # Show all files and types by default
alias l.='LC_ALL=C ls -d .[a-zA-Z0-9]*'  # Show hidden (dot files) only

##############################################################################################
# Environment Variables
##############################################################################################
export EDITOR="vim"
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Default environment
export MY_BIN=$HOME/bin:$HOME/.local/bin
export PATH=$MY_BIN:$PATH

##############################################################################################
# Prompt Settings
##############################################################################################
# This for my fancy prompt. This will format a prompt that shows you the return code of the
# previous command and also the git branch you are currently working on.
#
# parse_git_branch() - formats the name of the git branch
# prompt_command() - formats the prompt itself
##############################################################################################

function parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1\]/'
}

prompt_command () {
      if [ $? -eq 0 ]; then # set an error string for the prompt, if applicable
          ERRPROMPT="[0]"
      else
          ERRPROMPT='[$?]'
      fi

    local GREEN="\[\033[0;32m\]"
    local CYAN="\[\033[0;36m\]"
    local BCYAN="\[\033[1;36m\]"
    local BLUE="\[\033[1;34m\]"
    local GRAY="\[\033[0;37m\]"
    local WHITE="\[\033[1;37m\]"
    local RED="\[\033[0;31m\]"
    local DEFAULT="\[\033[0;39m\]"
    local YELLOW="\[\033[0;33m\]"
    #export PS1="$GREEN[\u@\h]$DEFAULT->$BCYAN(\W)$DEFAULT->$YELLOW$(parse_git_branch)$DEFAULT->${RED}${ERRPROMPT}$DEFAULT\n$ "
    export PS1="$BLUE[\u@\h]$GREEN[\W]$YELLOW$(parse_git_branch)${RED}${ERRPROMPT}$DEFAULT -> "
}

PROMPT_COMMAND=prompt_command

# git-ignore() - Returns gitignore templates.
function git-ignore() { 
    curl http://www.gitignore.io/api/$@ ;
}


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh rsync;

