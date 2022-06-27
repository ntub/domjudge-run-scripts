set -e

# Load config from file
source "./_config.sh"

# Database
docker run -it -d \
  --name $MYSQL_HOST \
  --restart $DOCKER_RESTART \
  --network domserver_internal \
  -v $MYSQL_DATA_PATH:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
  -e MYSQL_USER=$MYSQL_USER \
  -e MYSQL_PASSWORD=$MYSQL_PASSWORD \
  -e MYSQL_DATABASE=$MYSQL_DATABASE \
  mariadb:10.7 --max-connections=$MYSQL_MAX_CONNECTIONS --max_allowed_packet=$MYSQL_MAX_ALLOWED_PACKET --innodb_log_file_size=$MYSQL_INNODB_LOG_FILE_SIZE
