#!/usr/bin/env bash
set -euo pipefail

# Load config from file
source "./_config.sh"

docker run -d \
    --restart always \
    --network domjudge \
    --name domjudge_rproxy \
    -v ./caddy/Caddyfile:/etc/caddy/Caddyfile:ro \
    -v ./docs:/docs:ro \
    -p 80:80 \
    caddy:$CADDY_VERSION
