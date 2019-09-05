# Build Document on the Test Network

At present, the test network use the force-v1.7.1 version of the mainnet.

Test Network Root API URL: http://47.97.251.144:8101

Sync Address:

47.97.251.144:10001

## Use Docker

Note the image file name should be `eosforce/testnet:v1.7.0`

```bash
docker pull eosforce/testnet:v1.7.0
mkdir ~/eosforce-testnet-node
docker run -d --name eosforce-t -v ~/eosforce-testnet-node:/eosforce -p 8887:8888 -p 9877:9876 eosforce/testnet:v1.7.0 nodeosd.sh
```

After startup the image, the default link will be the test net root sync nodes. To ensure the stability, please share the sync address of your node with other test nodes in the community, and add the community shared sync address in the node configuration.

## Compile and Launch

It is similar to the mainnet launch. And it should be noted that the genesis file required for the test network launch is different from the mainnet. Check the file: https://github.com/fanyang1988/eosforce-testnet/tree/master/config 
