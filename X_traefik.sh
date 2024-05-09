set -e

# Load config from file
source "./_config.sh"

docker run -d \
    --restart always \
    --network domjudge \
    --name domjudge_rproxy \
    -v ./traefik/traefik.yml:/etc/traefik/traefik.yml:ro \
    -v ./traefik/config:/etc/traefik/config:ro \
    -v ./ssl:/etc/traefik/ssl:ro \
    -p 80:80 \
    -p 443:443 \
    -e DOMSERVER_DOMAIN=$DOMSERVER_DOMAIN \
    traefik:v3.0