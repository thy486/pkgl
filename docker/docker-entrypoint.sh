#!/bin/bash
cd $PKGL_DIR/.pkgl && pm2 start pkgl.json mysql.json
exec /usr/bin/mysqld --user=root --console
