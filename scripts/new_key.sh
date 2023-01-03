#!/bin/sh

NAME=${1}
KEY=$(openssl rand -hex 32)

rm -rf ./keys/$NAME
mkdir -p ./keys/$NAME

echo $KEY > ./keys/$NAME/key
docker run --rm --entrypoint=/bin/bash hyperledger/besu:22.10.3 -c "echo $KEY > key; besu public-key export-address --node-private-key-file=key --to=address &> /dev/null; cat address" > ./keys/$NAME/address
docker run --rm --entrypoint=/bin/bash hyperledger/besu:22.10.3 -c "echo $KEY > key; besu public-key export --node-private-key-file=key --to=enode &> /dev/null; cat enode | cut -c 3-" > ./keys/$NAME/enode
