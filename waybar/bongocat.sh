#!/bin/bash

ASSETS="$HOME/.config/waybar/assets"
NUM_FRAMES=2
CSS="$HOME/.config/waybar/bongo-cat-frame.css"
INDEX_FILE="/tmp/bongo_cat_index"

if [[ ! -f "$INDEX_FILE" ]]; then
  echo 0 >"$INDEX_FILE"
fi

get_next_index() {
  local idx
  idx=$(<"$INDEX_FILE")
  idx=$(((idx + 1) % NUM_FRAMES))
  echo "$idx" >"$INDEX_FILE"
  echo "$idx"
}

write_css() {
  local idx="$1"
  local image="Bongo_Cat_${idx}.png"
  local ts=$(date +%s) # Use timestamp to bust the cache
  cat >"$CSS" <<EOF
  @import "/home/forest-terminal/.cache/wal/colors-waybar.css";
#custom-bongocat {
  min-width: 50px;
  min-height: 16px;
  background-image: url("file://$ASSETS/$image?ts=$ts");
  background-repeat: no-repeat;
  background-size: contain;
  background-position: center;

    margin: 10px 5px 0px 5px;
    border: 2px solid @color8;
    border-radius: 10px;
}
EOF
}

TMP_FILE=$(mktemp /tmp/waybar_bongo_cat.XXXXXX)
libinput debug-events | grep --line-buffered pressed >"$TMP_FILE" &

while inotifywait -qqe modify "$TMP_FILE"; do
  idx=$(get_next_index)
  write_css "$idx"
  : >"$TMP_FILE"
done

rm "$TMP_FILE"
