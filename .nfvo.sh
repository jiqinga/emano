#!/bin/bash
for i in nfvo auth 
do
docker ps | grep $i &>/dev/null
if [ $? -eq 0 ];then
echo $i
expect <<EOF
set timeout 300
spawn docker exec -it `docker ps -q -f name=$i | head -1`   bash
expect "#"  {send "rake db:migrate RAILS_ENV=production\n"}
expect "#"  {send "rake db:seed RAILS_ENV=production\n"}
expect "#"  {send "exit"}
EOF
else
echo $i
fi
done
exit 0

