# Hyperledger Besu QBFT network

This repository contains all the configutations and instructions to bootstrap a Besu blockchain network with QBFT consensus protocol.

Current network configuration consists on 4 validator nodes, disposed in a $K_4$ graph network topology, with the following properties:

- Block time of 3s, and 9s of timeout for each validation round
- Block reward of 5 ETH that decreases exponentially every year until leaving no block reward on the 10th year
- On-chain validator election, requiring more than the 66% of the votes of current validators to add a new one or remove an existing one
- On-chain permissioning for network nodes and wallet addresses

## Generating the keys for the nodes

We can generate the keys for the nodes using the script `new_key.sh` from the `scripts` directory.

```sh
./scripts/new_key.sh validator1
./scripts/new_key.sh validator2
./scripts/new_key.sh validator3
./scripts/new_key.sh validator4
```

After executing the previous commands the keys (private key, address and enode) for each node can be found in a directory with the node's name inside the newly created `keys` directory.
