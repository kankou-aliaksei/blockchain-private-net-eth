FROM ethereum/client-go:v1.10.1

ARG ACCOUNT_PASSWORD

RUN mkdir /src

COPY start.sh /src
RUN chmod +x /src/start.sh

# geth

COPY genesis.json /tmp
RUN geth init /tmp/genesis.json && \
    rm -f ~/.ethereum/geth/nodekey && \
    echo ${ACCOUNT_PASSWORD} > /tmp/password && \
    geth account new --password /tmp/password && \
    rm -f /tmp/password

# accounts

COPY file/keystore /root/.ethereum/keystore

# eth-net-intelligence-api

RUN apk update && \
    apk add --update git=2.30.6-r0 bash=5.1.16-r0 nodejs=14.20.1-r0 npm=14.20.1-r0 perl=5.32.0-r0

RUN cd /root && \
    git clone https://github.com/cubedro/eth-net-intelligence-api && \
    cd eth-net-intelligence-api && \
    npm install && \
    npm install -g pm2

COPY app.json /root/eth-net-intelligence-api/app.json

ENTRYPOINT src/start.sh