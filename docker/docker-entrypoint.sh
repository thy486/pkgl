#!/bin/bash
set -e


bash $PKGL_DIR/shell/MariaDB/startup.sh \

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- node "$@"
fi
exec "$@"
