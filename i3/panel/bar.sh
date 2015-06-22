#!/bin/bash
# Dylan's Lemonbar
# Feel free to use/edit this script!
# If you manage to improve the script please send a PR

# Kills lemon bar to keep one instance open
# Useful as I'm constantly editing and then reloading this file.
pkill lemonbar

# Colors
white="#FFfbfcfc"
black="#FF2a3f44"
background="#00000000"
darkgrey="#282828"
main="#FF79e8c5"

# Fonts
font="-*-tamsyn-medium-r-normal-*-12-*-*-*-*-*-*-1"

clock(){
	# Displays the date eg "Sun 17 May 9:10 AM"
	date=$(date '+%a %d %b %l:%M %p')
	echo " $date"
}

 # cpu(){
 # 	cpuusage=$(mpstat | awk '/all/ {print $4 + $6}')
 # 	echo "$cpuusage% Used"
 # }

 memory(){
 	# Show free memory
 	free -m | awk '/Mem:/ {print "M " $3" MB Used "}'
 }


 volume(){
  volup="A4:amixer set Master -q 5%+:"
  voldown="A5:amixer set Master -q 5%-:"
  volmute="A:amixer set Master toggle:"

  vol=$(amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p' | uniq)

  # Volume Indicator
  # if [[ $(amixer get Master | awk '/Mono:/ {print $6}') == "[off]" ]]; then
  #   vol=$(echo " Mute")
  # else
  #   mastervol=$(amixer get Master | egrep -o '[0-9]{1,3}%' | sed -e 's/%//')
  #   vol=$(echo "V $mastervol")
  # fi

  echo "%{$volup}%{$voldown}%{$volmute} $vol %{A}%{A}%{A}"
 }

windowtitle(){
	# Grabs focused window's title
	# The echo "" at the end displays when no windows are focused.
	title=$(xdotool getactivewindow getwindowname 2>/dev/null || echo "Hi")
	echo "$title" | cut -c 1-50 # Limits the output to a maximum # of chars
}

workspace(){
	# Workspace switcher for i3 using wmctrl ( Can easily be edited for another wm)
	# Supports icon fonts, words and numbers of any length!
	# Functions exactly like the workspace switcher in i3bar
	# Also supports as many workspaces as your wm can create, you'll need the space to avoid overlapping though.

	# Bug: Click events don't work when the workspace is named (number: word) for some reason. Not sure is it's an i3 issue as the code sent to bar looks fine.
	# Missing: Mode indicator (Resize mode, etc) and I don't think it's possible without using an ipc library.

	# Change "next_on_output" to "next" to cycle between every workspace
	workspacenext="A4:i3-msg workspace next_on_output:"
	workspaceprevious="A5:i3-msg workspace prev_on_output:"

	# This part took hours of trial and error, check the git history of this file!
	# Increase the number of variables in print to have workspaces longer than 12 words in length.
	wslist=$(\
		wmctrl -d \
		| awk '/ / {print $2 $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20}' ORS=''\
		| sed -e 's/\s*  //g' \
		-e 's/\*[ 0-9A-Za-z]*[^ -~]*/%{B'$main'}%{F'$black'} & %{B'$background'}%{F'$white'}/g' \
		-e 's/\-[ 0-9A-Za-z]*[^ -~]*/%{B'$background'}%{F'$white'}%{A:i3-msg workspace &:} & %{A}%{B}/g' \
		-e 's/\*//g' \
		-e 's/ -/ /g' \
		)

	# Adds the scrollwheel events and displays the switcher
	echo "%{$workspacenext}%{$workspaceprevious}$wslist%{A}%{A}"
}

while :; do
	# Every line below is a different "Block" on the bar. I've laid it out this way so that it's easier to edit and to see what's going on.
	echo\
		"%{l}\
			$(workspace)\
			%{B$background} $(windowtitle) \
		%{l}\
		%{c}\
			%{B$main} $(echo music) \
			%{B$darkgrey} $(volume) \
		%{c}\
		%{r}\
			%{B$darkgrey} $(echo test) \
			%{B$main} $(memory) \
			%{B$background} $(clock) \
			%{B$background}\
		%{r}"
	sleep 2s
done |

# Finally, launches bar while piping the above while loop!
# | bash is needed on the end for the click events to work.
lemonbar -g x16 -f $font -F $white | bash
