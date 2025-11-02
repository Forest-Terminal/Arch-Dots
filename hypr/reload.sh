#!/bin/bash
pkill cava
kitty +kitten panel --edge=background -o background_opacity=0 -o font_size=10 cava
#Waybar
if pgrep waybar >/dev/null 2>&1; then
  pkill waybar
  waybar
else
  waybar
fi
#Hyprpaper
if pgrep swww-daemon >/dev/null 2>&1; then
  pkill swww-daemon
  swww-daemon
else
  swww-daemon
fi
