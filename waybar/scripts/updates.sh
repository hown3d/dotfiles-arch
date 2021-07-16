#!/usr/bin/env bash

get_total_updates() { 
	UPDATES=$(checkupdates 2>/dev/null | wc -l); 
	if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
# if ! updates_aur=$(paru -Qum 2> /dev/null | wc -l); then
# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
# if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
# if ! updates_aur=$(pikaur -Qua 2> /dev/null | wc -l); then
# if ! updates_aur=$(rua upgrade --printonly 2> /dev/null | wc -l); then
		updates_aur=0
	fi
	UPDATES=$((UPDATES + updates_aur))


}

get_total_updates
    # when there are updates available
    # every 10 seconds another check for updates is done
if (( $UPDATES >= 0 )); then 
        echo "$UPDATES"
fi
