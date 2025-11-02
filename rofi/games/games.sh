#!/usr/bin/env sh

theme="/home/forest-terminal/.config/rofi/applets/type-3/style-2.rasi"

shapez="/home/forest-terminal/shapez.io/run.sh"
factorio="/home/forest-terminal/Downloads/Factorio_Linux/factorio/bin/x64/factorio"
prison_architect="'/home/forest-terminal/GOG Games/Prison Architect/start.sh'"
infraspace="/home/forest-terminal/InfraSpace/run.sh"
the_colonists="'/home/forest-terminal/GOG Games/The Colonists/start.sh'"
voxel_tycoon="'/home/forest-terminal/Voxel Tycoon/run.sh'"

option_1="ﴯ"
option_2=""
option_3=""
option_4="ﰎ"
option_5=""
option_6=" "

rofi_cmd() {
  rofi -theme-str "listview {columns: 7; lines: 1;}" \
    -dmenu \
    -theme ${theme}
}

run_rofi() {
  echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

run_cmd() {
  if [[ "$1" == '--opt_1' ]]; then
    ${shapez}
  elif [[ "$1" == '--opt_2' ]]; then
    ${factorio}
  elif [[ "$1" == '--opt_3' ]]; then
    ${prison_architect}
  elif [[ "$1" == '--opt_4' ]]; then
    ${infraspace}
  elif [[ "$1" == '--opt_5' ]]; then
    ${the_colonists}
  elif [[ "$1" == '--opt_6' ]]; then
    ${voxel_tycoon}
  fi
}

chosen=$(run_rofi)
case ${chosen} in
$option_1)
  run_cmd --opt_1
  ;;
$option_2)
  run_cmd --opt_2
  ;;
$option_3)
  run_cmd --opt3
  ;;
$option_4)
  run_cmd --opt_4
  ;;
$option_5)
  run_cmd --opt_5
  ;;
$option_6)
  run_cmd --opt_6
  ;;
esac
