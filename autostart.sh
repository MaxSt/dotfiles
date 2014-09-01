# Remap Capslock to Escape
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# Map altgr + Zeichen als Sonderzeichen
xmodmap -e "keycode 108 = Mode_switch"
xmodmap -e "keysym e = e E EuroSign"
xmodmap -e "keysym c = c C cent"
xmodmap -e "keysym a = a A adiaeresis Adiaeresis"
xmodmap -e "keysym o = o O odiaeresis Odiaeresis"
xmodmap -e "keysym u = u U udiaeresis Udiaeresis"
xmodmap -e "keysym s = s S ssharp"

#Add font
xset +fp /usr/share/fonts/local
xset fp rehash
