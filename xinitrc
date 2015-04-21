#!/bin/bash

#----------------------------------------------------------------------------------
#execute commands at start
#----------------------------------------------------------------------------------

#set multiple displays to mirror mode; set background
nitrogen --restore &

dunst &

#effects (shadows, opacity, fade)
compton -b --config ~/.config/compton/compton.conf &


# disable ctrl-s freeze in terminal
stty -ixona &


#start network manager applet
nm-applet &

#start volume manager applet
pasystray &

# start dropbox
dropbox start &

#Touchpad Palm Detect
synclient PalmDetect=1 PalmMinZ=80 PalmMinWidth=8 &

#set keyboard delay and rate
xset r rate 200 25 &

# silent bell
/usr/bin/xset b off &

# dont turn screen off
xset -dpms; xset s off &

exec i3
