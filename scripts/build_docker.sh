#!/bin/sh
VERSION_STR="1.7.0"
IMAGE_NAME="eosforce/testnet:v$VERSION_STR"
DEFAULT_EOSFORCE_ROOT="$HOME/Projects/eosforce/eosforce"
HTTP_PROXY=""

EOSFORCE_ROOT=${EOSFORCE_ROOT}
if [ "$EOSFORCE_ROOT" != "" ]; then
   printf "EOSForce root path : %s\\n" $EOSFORCE_ROOT
else
   printf "No Found EOSFORCE_ROOT use default"
   EOSFORCE_ROOT=$DEFAULT_EOSFORCE_ROOT
fi

printf "EOSForce root path : %s\\n" $EOSFORCE_ROOT

BIN_PATH="$EOSFORCE_ROOT/build/bin"
GENESIS_CONFIGS_PATH="../config"

printf "BIN PATH: %s\\n" $BIN_PATH
printf "CONTRACT PATH: %s\\n" $GENESIS_CONFIGS_PATH

# make eosforce path files

DOCKER_ROOT="../testnet"

mkdir -p "$DOCKER_ROOT/genesis"
cp -r $GENESIS_CONFIGS_PATH/* $DOCKER_ROOT/genesis/

cp $GENESIS_CONFIGS_PATH/System02.abi  $DOCKER_ROOT/genesis/System.abi
cp $GENESIS_CONFIGS_PATH/System02.wasm $DOCKER_ROOT/genesis/System.wasm

cp $GENESIS_CONFIGS_PATH/System02.abi  $DOCKER_ROOT/genesis/System01.abi
cp $GENESIS_CONFIGS_PATH/System02.wasm $DOCKER_ROOT/genesis/System01.wasm

cp -r ../scripts/nodeosd.sh $DOCKER_ROOT/
cp -r ../config/config.ini $DOCKER_ROOT/

mkdir -p "$DOCKER_ROOT/bin"
cp -r $BIN_PATH/* $DOCKER_ROOT/bin/

docker build $DOCKER_ROOT --build-arg https_proxy=$HTTP_PROXY --build-arg http_proxy=$HTTP_PROXY -t $IMAGE_NAME