#/bin/bash

mkdir -p /data/frps
cp -f ./frps.toml  /data/frps
docker rmi -f my-frps-docker-imagem:0.1
docker build -t my-frps-docker-image:0.1 -f ./Dockerfile .


docker run -d --name=frps --restart=always \
    --network host \
    -v /data/frps/frps.toml:/frp/frps.toml  \
    my-frps-docker-image:0.1
