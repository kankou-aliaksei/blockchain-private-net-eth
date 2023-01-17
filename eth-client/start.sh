#!/bin/sh

GET_OPTS=$@

cd /root/eth-net-intelligence-api && \
  perl -pi -e "s/<INSTANCE_NAME>/$(hostname)/g" app.json && \
  /usr/bin/pm2 start app.json

geth $GET_OPTS
