#!/bin/bash
# <bitbar.title>Services Status</bitbar.title>
# <bitbar.desc>Shows status of a selection of services from statuspage.io: Github, npm, RubyGems, and Cloudinary.</bitbar.desc>
# <bitbar.author>Alejandro AR</bitbar.author>
# <bitbar.author.github>kinduff</bitbar.author.github>
# <bitbar.version>1</bitbar.version>

status_urls=(
  https://kctbh9vrtdwd.statuspage.io/api/v2/status.json # Github
  https://wyvgptkd90hm.statuspage.io/api/v2/status.json # npm
  https://pclby00q90vc.statuspage.io/api/v2/status.json # RubyGems
  https://d8rszhl2bj7r.statuspage.io/api/v2/status.json # Cloudinary
)
top_status=()
bottom_status=()

for status_url in ${status_urls[@]}; do
  request=`curl $status_url`
  status=`echo ${request} | grep "All Systems Operational" | wc -l`
  name=`echo ${request} | jq -r '.page.name'`
  url=`echo ${request} | jq -r '.page.url'`
  description=`echo ${request} | jq -r '.status.description'`
  icon="🟢"

  [[ "$status" -eq 0 ]] && icon="🔴"

  top_status+=("${icon}")
  bottom_status+=("${icon} ${name} - ${description} | href='${url}'")
done

printf '%s ' "${top_status[@]}"
echo
echo "---"
printf '%s\n' "${bottom_status[@]}"
