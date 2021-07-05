#!/bin/bash
set -e


if [[ $ISOLD ]]; then
  bash $PKGL_DIR/shell/MariaDB/startup.sh
else
  nohup /usr/bin/mysqld --user=root > /dev/null &
fi

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- node "$@"
fi
exec "$@"
