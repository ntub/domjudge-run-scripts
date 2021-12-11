docker exec -it domserver cat /opt/domjudge/domserver/etc/restapi.secret | grep default | awk '{{ print $4 }}'
