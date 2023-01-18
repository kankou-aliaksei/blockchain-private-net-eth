# Private Blockchain Net (Ethereum)

## Description

Making a local Ethereum blockchain network using Geth (go-ethereum), Docker containers, and docker-compose, along with a visual interface for monitoring the network's state using WebSockets to get information from active nodes and then Angular to display it.

## Prerequisites

* Docker
* Docker Compose
* make

## Build

```
make build
```

## Run

```
make deploy
```

## Geth options

* **--nodekeyhex**
  <br> P2P node key as hex (for testing)
* **--nodiscover**
  <br> Disables the peer discovery mechanism (manual peer addition)
* **--ipcdisable**
  <br> Disable the IPC-RPC server
* **--bootnodes**
  <br> Comma separated enode URLs for P2P discovery bootstrap
* **--allow-insecure-unlock**
  <br> Allow insecure account unlocking when account-related RPCs are exposed by http
* **--http**
  <br> Enable the HTTP-RPC server
* **--http.addr**
  <br> HTTP-RPC server listening interface (default: "localhost")
* **--http.api**
  <br> API's offered over the HTTP-RPC interface
* **--http.corsdomain**
  <br> Comma separated list of domains from which to accept cross origin requests (browser enforced)
* **--networkid**
  <br> Explicitly set network id (integer)(For testnets: use --ropsten, --rinkeby, --goerli instead) (default: 1)
* **--netrestrict**
  <br> Restricts network communication to the given IP networks (CIDR masks)
* **--http.vhosts**
  <br> Comma separated list of virtual hostnames from which to accept requests (server enforced). Accepts '*' wildcard. (default: "localhost")
* **--mine**
  <br> Enable mining
* **--miner.threads**
  <br> Number of CPU threads to use for mining (default: 0)

## REST API

### Get accounts

```
curl --location --request POST 'localhost:8545' \
--header 'Content-Type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "id": 3,
    "method": "eth_accounts",
    "params": []
}'
```

### Unlock an account

The account can be used with eth_sign and eth_sendTransaction while it is unlocked.

```
curl --location --request POST 'http://localhost:8545' \
--header 'Content-type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "id": 6,
    "method": "personal_unlockAccount",
    "params": [
        "0x615cdc932d48b12517e269fe36e31255b601a06a",
        "g%C6XtEkfnV2uY8!",
        900
    ]
}'
```