# Terra Validator Scripts

Some scripts that are useful when you are running a validator on Terra blockchain.

## Scripts
- `status.sh` - show current synchronization status
- `syncspeed.sh` - what is the current rate of downloading blocks. If the node is in sync, it should be `x1`. If the node is behind and actively syncing, it will be somewhere around `x5–x10`. **WARNING**: running this script takes 10 minutes.
- `timediff.sh` - time difference (in seconds) between our latest block and current time. If your node is in sync, it should be within 20 seconds. If the node is out of sync, output of `timediff.sh` and `syncspeed.sh` can tell you how much time you need to catch up.
- `unjail.sh` - unjails your validator. Checks that the node is in sync before sending the transaction.
- `p2pnodes.sh` - prints how many other nodes you are currently connected to.
- `commission.py` - how much total commission your node has earned (converted to Luna for easier assessment).
- `claim.sh` - claim all commission.
- `stuck.sh` - If the node for some reason doesn't sync (current block height doesn't change in 3 minutes) or is unresponsive, it restarts the node. Add this to cron to run every 5-10-30 minutes. **WARNING**: needs to be run as `root` as it uses `systemctl`.

## Requirements
- `python3`
- `jq`
- `terrad` is on `$PATH`

Following env vars are expected to be declared (add this to your `.profile`/`.bashrc`):

- `export VALOPER='terravaloper1xxxxxxxxxxx'`
- `export CHAIN_ID='bombay-12/columbus-5'`
- `export VALIDATOR_WALLET='terra1xxxxxxxxx'`

Substitute the `xxxxx`'s with your validator addres and the associated wallet.

<sup>*Don't forget to delegate to [LambdaCore](https://station.terra.money/validator/terravaloper1mgdsc0get3w984h03a02zy6gmg3kgqtfqs3tky)!*</sup>