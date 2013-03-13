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
alias l='ls -l'
alias la='ls -la'
alias grep='grep --color=auto'
alias cd='pushcd'
alias b='popd > /dev/null'

function user_and_host() {
    if [ -n "$SSH_CONNECTION" -o "$USER" == "root" ]; then
        echo "\\u@\\H "
    fi
}

PS1="\[\033[4;30m\]$(user_and_host)\\D{%H:%M:%S} \\w\\n\[\033[0m\]\\$ "
