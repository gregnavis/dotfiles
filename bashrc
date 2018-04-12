#!/bin/bash

function pushcd {
    if [ $# -eq 0 ]; then
        pushd ~ > /dev/null
    else
        pushd "$@" > /dev/null
    fi
}

if [ "${OSTYPE#darwin}" != "${OSTYPE}" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias l='ls -l'
alias la='ls -la'
alias grep='grep --color=auto'
alias g='grep'
alias gv='grep -v'
alias gr='grep -r'
alias gi='grep -i'
alias gri='grep -ri'
alias cd='pushcd'
alias b='popd > /dev/null'

# git
alias ga='git add'
alias gap='git add -p'
alias gb='git branch'
alias gbD='git branch -D'
alias gbd='git branch -d'
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gcaa='git commit -a --amend -v'
alias gcaaC='git commit -a --amend -C HEAD'
alias gcam='git commit -a -m'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcop='git checkout -p'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias glg='git log --graph'
alias gm='git merge'
alias gp='git push'
alias gpsm='git push staging master'
alias gppm='git push production master'
alias gpf='git push -f'
alias gplom='git pull origin master'
alias gpom='git push origin master'
alias gr='git rm'
alias greb='git rebase'
alias grebc='git rebase --abort'
alias grebc='git rebase --continue'
alias grebim='git rebase -i master'
alias gresh='git reset --hard'
alias gs='git status -sb'
alias gsh='git show'

alias .update='sudo yum update'
alias .install='sudo yum install'

function __prompt_command() {
    local exit_code=`printf '%+3s' $?`

    local red="\[$(tput setaf 1)\]"
    local green="\[$(tput setaf 2)\]"
    local yellow="\[$(tput setaf 5)\]"
    local bold="\[$(tput bold)\]"
    local blink="\[$(tput blink)\]"
    local reset="\[$(tput sgr0)\]"

    if [ $exit_code -eq 0 ]; then
        local exit_code_format="${green}"
    else
        local exit_code_format="${bold}${blink}${red}"
    fi

    PS1="[${exit_code_format}${exit_code}${reset}] "
    PS1+="\\D{%H:%M:%S}"

    if [ -n "${CTX_NAME}" ]; then
        PS1+=" [${red}${CTX_NAME}${reset}]"
    fi

    if [ -n "$VIRTUAL_ENV" ]; then
        PS1+=" ${green}${VIRTUAL_ENV#${WORKON_HOME}/}${reset}"
    fi

    PS1+=" ${bold}\\w${reset}"

    local branch=`git branch 2> /dev/null | grep '*' | cut -c3-`

    if [ -n "${branch}" ]; then
        PS1+=" ${red}${branch}${reset}"
    fi

    if [ -n "$PS1_NOTE" ]; then
        PS1+=" (${PS1_NOTE})"
    fi

    PS1+="\\n"

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

function note() {
    PS1_NOTE="$1"
    if [ -z "${PS1_NOTE}" ]; then
        unset PS1_NOTE
    fi
}

PROMPT_COMMAND=__prompt_command
HISTCONTRL=ignorespace:erasedups
HISTFILESIZE=7500
HISTSIZE=5000

source "$HOME/.bash/fabric-completion.bash"
command -v pip >& /dev/null && eval "$(pip completion --bash)"

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

# load bash-ctx
if [ -r "${HOME}/.bash-ctx/bash-ctx" ]; then
    . "${HOME}/.bash-ctx/bash-ctx"
fi

# exit the script with a successful command so bash doesn't report an error
# status immediately after starting
true
