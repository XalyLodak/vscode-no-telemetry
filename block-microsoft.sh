#!/bin/bash
DOMAINS=(
    rink.hockeyapp.net
    default.exp-tas.com
    vortex.data.microsoft.com
    dc.services.visualstudio.com
)

for d in "${DOMAINS[@]}"; do
    ip=$(dig +short $d | tail -n1)
    if [ -n "$ip" ]; then
         sudo ufw deny out to $ip
         echo "Bloqué $d ($ip)"
    fi
done
