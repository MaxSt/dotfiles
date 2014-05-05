#!/usr/bin/env zsh
#local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

setopt promptsubst

autoload -U add-zsh-hook

PROMPT_SUCCESS_COLOR=$FG[004] #blue
PROMPT_FAILURE_COLOR=$FG[009] #darkred
PROMPT_VCS_INFO_COLOR=$FG[007] #gray
PROMPT_PROMPT=$FG[010] #darkgreen
GIT_DIRTY_COLOR=$FG[001] #red
GIT_CLEAN_COLOR=$FG[003] #yellow
GIT_PROMPT_INFO=$FG[001] #red


# Prompt format
PROMPT='%{$GIT_CLEAN_COLOR%}<%n> %{$PROMPT_SUCCESS_COLOR%}%~%{$reset_color%} %{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}%{$PROMPT_PROMPT%}»%{$reset_color%} '

#RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[172]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[161]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}✹%{$reset_color%}"
