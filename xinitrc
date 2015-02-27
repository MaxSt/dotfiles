#!/bin/bash

#set multiple screens to mirror
~/.scripts/mirrordisplays;

#set background
nitrogen --restore &

#effects
compton -b --config ~/.config/compton/compton.conf &


# disable ctrl-s freeze in terminal
stty -ixona &

#start network manager applet
nm-applet &

# start dropbox
dropbox start;

#Touchpad Palm Detect
synclient PalmDetect=1 PalmMinZ=80 PalmMinWidth=8;

#set keyboard delay and rate
xset r rate 200 25;

# silent bell
/usr/bin/xset b off;

# dont turn screen off
xset -dpms; xset s off &

#set cursor
xsetroot -cursor_name left_ptr &

xrdb -merge ~/.Xresources & #update x resources db

exec i3
