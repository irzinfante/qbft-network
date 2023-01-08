# Hyperledger Besu QBFT network

This repository contains all the configutations and instructions to bootstrap a Besu blockchain network with QBFT consensus protocol.

Current network configuration consists on 4 validator nodes, disposed in a $K_4$ graph network topology, with the following properties:

- Block time of 3s, and 9s of timeout for each validation round
- Block reward of 5 ETH that decreases exponentially every year until leaving no block reward on the 10th year
- On-chain validator election, requiring more than the 66% of the votes of current validators to add a new one or remove an existing one
- On-chain permissioning for network nodes and wallet addresses

In this repository we use Besu 22.10.3, in its dockerized version. To get the Besu docker image execute

```sh
docker pull hyperledger/besu:22.10.3
```

## Generating the keys for the nodes

We can generate the keys for the nodes using the script `new_key.sh` from the `scripts` directory.

```sh
./scripts/new_key.sh validator1
./scripts/new_key.sh validator2
./scripts/new_key.sh validator3
./scripts/new_key.sh validator4
```

After executing the previous commands the keys (private key, address and enode) for each node can be found in a directory with the node's name inside the newly created `keys` directory.

## Completing the genesis file

Network's genesis file, `genesis.json`, needs to be completed as it lacks the bytecode (`<Contract Code>`) and the storage values (`<Storage Object>`) for the validator smart contract.

To obtain this missing information we must follow the instructions from sections [Compiling the contract for deployment](https://github.com/irzinfante/validator-smart-contracts#compiling-the-contract-for-deployment) and [Create the genesis file content](https://github.com/irzinfante/validator-smart-contracts#create-the-genesis-file-content) from the https://github.com/irzinfante/validator-smart-contracts repository.

- **NOTE:** The content of the file `initialValidators.txt` can be generated running `./scripts/initialValidators.sh`

## Getting up the network

To get up the network we must start the nodes as services from the `docker-compose.yaml` file. Before that, to generate the content for the bootnodes option of Besu, we run the script

```sh
./scripts/bootnodes.sh
```

which generates the file `bootnodes.env` with the needed configuration.

Now we can get up the network with

```sh
docker-compose up -d
```
To check the status of the network we can use the RPC API of the `validator1` node at `http://127.0.0.1:8545`.

### Sirato explorer

To get up the network packed with the [Sirato explorer from Web3 Labs](https://www.web3labs.com/sirato) execute instead the following command:

```sh
docker-compose -f docker-compose_sirato.yaml up -d
```

The explorer's dashboard will be abailable at `http://localhost/` after the initialization of all the services.

### Blockscout explorer

To get up the network packed with the [Blockscout explorer](https://www.blockscout.com/) execute instead the following command:

```sh
docker-compose -f docker-compose_blockscout.yaml up -d
```

The explorer's dashboard will be abailable at `http://localhost/` after the initialization of all the services.

## Compiling and deploying premissioning smart contracts

We can compile the accounts and nodes permissioning smart contracts following the instruccion from the https://github.com/irzinfante/permissioning-smart-contracts repository, which also makes references to the official Besu documentation.

To generate the content of the `.env` file for the [Deploying the contracts](https://github.com/irzinfante/permissioning-smart-contracts#deploying-the-contracts) step, we execute the following script in THIS repository:

```sh
./scripts/permissioning-smart-contracts.sh
```
