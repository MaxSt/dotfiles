export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Aliases
alias t="task"
alias v="vim"
alias g="git"
alias l="ls"
alias c="cd"
alias tr="tmuxinator"
if ~/.scripts/command_is_available trash-put; then
  alias rm="trash-put"
fi

# load zgen
source "${HOME}/.zgen/zgen.zsh"

#theme
source "${HOME}/dotfiles/settings/maxtheme"

# check if there's no init script
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  # plugins
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  #zgen load zsh-users/zsh-syntax-highlighting
  zgen oh-my-zsh plugins/vi-mode
  zgen oh-my-zsh plugins/tmux


  # completions
  zgen load zsh-users/zsh-completions src

  # theme
  #zgen oh-my-zsh themes/arrow

  # save all to init script
  zgen save
fi

# if $LANG isnt set set it to en_US.UTF-8
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi


# PATH setting
PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/usr/local/rvm/bin:/usr/bin/vendor_perl:/usr/bin/core_perl
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.scripts

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi

#chpwd is called after changing directories
function chpwd(){
  #call ls after cd
  ls;
}
