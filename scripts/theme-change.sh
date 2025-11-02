#!/bin/bash
#open WallRizz
kitty -1 -o allow_remote_control=yes -o background_opacity=0.8 --title=WallRizz WallRizz -e -n -g 3x5 -s 81x25 -d /home/forest-terminal/wal
#set wallpaper
pywalfox update
pkill waybar 
waybar
~/.config/scripts/animated-wallpaper.sh
if [[ hyprctl workspaces | grep -c 'magic' == 2 ]]; then
  hyprctl dispatch togglespecialworkspace
fi
