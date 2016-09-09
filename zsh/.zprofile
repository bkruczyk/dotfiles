sudo loadkeys ~/.loadkeys

PANEL_FIFO=/tmp/panel-fifo
PANEL_FONT="-lucy-tewi-medium-r-normal-*-*-*-100-100-*-*-*-*"
PANEL_FONT="-xos4-terminus-medium-*-normal-*-*-*-72-72-*-*-iso8859-13"
PANEL_HEIGHT=36
PANEL_WM_NAME=lemonbar_panel

TITLE_BAR_FIFO=/tmp/title-bar-fifo
TITLE_BAR_WM_NAME=title_bar_panel

export PANEL_FIFO PANEL_HEIGHT PANEL_FONT PANEL_WM_NAME TITLE_BAR_FIFO TITLE_BAR_WM_NAME
export _JAVA_AWT_WM_NONREPARENTING=1

# start gnome-keyring daemon
if [ -z $SSH_AUTH_SOCK ]; then
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
fi

export INFINALITY_FT="ultimate5"
