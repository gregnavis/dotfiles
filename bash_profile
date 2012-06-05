#!/bin/sh

if [ -x ~/local/bin ]; then
    export PATH="~/local/bin:$PATH"
fi

if [ -r /etc/bash_completion ]; then
    . /etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
