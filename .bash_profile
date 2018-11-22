[ -n "$PS1" ] && source ~/.bash_settings

# Start X on TTY1
if [[ !$DISPLAY && $XDG_VTNR -eq 1 ]]; then
    startx
fi
