#!/bin/bash

# Set keybindings
xmodmap ~/.Xmodmap

# Start compositor
picom -f --config ~/.config/picom.conf &

# notifications
dunst -conf ~/.dunstrc &

# slstatus
slstatus 2>&1 >/dev/null &

# wallpaper
nitrogen --restore &

# dwm
dwm >/dev/null 2>&1
