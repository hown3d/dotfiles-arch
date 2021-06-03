#!/bin/bash
# Grep the PID of spotify application
SPOTIFY_PID=$(pgrep --full "/opt/spotify/spotify" | head -n 1)

if ! pgrep -x spotify;then
    spotify & 
else
    # Switch to spoitfy window 
    wmctrl -ia "$(wmctrl -lp | awk -vpid="$SPOTIFY_PID" '$3==pid {print $1; exit}')"
fi