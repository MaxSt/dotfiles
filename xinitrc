xrdb -merge ~/.Xresources #update x resources db

#Add font
xset +fp /usr/share/fonts/local
xset fp rehash

#Touchpad Palm Detect
synclient PalmDetect=1 PalmMinZ=80 PalmMinWidth=8

#set keyboard delay and rate
xset r rate 200 25

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
hsetroot -center ~/Pictures/bg
# nitrogen --restore

# start dunst (notifications with notify-send)
dunst --config ~/.config/dunst/dunstrc &

# start mudic player demon
# mpd ~/.config/mpd/mpd.conf

# start gnome keyring
# Start a D-Bus session
# Source the below file only if you do not already use the default xinitrc skeleton. 
# Otherwise you will end up with multiple dbus sessions.
source /etc/X11/xinit/xinitrc.d/30-dbus
# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too:
export GPG_AGENT_INFO SSH_AUTH_SOCK

# start pulse audio
/usr/bin/start-pulseaudio-x11 &

# dont turn screen off
xset -dpms; xset s off &

sxhkd &
exec bspwm
