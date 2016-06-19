sudo loadkeys ~/.loadkeys

PANEL_FIFO=/tmp/panel-fifo
PANEL_FONT="Monaco:size=9"
PANEL_HEIGHT=40
PANEL_WM_NAME=lemonbar_panel

export PANEL_FIFO PANEL_HEIGHT PANEL_FONT PANEL_WM_NAME
export _JAVA_AWT_WM_NONREPARENTING=1

# start gnome-keyring daemon
if [ -z $SSH_AUTH_SOCK ]; then
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
fi
