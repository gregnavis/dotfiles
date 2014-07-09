#!/usr/bin/env bash

_fab_commands () {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "$(fab --shortlist 2>/dev/null)" -- ${cur}) )
}
complete -F _fab_commands fab
