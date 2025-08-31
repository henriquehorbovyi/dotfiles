#!/bin/bash
 
DEFAULT_SOURCE=$(pactl get-default-source)
MUTE_STATUS=$(pactl get-source-mute "$DEFAULT_SOURCE" | awk '{print $2}')

if [ "$MUTE_STATUS" == "yes" ]; then
    echo "󰍭" 
else
    echo "󰍬" 
fi

