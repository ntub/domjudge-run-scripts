set -e

# Load config from file
source "./_config.sh"

# Domserver
docker run -it -d \
  --name domserver \
  --restart $DOCKER_RESTART \
  --network domserver_internal \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  -e CONTAINER_TIMEZONE=$TIMEZONE \
  -e MYSQL_HOST=$MYSQL_HOST \
  -e MYSQL_USER=$MYSQL_USER \
  -e MYSQL_DATABASE=$MYSQL_DATABASE \
  -e MYSQL_PASSWORD=$MYSQL_PASSWORD \
  -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
  -e FPM_MAX_CHILDREN=$FPM_MAX_CHILDREN \
  -p 80:80 \
  domjudge/domserver:$DOMJUDGE_VERSION
