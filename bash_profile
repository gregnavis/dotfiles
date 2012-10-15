#!/bin/sh

if [ -d $HOME/local ]; then
	for bindir in `find $HOME/local -type d -name bin | grep -v '/lib/'`; do
		PATH="$bindir:$PATH"
	done
fi

export PATH

if [ -r /etc/bash_completion ]; then
    . /etc/bash_completion
fi
