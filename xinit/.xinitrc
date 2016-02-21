if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login

## some applications that should be run in the background
# xscreensaver &
xsetroot -cursor_name left_ptr &

setxkbmap -layout pl -option terminate:ctrl_alt_bksp -option ctrl:nocaps
feh --bg-scale ~/Obrazy/meh.ro11761.jpg &
rofi -key-run F8 &

exec xmonad
