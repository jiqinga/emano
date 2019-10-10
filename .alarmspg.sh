#!/bin/bash
docker ps | grep alarms_postgre &>/dev/null
if [ $? -eq 0 ];then
expect <<EOF
spawn docker exec -it `docker ps -q --filter name=alarms_postgre` bash
expect "#"   {send "psql -U postgres\n"}
expect "=#"  {send "alter user umc  with password '12%o3y#O';\n"}
expect "=#"  {send "create database holmes;\n"}
expect "=#"  {send "create user holmes with password  'holmes';\n"}
expect "=#"  {send "GRANT ALL PRIVILEGES ON DATABASE holmes TO holmes;\n"}
expect "=#"  {send "exit"}
EOF
else
exit 0
fi
