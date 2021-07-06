#!/bin/bash
replace_env (){
  # $1原始内容 $2原变量 $3新变量 $4文件地址
  local line=$(grep -n "$1" $4 | cut -d ":" -f 1)
  local old_line=$(echo $(grep -m 1 "$1" $4))
  local new_line=$(echo $old_line | sed "s#$2#$3#")
  sed -i "s#$old_line#$new_line#" $4 && echo "文件$4 的第$line行中的 $2 已更改为 $3"
}

/usr/bin/expect <<-EOF
  spawn mysql
  expect "*>*"
  send "SOURCE $PKGL_DIR/shell/MariaDB/script.sql;\r"
  expect "*>*"
  send "set password for root@localhost = password('1');\r"
  expect "*>*"
  send "quit;\r"
EOF