#!bin/bash

[ -f ~/.xprofile ] && . ~/.xprofile

# while true; do
	# xsetroot -name  "$(date +"%a %b %d %r")"
	# sleep 2
# done

# dwmstatus (using autostart patch, included in ~/.dwm/autostart.sh)
# dwmstatus 2>&1 >/dev/null &

xrdb -load ~/.Xresources

# exec i3
# exec bspwm
SXHKD_SHELL="/usr/bin/sh"
exec dwm
