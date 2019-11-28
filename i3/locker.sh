#!/usr/bin/env bash

scrot /tmp/screen_locked.png
convert /tmp/screen_locked.png -blur 0x5 /tmp/screen_locked_blur.png

i3lock -i /tmp/screen_locked_blur.png