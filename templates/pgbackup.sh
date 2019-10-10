#!/bin/bash
#每月一号备份存放路径
month=/emano/pg-backup/month
#最近7天备份存放路径
day=/emano/pg-backup/day
#需要备份的数据路径
dir=/emano/postgresql
sum=`ls $day |wc -l`
sum4=`ls $month |wc -l`
#每日备份保留天数，保留7天
sum2=7
#每月备份保留天数，保留12份
sum3=12
#磁盘名
name=/dev/mapper/centos-root
#磁盘使用率
disk=`df -h |grep $name |awk -F '%' '{print $1}' | awk '{print $NF}'`
if [ $disk -gt 95 ];then
echo "磁盘空间不足,停止备份
" >> $day/pg.log
exit
else 
test -d $month  || mkdir -p $month
test -d $day  || mkdir -p $day
if [ `date +%d` -eq 1 ];then
cd `dirname $dir` && tar zcf $month/pg.`date +%F-%H-%M`.tar    `basename $dir`
  if [ $sum4 -gt $sum3 ];then
  cd $month && echo "删除备份:
  `ls -lrt |egrep -v  "total|pg.log" | awk '{print $NF}' | head -n  $[$sum4-$sum3]`
" >>pg.log
  cd $month && rm -rf  `ls -lrt |egrep -v  "total|pg.log"  | awk '{print $NF}' | head -n  $[$sum4-$sum3]`
  else
  cd $month && echo "pg.`date +%F-%H:%M`已备份
  " >>pg.log
  fi
else
cd `dirname $dir` && tar zcf $day/pg.`date +%F-%H-%M`.tar    `basename $dir`
  if [ $sum -gt $sum2 ];then
  cd $day && echo "删除备份:
  `ls -lrt |egrep -v  "total|pg.log" | awk '{print $NF}' | head -n  $[$sum-$sum2]`
" >>pg.log
  cd $day && rm -rf  `ls -lrt |egrep -v  "total|pg.log"  | awk '{print $NF}' | head -n  $[$sum-$sum2]`
  else
  cd $day && echo "pg.`date +%F-%H:%M`已备份
  " >>pg.log
  fi
fi
fi

