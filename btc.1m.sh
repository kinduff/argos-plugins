#!/bin/bash
# <bitbar.title>BTC</bitbar.title>
# <bitbar.desc>Ticket for Crypto and Stock.</bitbar.desc>
# <bitbar.author>Alejandro AR</bitbar.author>
# <bitbar.author.github>kinduff</bitbar.author.github>
# <bitbar.version>1</bitbar.version>

echo "💎 $(curl -s https://api.coinbase.com/v2/exchange-rates?currency=BTC | jq -r '.data.rates.EUR')"
