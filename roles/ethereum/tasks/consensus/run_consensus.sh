
#!/bin/bash

SERVER_PID_FILE=server.pid
DIRPATH=/data/eth
SERVER_PID=$(cat "${SERVER_PID_FILE}");

if [ -z "${SERVER_PID}" ]; then
    echo "Process id for servers is written to location: {$SERVER_PID_FILE}"

    nohup ./prysm.sh beacon-chain \
        --execution-endpoint=http://localhost:8551 \
        --jwt-secret=${DIRPATH}/consensus/jwt.hex \
        --suggested-fee-recipient=0xb1E7168dd058Bf7AECcf1D5BD1fA0ad0e4D065F6 \
	--grpc-gateway-port 3510 \
	--rpc-port 4010 \
	--datadir=${DIRPATH}/consensus/.eth2 \
        --accept-terms-of-use 1>consensus.log 2>&1 &
    echo $! >> ${SERVER_PID_FILE}
else
    echo "Servers are already started in this folder."
    exit 0
fi


