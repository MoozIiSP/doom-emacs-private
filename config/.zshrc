#!/usr/bin/env bash

# fix interop
fix_wsl2_interop() {
	for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
		if [[ -e "/run/WSL/${i}_interop" ]]; then
			export WSL_INTEROP=/run/WSL/${i}_interop
		fi
	done
}

~/.emacs.d/bin/doom env > /dev/null 2>&1
