#!/bin/sh

echo "BESU_BOOTNODES=\
enode://$(cat ./keys/validator1/enode)@127.0.0.1:30301,\
enode://$(cat ./keys/validator2/enode)@127.0.0.1:30302,\
enode://$(cat ./keys/validator3/enode)@127.0.0.1:30303,\
enode://$(cat ./keys/validator4/enode)@127.0.0.1:30304" > bootnodes.env
