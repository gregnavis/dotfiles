#!/bin/bash

if [ -r ~/.bash_profile ]; then
    . ~/.bash_profile
fi

function pushcd {
    if [ $# -eq 0 ]; then
        pushd ~ > /dev/null
    else
        pushd "$@" > /dev/null
    fi
}

alias ls='ls --color=auto'
alias l='ls -la'
alias grep='grep --color=auto'
alias cd='pushcd'
alias b='popd > /dev/null'

PS1='\u@\H \w \D{%Y.%m.%d %H:%M:%S}\n\$ '

[ -d "$HOME/.rvm/bin" ] && PATH="$HOME/.rvm/bin:$PATH"
