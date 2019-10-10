#!/bin/bash
set -e
 docker node update --label-add role=emano websrv1
 docker node update --label-add role=emano websrv2
 docker node update --label-add role=nfvo appsrv1
 docker node update --label-add role=nfvo appsrv2
 docker node update --label-add role=pkg imagesrv
 docker node update --label-add role=db   dbsrv1
 docker node update --label-add role=db   dbsrv2
 docker node update --label-add role=alarms  intersrv
 docker node update --label-add type=cad8 dbsrv2
 
#部署emano-nfvo应用
 docker stack deploy -c /docker-swarm/nfvo/postgres.yml emano
sleep 30
 docker stack deploy -c /docker-swarm/nfvo/visualizer.yml emano
sleep 30
 docker stack deploy -c /docker-swarm/nfvo/cig.yml  cig
sleep 130
 docker stack deploy -c /docker-swarm/nfvo/auth.yml emano
sleep 60
 docker stack deploy -c /docker-swarm/nfvo/elk.yml emano
sleep 160
 docker stack deploy -c /docker-swarm/nfvo/nfvo.yml emano
sleep 120
 docker stack deploy -c /docker-swarm/nfvo/pkg.yml emano
sleep 50
 docker stack deploy -c /docker-swarm/nfvo/tosca.yml emano
sleep 50
 docker stack deploy  -c /docker-swarm/nfvo/sftp.yml emano
#部署emano-alarms应用
sleep 50
 docker stack deploy -c /docker-swarm/alarms/zookeeper.yml alarms
sleep 180
 docker stack deploy -c /docker-swarm/alarms/umc.yml alarms
sleep 150
 docker stack deploy -c /docker-swarm/nfvo/nginx.yml emano
