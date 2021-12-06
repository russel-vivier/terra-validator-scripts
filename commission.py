#!python3

import subprocess
import json

res = subprocess.run('terrad query distribution commission --chain-id $CHAIN_ID $VALOPER -o json | jq ".commission"', shell=True, capture_output=True)
commission = json.loads(res.stdout.decode('utf-8'))

res = subprocess.run('terrad query oracle exchange-rates -o json | jq ".exchange_rates"', shell=True, capture_output=True)
rates_raw = json.loads(res.stdout.decode('utf-8'))
rates = dict()
for rate in rates_raw:
    rates[rate['denom']] = float(rate['amount'])

total_uluna = 0.0
for comm in commission:
    if '/' in comm['denom']:
        print("Do not account for " + comm['denom'])
        continue
    if comm['denom'] == 'uluna':
        total_uluna += float(comm['amount'])
        print("Adding " + str(round(float(comm['amount']),2)) + " " + comm['denom'])
        continue
    total_uluna += float(comm['amount']) / rates[comm['denom']]
    print("Adding " + str(round(float(comm['amount']),2)) + ' ' + comm['denom'] + ' = ' + str(round(float(comm['amount']) / rates[comm['denom']],2)) + ' uluna')

print(' ')
print("TOTAL: " + str(round(total_uluna/1000000,2)) + " Luna")
