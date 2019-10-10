#emano部署前准备

1.harbor镜像仓库启动

2.修改/etc/hosts文件 (如下:)
182.10.1.162 websrv1
182.10.1.163 websrv2
182.10.1.164 appsrv1
182.10.1.165 appsrv2
182.10.1.166 imagesrv
182.10.1.167 intersrv
182.10.1.168 dbsrv1
182.10.1.169 dbsrv2
182.10.1.162 images  #harbor镜像库解析

3.修改/etc/ansible/roles/docker-swarm/defaults/main.yml
swarm_master: '182.10.1.162'   #只需替此ip为master1 IP

4.修改/etc/ansible/roles/emano/defaults/main.yml
harbor_port: 'images:88'    #harbor镜像库地址,images对应上面hosts文件解析
work3: '182.10.1.167'       #填写intersrv IP地址
master3: '182.10.1.164'     #填写appsrv1 IP地址
appsrv2: '182.10.1.165'     #填写appsrv2 IP地址
seqvalue: '1000'            #nfvo,auth库序列值
dbsrv1: '182.10.1.110'      #填写dbsrv1 IP地址


5.修改/etc/ansible/hosts
ansible_user=root           #虚拟机用户名
ansible_password=password   #虚拟机密码

6.主机测试
ansible  all  -m ping    #无报错即可

7.开始部署
cd /etc/ansible  && ansible-playbook emano.yml    #等待执行完毕

8.初始化nfvo，alarms库
docker service ls      #执行命令查看服务都正常运行后才可执行下放命令
cd /etc/ansible  && ansible-playbook init.yml

9.密码信息删除
vim  /etc/ansible/hosts
ansible_password=password   #建议删除虚拟机密码

10.访问
http://master/emano

11.导入grafana模板文件
文件位置   master节点  /docker-swarm/config/alarms.json
系统监控 ---> 容器监控 


12.vim测试URL
 curl -i -X POST http://172.16.6.61（vim ip）:8001/v3/auth/tokens -H "Content-type: application/json" -d  '{"auth":{"identity":{"methods":["password"],"password":{"user":{"password":"1qaz@WSX（密码）","domain":{"id":"Default"},"name":"NFVOZJGY（用户名）"}}},"scope":{"project":{"name":"NFVPEMANO（租户）","domain":{"id":"Default"}}}}}'
 配置vim时注意厂商不要填错
