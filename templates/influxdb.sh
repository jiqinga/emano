#!/bin/bash
curl  -X POST http://$1:8086/query?q=CREATE+RETENTION+POLICY+%22cadvisor%22+ON+%22cadvisor%22+DURATION+15d+REPLICATION+1+DEFAULT&db=cadvisor
curl -X POST http://$1:8086/query?q=drop+retention+POLICY+%22autogen%22+ON+%22cadvisor%22&db=cadvisor
