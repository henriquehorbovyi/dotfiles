#!/bin/bash
# ~/.config/waybar/scripts/mic-toggle.sh
# Toggles the mute status of the default microphone.

# Get the name of the default source (microphone)
DEFAULT_SOURCE=$(pactl get-default-source)

# Toggle the mute status for that source
pactl set-source-mute "$DEFAULT_SOURCE" toggle

echo "Microphone mute toggled for $DEFAULT_SOURCE"

