#!/bin/sh

echo "BESU_BOOTNODES=\
enode://$(cat ./keys/validator1/enode)@100.20.5.1:30303,\
enode://$(cat ./keys/validator2/enode)@100.20.5.2:30303,\
enode://$(cat ./keys/validator3/enode)@100.20.5.3:30303,\
enode://$(cat ./keys/validator4/enode)@100.20.5.4:30303" > bootnodes.env
