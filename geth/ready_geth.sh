#!/bin/bash

geth \
	--datadir /data/simo/mainnet_fast \
	--syncmode snap \
	--port 30303 \
	--http \
	--http.addr 0.0.0.0 \
	--http.api="eth,net,web3,engine,admin" \
	--http.port=8545 \
	--authrpc.addr localhost \
	--authrpc.port 8551 \
	--authrpc.vhosts localhost \
	--authrpc.jwtsecret /data/simo/consensus/prysm/jwt.hex \
	--signer /data/simo/clef/clef.ipc \
	dumpconfig > mainnet_pos.toml

