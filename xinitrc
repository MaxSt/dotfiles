xrdb -merge ~/.Xresources #update x resources db

#Touchpad Palm Detect
synclient PalmDetect=1 PalmMinZ=80 PalmMinWidth=8

# silent bell
/usr/bin/xset b off

# disable ctrl-s freeze in terminal
stty -ixona

# keyboard settings
~/dotfiles/autostart.sh &

# start dropbox
dropbox start &

# start compton (shadows)
compton --config ~/.config/compton/compton.conf &

# set background image
hsetroot -fill ~/Pictures/bg
# nitrogen --restore

# start dunst (notifications with notify-send)
dunst --config ~/.config/dunst/dunstrc &

# start mudic player demon
# mpd ~/.config/mpd/mpd.conf

# start gnome keyring
gnome-keyring-deamon

sxhkd &
exec bspwm
