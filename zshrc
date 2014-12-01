# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

zstyle ':prezto:module:prompt' theme 'pure'


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

export TERM=xterm-256color
source /etc/profile

# PATH setting
PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/usr/local/rvm/bin:/usr/bin/vendor_perl:/usr/bin/core_perl
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.scripts

# Customize to your needs...
export EDITOR="vim"

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi

#chpwd is called after changing directories
function chpwd(){
  #call ls after cd
  ls;
}
