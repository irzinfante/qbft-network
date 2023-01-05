echo "NODE_INGRESS_CONTRACT_ADDRESS=0x0000000000000000000000000000000000009999"
echo "ACCOUNT_INGRESS_CONTRACT_ADDRESS=0x0000000000000000000000000000000000008888"
echo "BESU_NODE_PERM_ACCOUNT=$(cat ./keys/validator1/address | cut -c 3-)"
echo "BESU_NODE_PERM_KEY=$(cat ./keys/validator1/key)"
echo "BESU_NODE_PERM_ENDPOINT=http://127.0.0.1:8545"
echo "CHAIN_ID=1522"
echo "INITIAL_ADMIN_ACCOUNTS=\
$(cat ./keys/validator1/address),\
$(cat ./keys/validator2/address),\
$(cat ./keys/validator3/address),\
$(cat ./keys/validator4/address)"
echo "INITIAL_ALLOWLISTED_ACCOUNTS=\
$(cat ./keys/validator1/address),\
$(cat ./keys/validator2/address),\
$(cat ./keys/validator3/address),\
$(cat ./keys/validator4/address)"
echo "INITIAL_ALLOWLISTED_NODES=\
enode://$(cat ./keys/validator1/enode)@127.0.0.1:30301,\
enode://$(cat ./keys/validator2/enode)@127.0.0.1:30302,\
enode://$(cat ./keys/validator3/enode)@127.0.0.1:30303,\
enode://$(cat ./keys/validator4/enode)@127.0.0.1:30304"
