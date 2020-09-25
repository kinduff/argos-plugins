#!/bin/bash
# <bitbar.title>Uptime</bitbar.title>
# <bitbar.desc>Displays uptime formatted</bitbar.desc>
# <bitbar.author>Alejandro AR</bitbar.author>
# <bitbar.author.github>kinduff</bitbar.author.github>
# <bitbar.version>1</bitbar.version>

total=`uptime -p | sed -r 's/(day)(s?)/d/g; s/(hour)(s?)/h/g; s/(minute)(s?)/m/g; s/up//g; s/ //g; s/,/ /g'`

echo "🔝 ${total}"
echo "---"
echo "$(uptime -p)"
