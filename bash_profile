#!/bin/sh

for bindir in `find $HOME/local -type d -name bin`; do
    PATH="$bindir:$PATH"
done

export PATH

if [ -r /etc/bash_completion ]; then
    . /etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
