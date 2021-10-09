#!/bin/bash
# <bitbar.title>Dogecoin</bitbar.title>
# <bitbar.desc>Ticket for Crypto and Stock.</bitbar.desc>
# <bitbar.author>Alejandro AR</bitbar.author>
# <bitbar.author.github>kinduff</bitbar.author.github>
# <bitbar.version>1</bitbar.version>

echo "🐕 $(curl -s https://api.coinbase.com/v2/exchange-rates?currency=DOGE | jq -r '.data.rates.EUR') "
