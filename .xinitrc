#!/bin/sh
/usr/bin/xcalib -d :0 /home/stephen/.color/icc/dell_u2211h.icc &
xrdb -load /home/stephen/.Xresources &
xsetroot -cursor_name left_ptr &
numlockx &
smount -a &
export DE="gnome" &
nitrogen --restore &
compton --config /home/stephen/.config/Compton/compton.conf &
mpd --no-daemon &
#tint2 &
sxhkd &
#urxvt-tabbed &
#panel
#export PANEL_FIFO=/tmp/panel-fifo
#[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
#mkfifo "$PANEL_FIFO"
#exec bspwm -s "$PANEL_FIFO" -p W
exec bspwm
