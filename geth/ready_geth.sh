
DIRPATH=/data/eth

/bin/geth --datadir ${DIRPATH}/geth --syncmode snap --port 30303 --http --http.addr 0.0.0.0 --http.api="eth,net,web3,engine,admin" --http.port=8545 --authrpc.addr localhost --authrpc.port 8551 --authrpc.vhosts localhost --authrpc.jwtsecret ${DIRPATH}/consensus/jwt.hex --signer ${DIRPATH}/clef/clef.ipc dumpconfig > mainnet.toml

