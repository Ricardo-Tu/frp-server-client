FROM alpine:3.8

ENV VERSION 0.62.1
ENV TZ=Asia/Shanghai
ENV FILE=frp_0.62.1_linux_amd64
ENV TAR=${FILE}.tar.gz
WORKDIR /

RUN apk add --no-cache tzdata
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime
RUN echo ${TZ} > /etc/timezone

# RUN if [ "$(uname -m)" = "x86_64" ]; then export PLATFORM=amd64 ; \
# 	elif [ "$(uname -m)" = "aarch64" ]; then export PLATFORM=arm64 ; \
# 	elif [ "$(uname -m)" = "armv7" ]; then export PLATFORM=arm ; \
# 	elif [ "$(uname -m)" = "armv7l" ]; then export PLATFORM=arm ; \
# 	elif [ "$(uname -m)" = "armhf" ]; then export PLATFORM=arm ; fi
# RUN wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_${PLATFORM}.tar.gz
# RUN tar xzf frp_${VERSION}_linux_${PLATFORM}.tar.gz
COPY ${TAR} ./
RUN tar -xvf ${TAR}
RUN cd ${FILE}
RUN mkdir /frp 
RUN mv ${FILE}/frpc ${FILE}/frpc.toml /frp
RUN cd .. 
RUN rm -rf ${FILE} ${TAR}

VOLUME /frp

CMD /frp/frpc -c /frp/frpc.toml
