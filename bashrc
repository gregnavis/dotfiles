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
    local red="\[$(tput setaf 1)\]"
    local green="\[$(tput setaf 2)\]"
    local yellow="\[$(tput setaf 5)\]"
    local bold="\[$(tput bold)\]"
    local blink="\[$(tput blink)\]"
    local reset="\[$(tput sgr0)\]"

    local exit_code=`printf '%+3s' $?`

    if [ $exit_code -eq 0 ]; then
        local exit_code_format="${green}"
    else
        local exit_code_format="${bold}${green}"
    fi
    PS1="[${exit_code_format}${exit_code}${reset}] "
    PS1+="\\D{%H:%M:%S} ${bold}\\w${reset}\\n"

    if [ "$USER" == "root" ]; then
        PS1+="${red}"
        local show_host=yes
    elif [ -n "$SSH_CONNECTION" ]; then
        PS1+="${yellow}"
        local show_host=yes
    fi

    if [ "$show_host" == "yes" ]; then
        PS1+="\\u@\\H"
    fi
    PS1+="\\$ ${reset}"
}

export PROMPT_COMMAND=__prompt_command

source "$HOME/.bash/fabric-completion.bash"
