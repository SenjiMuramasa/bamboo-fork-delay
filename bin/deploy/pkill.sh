#!/usr/bin/env bash

kill_all_servers(){
    SERVER_ADDR=(`cat public_ips.txt`)
    j=0
    for data in ${SERVER_ADDR[@]}
    do
       let j+=1
       ssh -t $1@${data} "echo ---- "success kill node ${j}" --- && pkill server ; rm /home/zhoushuai/bamboo/server.pid"
    done
}

# NOTE!!!
USERNAME="zhoushuai"

# distribute files
kill_all_servers  $USERNAME
