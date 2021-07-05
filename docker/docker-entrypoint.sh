#!/bin/bash
set -e

nohup /usr/bin/mysqld --user=root > /dev/null &

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- node "$@"
fi
exec "$@"
