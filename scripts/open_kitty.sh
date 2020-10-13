#!/usr/bin/env bash

# Detects if iTerm2 is running
if ! pgrep -f "kitty" > /dev/null; then
    open -a "/Applications/kitty.app"
else
    # Create a new window
    if ! osascript -e 'tell application "kitty" to create window with default profile' > /dev/null; then
        # Get pids for any app with "iTerm" and kill
        for i in $(pgrep -f "kitty"); do kill -15 "$i"; done
        open  -a "/Applications/kitty.app"
    fi
fi
