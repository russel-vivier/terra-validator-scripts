#!/bin/bash

terrad tx distribution withdraw-rewards $VALOPER --chain-id $CHAIN_ID --from $VALIDATOR_WALLET --commission --gas-prices 170ukrw --gas auto --gas-adjustment 1.2
