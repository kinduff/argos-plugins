#!/bin/bash
# <bitbar.title>CPU Usage</bitbar.title>
# <bitbar.desc>Displays CPU usage on average with colors and all cores</bitbar.desc>
# <bitbar.author>Alejandro AR</bitbar.author>
# <bitbar.author.github>kinduff</bitbar.author.github>
# <bitbar.version>1</bitbar.version>

function formatAvg () {
  if (( $(echo "$1 > 70" | bc -l) )); then
    color="#cc575d"
  elif  (( $(echo "$1 > 50" | bc -l) )); then
    color="#d19a66"
  else
    color="#68b382"
  fi

  printf "<span color='%s'>%.2f%%</span>" $color "$1"
}

allCores=$(top -bn1 | grep "Cpu" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
avg=$(echo "$allCores" | jq -s add/length)

echo "CPU: $(formatAvg "$avg")"
echo "---"
INDEX=1
for i in $allCores; do
  echo "Core $INDEX: $(formatAvg "$i")"
  (( INDEX++ ))
done
echo "---"
echo "System monitor | iconName=utilities-system-monitor-symbolic bash=gnome-system-monitor terminal=false"
