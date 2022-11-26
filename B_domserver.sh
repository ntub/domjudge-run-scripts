set -e

# Load config from file
source "./_config.sh"

# Domserver
docker run -it -d \
  --restart always \
  --network domjudge \
  --name $DOMSERVER_NAME \
  -e CONTAINER_TIMEZONE=$TIMEZONE \
  -e MYSQL_HOST=$DATABASE_NAME \
  -e MYSQL_USER=$MYSQL_USER \
  -e MYSQL_DATABASE=$MYSQL_DATABASE \
  -e MYSQL_PASSWORD=$MYSQL_PASSWORD \
  -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
  -e FPM_MAX_CHILDREN=$FPM_MAX_CHILDREN \
  -e TRUSTED_PROXIES=0.0.0.0/0 \
  -p 80:80 \
  domjudge/domserver:$DOMJUDGE_VERSION
