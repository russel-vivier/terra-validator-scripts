#!/bin/bash

echo "----"

HEIGHT1=$(timeout 10s terrad status | jq ".SyncInfo.latest_block_height")

if [ $? -ne 0 ]
then
    # terrad is erroring out or not giving a proper json
    # restart terrad and exit
    echo "TERRAD IS UNRESPONSIVE, RESTARTING THE NODE"
    systemctl restart terrad.service
    exit 0
fi

sleep 3m

HEIGHT2=$(timeout 10s terrad status | jq ".SyncInfo.latest_block_height")

if [ $? -ne 0 ]
then
	# again, restart and exit
	echo "TERRAD IS UNRESPONSIVE, RESTARTING THE NODE"
	systemctl restart terrad.service
	exit 0
fi

if [ $HEIGHT2 == $HEIGHT1 ]
then
    # terrad is stuck
    echo "THE NODE SEEMS TO BE STUCK, RESTARTING"
    systemctl restart terrad.service
    exit 0
fi

echo "NODE OK"
