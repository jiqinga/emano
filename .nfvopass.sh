#!/bin/bash
docker ps | grep emano_postgre &>/dev/null
if [ $? -eq 0 ];then
expect <<EOF
spawn docker exec -it `docker ps -q --filter name=emano_postgre` bash
expect "#"   {send "psql -U postgres\n"}
expect "=#"  {send "alter user ossadmin  with password 'BrT3!xtb';\n"}
expect "=#"  {send "exit;\n"}
EOF
else
exit 0
fi

