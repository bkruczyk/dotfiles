if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

setxkbmap -layout pl -option terminate:ctrl_alt_bksp -option ctrl:nocaps

sxhkd &

xsetroot -cursor_name left_ptr &
feh --bg-scale dotfiles/wall.jpg
eval `ssh-agent -s`

exec bspwm
