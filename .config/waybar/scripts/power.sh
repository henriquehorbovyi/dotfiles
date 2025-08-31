#!/bin/bash

# ~/.config/waybar/scripts/power.sh

# This script provides a power menu using wofi.

options="Shutdown\nReboot\nLock\nLogout"
selected=$(echo -e "$options" | wofi --dmenu --prompt "Power Menu")

case "$selected" in
    "Shutdown")
        systemctl poweroff
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Lock")
        # Use your preferred screen locker here.
        # For example, swaylock or hyprlock
        hyprlock
        ;;
    "Logout")
        # Use the appropriate command for your desktop environment
        hyprctl dispatch exit
        ;;
esac

