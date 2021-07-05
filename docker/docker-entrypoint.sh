#!/bin/bash
cd $PKGL_DIR && pm2 start pkgl.json
exec /usr/bin/mysqld --user=root --console
