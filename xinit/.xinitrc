if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -load .Xresources
setxkbmap -layout pl -option terminate:ctrl_alt_bksp -option ctrl:nocaps
xsetroot -cursor_name left_ptr &
# unclutter &
feh --bg-scale dotfiles/wall.jpg
# xrandr --output HDMI1 --primary --output --left-of LVDS1
xrandr --output HDMI1 --primary --output LVDS1 --off
dotfiles/bar/panel &
compton -b
sxhkd &> .sxhkd.log &

# opt/2bwm/2bwm &
# urxvt
exec runfyre
