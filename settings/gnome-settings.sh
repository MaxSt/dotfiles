#!/usr/bin/env sh

#Keybindings
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Super><Shift>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Super><Shift>6']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 "['<Super><Shift>7']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 "['<Super><Shift>8']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 "['<Super><Shift>9']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Super><Shift>0']"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 "['<Super>7']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 "['<Super>8']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 "['<Super>9']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super>0']"
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>m']"
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>F4', '<Super>w']"
gsettings set org.gnome.desktop.wm.keybindings minimize "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-center "['<Super>c']"
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"

#Preferences
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier "'<Super>'"
gsettings set org.gnome.desktop.wm.preferences num-workspaces "8"
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button "true"

#Tile windows right/left
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Super>h','<Super>Left']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Super>l','<Super>Right']"

#gnome shell keybindings
gsettings set org.gnome.shell.keybindings toggle-application-view "['<Super>a']"
gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>Space']"
gsettings set org.gnome.shell.keybindings toggle-message-tray "['<Super>v']"
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "<Shift><Super>l"


#define custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "urxvt"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Super>Return"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "ranger"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "urxvt -e ranger"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "<Super>e"

#add custom keybings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
