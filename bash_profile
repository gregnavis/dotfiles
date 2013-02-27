#!/bin/sh

if [ -r /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# initialize rbenv (if installed)
if [ -d "$HOME/.rbenv" ]; then
    PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

export PATH

# set environment variables
if [ -r "$HOME/.env" ]; then
    . $HOME/.env
fi
