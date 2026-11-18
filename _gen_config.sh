#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

EXAMPLE="_config.example.sh"
TARGET="_config.sh"

if [[ -e "$TARGET" ]]; then
  echo "$TARGET already exists, skip."
  exit 0
fi

gen_password() {
  # Alphanumeric only: values are used unquoted in `docker run -e`
  LC_ALL=C tr -dc 'A-Za-z0-9' </dev/urandom | head -c 32 || true
}

umask 077

sed \
  -e "s|^MYSQL_ROOT_PASSWORD=\"@@CHANGE_ME@@\"|MYSQL_ROOT_PASSWORD=\"$(gen_password)\"|" \
  -e "s|^MYSQL_PASSWORD=\"@@CHANGE_ME@@\"|MYSQL_PASSWORD=\"$(gen_password)\"|" \
  -e "s|^JUDGEDAEMON_PASSWORD=\"@@CHANGE_ME@@\"|JUDGEDAEMON_PASSWORD=\"$(gen_password)\"|" \
  "$EXAMPLE" >"$TARGET"

echo "Generated $TARGET (mode 600)."
echo "TODO:"
echo "  - Set DOMSERVER_DOMAIN / TRAEFIK_DOMSERVER_MODE if using Traefik"
echo "  - After B_domserver.sh, set the 'judgehost' user's password in domserver to JUDGEDAEMON_PASSWORD"
