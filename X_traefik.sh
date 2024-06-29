set -e

# Load config from file
source "./_config.sh"

docker run -d \
    --restart always \
    --network domjudge \
    --name domjudge_rproxy \
    -v ./traefik/traefik.yml:/etc/traefik/traefik.yml:ro \
    -v ./traefik/config/domserver-$TRAEFIK_DOMSERVER_MODE.yml:/etc/traefik/config/domserver.yml:ro \
    -v ./traefik/ssl:/etc/traefik/ssl:ro \
    -v ./traefik/acme:/etc/traefik/acme \
    -p 80:80 \
    -p 443:443 \
    -e DOMSERVER_DOMAIN=$DOMSERVER_DOMAIN \
    traefik:v$TRAEFIK_VERSION
