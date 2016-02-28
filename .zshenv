if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start 2>/dev/null || gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
