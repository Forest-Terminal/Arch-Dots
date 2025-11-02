#!/bin/bash

# Get wallpaper path from swww query
WALLPAPER=$(swww query | grep -oP 'wal\S+')

# Check if we got a valid result
if [ -z "$WALLPAPER" ]; then
  echo "Could not determine current wallpaper"
  exit 1
fi

# Handle different wallpapers
case "$WALLPAPER" in
wal/alone.png)
  swww img ~/wal/ani/alone.gif
  ;;
wal/magic-forest.jpg)
  swww img ~/wal/ani/magic-forest.gif
  ;;
wal/spirit.jpg)
  swww img ~/wal/ani/spirit.gif
  ;;
wal/the-shutdown.jpg)
  swww img ~/wal/ani/the-shutdown.gif
  ;;
wal/trees-of-the-dead.jpg)
  swww img ~/wal/ani/trees-of-the-dead.gif
  ;;
esac
