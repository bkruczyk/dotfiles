if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# xscreensaver &
xsetroot -cursor_name left_ptr &

setxkbmap -layout pl -option terminate:ctrl_alt_bksp -option ctrl:nocaps
feh --bg-scale ~/Obrazy/meh.ro11761.jpg &
rofi -key-run F8 &
sxhkd &

dotfiles/bar/bar.sh | lemonbar -g 1920x30 -f 'monaco:size=9' &
xmonad
