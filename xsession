#!/bin/bash

WALLPAPER=~/.wallpaper
XMODMAP=~/.xmodmap

# set environment variables
if [ -r "$HOME/.env" ]; then
    . $HOME/.env
fi

# set the background
[ -r $WALLPAPER ] && hsetroot -full $WALLPAPER

# remap keys
[ -r $XMODMAP ] && xmodmap $XMODMAP

# enable latchlock and sticky keys
xkbset exp 60 =sticky =twokey =latchlock
xkbset sticky -twokey latchlock

# don't annoy me!
xset -b

# start Dropbox (if installed)
if command -v dropbox
then
    dropbox start
fi

# start xflux (if installed)
if command -v xflux
then
    xflux -l 53 -g -14
fi

# start the rxvt daemon
urxvtd &

# go!
xmonad
