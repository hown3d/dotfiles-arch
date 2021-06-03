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

while true; do
    get_total_updates

    # notify user of updates
    #if hash notify-send &>/dev/null; then
    #    if (( UPDATES > 50 )); then
    #        notify-send -u critical -i $NOTIFY_ICON \
    #            "You really need to update!!" "$UPDATES New packages"
    #    elif (( UPDATES > 25 )); then
    #        notify-send -u normal -i $NOTIFY_ICON \
    #            "You should update soon" "$UPDATES New packages"
    #    elif (( UPDATES > 2 )); then
    #        notify-send -u low -i $NOTIFY_ICON \
    #            "$UPDATES New packages"
    #    fi
    #fi

    # when there are updates available
    # every 10 seconds another check for updates is done
    while (( UPDATES > 0 )); do
        if (( UPDATES == 1 )); then
            echo "$UPDATES"
        elif (( UPDATES > 1 )); then
            echo "$UPDATES"
        else
            echo "None"
        fi
        sleep 10
        get_total_updates
    done

    # when no updates are available, use a longer loop, this saves on CPU
    # and network uptime, only checking once every 30 min for new updates
    while (( UPDATES == 0 )); do
        echo "None"
        sleep 1800
        get_total_updates
    done
done
