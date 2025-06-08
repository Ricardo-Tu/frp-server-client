#/bin/bash

mkdir -p /data/frpc
cp -f ./frpc.toml  /data/frpc
docker rmi -f my-frpc-docker-image:0.1
docker build -t my-frpc-docker-image:0.1 -f ./Dockerfile .


docker run -d --name=frpc \
    --restart=always \
    -v /data/frpc/frpc.toml:/frp/frpc.toml \
    my-frpc-docker-image:0.1