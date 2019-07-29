#!/usr/bin/env bash

# Terminate already running bars
killall -q polybar

# Wait them to shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#launch polybar
polybar base &
polybar mon2 &

