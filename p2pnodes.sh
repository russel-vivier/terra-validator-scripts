#!/bin/bash

curl -s http://localhost:26657/net_info | grep moniker | wc -l
