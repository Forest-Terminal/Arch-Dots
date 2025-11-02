#!/usr/bin/env bash

source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

list_col='2'
list_row='1'

main_cmd='zen-browser'
private_cmd='librewolf'

option_2=""
option_1="󰈹"

rofi_cmd() {
  rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
    -theme-str 'textbox-prompt-colon {str: " ";}' \
    -dmenu \
    -p "Browsers" \
    -mesg "" \
    -u '1' \
    -markup-rows \
    -theme ${theme}
}

run_rofi() {
  echo -e "$option_1\n$option_2" | rofi_cmd
}

run_cmd() {
  if [[ "$1" == '--opt1' ]]; then
    ${private_cmd}
  elif [[ "$1" == '--opt2' ]]; then
    ${main_cmd}
  fi
}

chosen="$(run_rofi)"
case ${chosen} in
$option_1)
  run_cmd --opt1
  ;;
$option_2)
  run_cmd --opt2
  ;;
esac
