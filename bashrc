#!/bin/bash

if [ -r ~/.bash_profile ]; then
    . ~/.bash_profile
fi

alias ls='ls --color=auto'
alias l='ls -la'
alias grep='grep --color=auto'
alias cd='pushd > /dev/null'
alias b='popd > /dev/null'

PS1='\u@\H \w \D{%Y.%m.%d %H:%M:%S}\n\$ '
