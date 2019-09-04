# 测试网搭建文档

目前测试网使用主网force-v1.7.1版本．

## 使用Docker

与主网启动类似，注意镜像名为`eosforce/testnet:v1.7.0`

```bash
docker pull eosforce/testnet:v1.7.0
mkdir ~/eosforce-testnet-node
docker run -d --name eosforce-t -v ~/eosforce-testnet-node:/eosforce -p 8887:8888 -p 9877:9876 eosforce/testnet:v1.7.0 nodeosd.sh
```

启动之后默认链接测试主网根同步节点，为了保证稳定性，请将你的节点的同步地址分享给社区的其他测试节点，在节点配置中添加社区分享的同步地址

## 编译启动

与主网启动类似，需要注意的是测试网启动所需的genesis文件与主网不同，在　https://github.com/fanyang1988/eosforce-testnet/tree/master/config　下．