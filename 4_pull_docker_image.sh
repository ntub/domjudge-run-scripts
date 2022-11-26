set -e

source "./_config.sh"

echo "mariadb:$MARIADB_VERSION"
docker pull mariadb:$MARIADB_VERSION

echo "domjudge/domserver:$DOMJUDGE_VERSION"
docker pull domjudge/domserver:$DOMJUDGE_VERSION

echo "ntubapp/judgehost:$DOMJUDGE_VERSION"
docker pull ntubapp/judgehost:$DOMJUDGE_VERSION
