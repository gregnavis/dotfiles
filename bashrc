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

function __prompt_command() {
    local exit_code=`printf '%+3s' $?`

    if [ $exit_code -eq 0 ]; then
        local exit_code_format="\\033[1;32m\]"
    else
        local exit_code_format="\\033[1;5;31m\]"
    fi
    PS1="\\033[0m\][${exit_code_format}${exit_code}\[\033[0m\]] "
    PS1+="\\D{%H:%M:%S} \\033[1m\]\\w\\033[0m\]\\n"

    if [ "$USER" == "root" ]; then
        PS1+="\\033[1;31m\]"
        local show_host=yes
    elif [ -n "$SSH_CONNECTION" ]; then
        PS1+="\\033[1;35m\]"
        local show_host=yes
    fi

    if [ "$show_host" == "yes" ]; then
        PS1+="\\u@\\H"
    fi
    PS1+="\\$ \\033[0m\]"
}

export PROMPT_COMMAND=__prompt_command

source "$HOME/.bash/fabric-completion.bash"
