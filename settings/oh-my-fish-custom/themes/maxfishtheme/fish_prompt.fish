# name: maxfishtheme
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end


function _root_prompt
  if [ (whoami) = 'root' ]
    echo '╾'
  else
    echo '┄'
  end
end

function _root_color
  #set color depending on last_status code
  if test $last_status -eq 0
    set_color green
  else
    set_color red
  end
end

function _vi_prompt
  if [ $vi_mode = $vi_mode_insert ]
    echo '─'
  else
    echo 'N'
  end
end

function _jobs_color
  # -n returns true if string is empty
  if [ (jobs) -n ]
    set_color green
    #no jobs
  else
    #jobs running
    set_color yellow
  end
end

set fish_greeting ''


function fish_prompt -d "Write out the prompt"
  # $status gets nuked as soon as something else is run, e.g. set_color
  # so it has to be saved asap.
  set -g last_status $status

  #set colors
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  set -l root_prompt (_root_color last_status)(_root_prompt)

  set -l vi_prompt (_jobs_color)(_vi_prompt)

  printf '%s%s╼ ' $root_prompt $vi_prompt


  # set -l cwd $cyan(basename (prompt_pwd))

  # if [ (_git_branch_name) ]
  #   set -l git_branch $red(_git_branch_name)
  #   set git_info "$blue git:($git_branch$blue)"

  #   if [ (_is_git_dirty) ]
  #     set -l dirty "$yellow ✗"
  #     set git_info "$git_info$dirty"
  #   end
  # end

  #echo -n -s $arrow $cwd $git_info $normal ' '
end

# See http://geoff.greer.fm/lscolors/
set -x LSCOLORS "exfxcxdxbxbxbxbxbxbxbx"
set -x LS_COLORS "di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=31;40:cd=31;40:su=31;40:sg=31;40:tw=31;40:ow=31;40:"
