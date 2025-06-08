#/bin/bash

docker run -d --name=frpc --restart=always -v /data/frpc/frpc.toml:/frp/frpc.toml stilleshan/frpc