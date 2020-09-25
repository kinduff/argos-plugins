#!/bin/bash
# <bitbar.title>Wakatime</bitbar.title>
# <bitbar.desc>Displays time spent today from the Wakatime API</bitbar.desc>
# <bitbar.author>Alejandro AR</bitbar.author>
# <bitbar.author.github>kinduff</bitbar.author.github>
# <bitbar.version>1</bitbar.version>

function displaytime {
  local T=$1
  (( $T == 0 )) && printf '0m' && return
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  (( $D > 0 )) && printf '%dd ' $D
  (( $H > 0 )) && printf '%dh ' $H
  (( $M > 0 )) && printf '%dm' $M
}

today=`date +%F`
api_key=`awk -F'[ ="]+' '$1 == "api_key" { print $2 }' $HOME/.wakatime.cfg`
endpoint="https://wakatime.com/api/v1/users/current/durations?date=${today}&api_key=${api_key}"
total=`curl --silent $endpoint | jq '[.data[].duration] | add' || echo 0`

echo "🐴 Coding: $(displaytime ${total%.*})"
echo "---"
echo "Open Dashboard | href=https://wakatime.com/dashboard"
