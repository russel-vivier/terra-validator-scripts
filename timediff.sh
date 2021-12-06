#!/bin/bash

LATEST=$(date -d "$(terrad status | jq -r ".SyncInfo.latest_block_time")" "+%s")
NOW=$(date "+%s")
DIFF=$(echo "$NOW-$LATEST" | bc)
echo $DIFF
