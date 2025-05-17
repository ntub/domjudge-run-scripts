set -e

# Load config from file
source "./_config.sh"

INDEX=$1

# Judgehost
docker run -d \
  --restart always \
  --privileged \
  --name judgehost_$INDEX \
  $([[ "$JUDGEHOST_USE_INTERNAL_NETWORK" -eq 1 ]] && echo "--network domjudge_internal" || echo "--network domjudge") \
  --hostname judgehost \
  -v /sys/fs/cgroup:/sys/fs/cgroup \
  -e CONTAINER_TIMEZONE=$TIMEZONE \
  -e DAEMON_ID=$INDEX \
  -e DOMSERVER_BASEURL=$DOMSERVER_BASEURL \
  -e JUDGEDAEMON_USERNAME=$JUDGEDAEMON_USERNAME \
  -e JUDGEDAEMON_PASSWORD=$JUDGEDAEMON_PASSWORD \
  ntubapp/judgehost:$DOMJUDGE_VERSION
