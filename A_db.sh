set -e

# Load config from file
source "./_config.sh"

# Database
docker run -d \
  --restart always \
  --network domjudge \
  --name $DATABASE_NAME \
  -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
  -e MYSQL_USER=$MYSQL_USER \
  -e MYSQL_PASSWORD=$MYSQL_PASSWORD \
  -e MYSQL_DATABASE=$MYSQL_DATABASE \
  -v $MYSQL_DATA_PATH:/var/lib/mysql \
  $([[ "$DB_EXPORT_PORT" -gt 0 ]] && echo "-p $DB_EXPORT_PORT:3306") \
  mariadb:$MARIADB_VERSION --max-connections=$MYSQL_MAX_CONNECTIONS --max_allowed_packet=$MYSQL_MAX_ALLOWED_PACKET --innodb_log_file_size=$MYSQL_INNODB_LOG_FILE_SIZE
