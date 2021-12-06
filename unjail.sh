#!/bin/bash

if [ $(terrad status | jq -r ".SyncInfo.catching_up") != 'false' ]
then
    echo -e '\033[0;31mThe node is still catching up, wait until it is done\033[0m'
    exit 1
fi

terrad tx slashing unjail --chain-id $CHAIN_ID --from $VALIDATOR_WALLET --gas-prices 170ukrw --gas auto --gas-adjustment 1.2
