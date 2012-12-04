#!/bin/sh

if [ -d $HOME/local ]; then
	for bindir in `find $HOME/local -type d -name bin | grep -v '/lib/'`; do
		PATH="$bindir:$PATH"
	done
fi

if [ -r /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -d "$HOME/.rbenv" ]; then
    PATH="$HOME/.rbenv/bin:$PATH"
    export PATH
    eval "$(rbenv init -)"
fi
