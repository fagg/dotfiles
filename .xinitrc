#!/bin/bash

# Set keybindings
xmodmap ~/.Xmodmap

# Start compositor
picom -f --config ~/.config/picom.conf &

# notifications
dunst -conf ~/.dunstrc &

# slstatus
#slstatus 2>&1 >/dev/null &

# wallpaper
#nitrogen --restore &

# dwm
#exec dwm

# X bullshit
xsetroot -cursor_name left_ptr
xset r rate 200 60

# start emacs with dbus bullshit
exec dbus-launch emacs
#exec emacs
