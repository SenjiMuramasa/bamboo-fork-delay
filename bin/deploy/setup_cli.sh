#!/usr/bin/env bash

distribute(){
    SERVER_ADDR=(`cat clients.txt`)
    for (( j=1; j<=$1; j++))
    do
       ssh -t $2@${SERVER_ADDR[j-1]} mkdir /home/wmj/Desktop/bamboo-fork-delay
       echo -e "---- upload client ${j}: $2@${SERVER_ADDR[j-1]} \n ----"
       scp client ips.txt config.json runClient.sh closeClient.sh $2@${SERVER_ADDR[j-1]}:/home/wmj/Desktop/bamboo-fork-delay
       ssh -t $2@${SERVER_ADDR[j-1]} chmod 777 /home/wmj/Desktop/bamboo-fork-delay/bin/deploy/runClient.sh
       ssh -t $2@${SERVER_ADDR[j-1]} chmod 777 /home/wmj/Desktop/bamboo-fork-delay/bin/deploy/closeClient.sh
       wait
    done
}

USERNAME='wmj'
MAXPEERNUM=(`wc -l clients.txt | awk '{ print $1 }'`)

# distribute files
distribute $MAXPEERNUM $USERNAME
