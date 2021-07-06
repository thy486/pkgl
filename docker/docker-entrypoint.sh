#!/bin/bash
cd $PKGL_DIR/.pkgl && pm2 start pkgl.json
exec /usr/bin/mysqld --user=root --console
