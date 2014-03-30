#!/bin/bash
amixer get Master | awk -F'[]%[]' '/%/ {if ($5 == "off") { print "Mute" } else { print $2"%" }}' | head -n 1
