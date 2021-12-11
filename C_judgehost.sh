set -e

# Load config from file
source "./_config.sh"

INDEX=$1

# Judgehost
docker run -it -d \
  --privileged \
  --name judgehost_$INDEX \
  --restart $DOCKER_RESTART \
  --hostname judgehost-$INDEX \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  -e CONTAINER_TIMEZONE=$TIMEZONE \
  -e DAEMON_ID=$INDEX \
  -e DOMSERVER_BASEURL=$DOMSERVER_BASEURL \
  -e JUDGEDAEMON_USERNAME=$JUDGEDAEMON_USERNAME \
  -e JUDGEDAEMON_PASSWORD=$JUDGEDAEMON_PASSWORD \
  ntubapp/judgehost:$DOMJUDGE_VERSION
