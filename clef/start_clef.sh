#!/bin/bash

SERVER_PID_FILE=server.pid

SERVER_PID=$(cat "${SERVER_PID_FILE}");

if [ -z "${SERVER_PID}" ]; then
    echo "Process id for servers is written to location: {$SERVER_PID_FILE}"
    nohup clef --keystore /data/simo/clef/keystore --configdir /data/simo/clef --chainid 1 <<< "ok" 1>clef.log 2>&1 &
    echo $! >> ${SERVER_PID_FILE}
else
    echo "Servers are already started in this folder."
    exit 0
fi
