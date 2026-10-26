#!/bin/sh

# Import X11 variables into the user service manager
systemctl --user import-environment \
    DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE XDG_SESSION_DESKTOP

# Also update the D-Bus activation environment
dbus-update-activation-environment --systemd \
    DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE XDG_SESSION_DESKTOP

# Simple file to start bspwm
exec bspwm
