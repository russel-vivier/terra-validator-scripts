#!/bin/bash

WAIT="600s"

UT1=$(date -d "$(terrad status | jq -r ".SyncInfo.latest_block_time")" "+%s")

sleep $WAIT

UT2=$(date -d "$(terrad status | jq -r ".SyncInfo.latest_block_time")" "+%s")

RATIO=$(echo "($UT2-$UT1)/600" | bc)

echo "x$RATIO"
