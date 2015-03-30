# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
set fish_custom /home/max/dotfiles/settings/oh-my-fish-custom

# Theme
set fish_theme maxfishtheme

#set fzf default
set -x FZF_DEFAULT_COMMAND 'ag -l -g ""'

# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
set fish_plugins vi-mode archlinux ssh tmux


# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish
