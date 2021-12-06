#!/bin/bash

terrad status | jq ".SyncInfo"
