################################################################################################
# Ashton Fagg's .bash_profile
# Last Modified: 30 July 2014
###############################################################################################

################################################################################
# Aliases
###############################################################################################
alias ll='LC_ALL=C ls -l'  # Show permissions etc
alias ls='LC_ALL=C ls -a'    # Show all files and types by default
alias l.='LC_ALL=C ls -d .[a-zA-Z0-9]*' # Show hidden (dot files) only
alias d='pwd'  # Print working directory
alias del='rm -i'
alias more='less'
alias nano='nano -c'
alias tx='tar -xvf'
alias tc='tar -czvf'
alias webdl='~/bin/webdl/grabber.py'

# These are aliases to easily enable/disable the showing of hidden
# (dot files) in Finder. Beware that this will restart Finder, so all
# of your Finder windows will disappear briefly.
alias doton='defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder'
alias dotoff='defaults write com.apple.Finder AppleShowAllFiles NO &&  killall Finder'

##############################################################################################
# Environment Variables
##############################################################################################
export EDITOR=/usr/bin/vim
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
export PATH=$HOME/bin:/usr/local/bin:$PATH

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
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/->(\1)/'
}

prompt_command () {
      if [ $? -eq 0 ]; then # set an error string for the prompt, if applicable
          ERRPROMPT=""
      else
          ERRPROMPT='->($?)'
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
    export PS1="$BLUE[$GREEN\u@\h$DEFAULT:$BCYAN\w$BLUE]$YELLOW$(parse_git_branch)${RED}${ERRPROMPT}\n$DEFAULT$ "
}

PROMPT_COMMAND=prompt_command

# git-ignore() - Returns gitignore templates.
function git-ignore() { 
    curl http://www.gitignore.io/api/$@ ;
}


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;
# Set vi mode for shell
set -o vi
