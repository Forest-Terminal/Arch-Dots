#!/bin/bash
clear
read -p "Session time: " Time
read -p "Break time: " Break
read -p "Amount of sessions: " Session
clear
echo "Starting $Session sessions with each being $Time minutes with $Break minutes of break time."
read -p "Ok? (<C-c> to kill)"
tomatoshell -t $Time -d $Break -n $Session -f
