#!/bin/bash

/home/ludi/.pyenv/shims/zscroll --before-text " " --delay 0.3 --length 30 \
		--match-command "spotifyctl -q status --format '%artist%: %title%'" \
		 --scroll 1 \
		--update-check true "spotifyctl -q status --format '%artist%: %title%'" &

wait