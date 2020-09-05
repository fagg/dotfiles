#!/bin/bash

# Set keybindings
xmodmap ~/.Xmodmap

# Start compositor
picom -f &

# notifications
dunst -conf ~/.dunstrc &

# slstatus
slstatus 2>&1 >/dev/null &

# wallpaper
nitrogen --restore &

# dwm run loop
while true; do 
	dwm >/dev/null 2>&1
done
