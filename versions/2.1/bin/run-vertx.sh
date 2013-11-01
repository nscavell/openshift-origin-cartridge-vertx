#!/usr/bin/env sh

export VERTX_HOME=$(dirname $0)/../vert.x

echo "PWD: $PWD"
echo "VERTX_HOME: $VERTX_HOME"

#$VERTX_HOME/bin/vertx run ./server.js  -cluster -cluster-port 9123 -cluster-host ${env.OPENSHIFT_VERTX_IP} -advertise-port ${env.OPENSHIFT_VERTX_VERTX_PROXY_PORT} -advertise-host ${env.OPENSHIFT_VERTX_PROXY_IP}

logf="$OPENSHIFT_VERTX_LOG_DIR/vertx.log"

export VERTX_OPTS="-DOPENSHIFT_VERTX_IP=${OPENSHIFT_VERTX_IP} -DOPENSHIFT_VERTX_PORT=${OPENSHIFT_VERTX_PORT}"

$VERTX_HOME/bin/vertx run ./server.js >> $logf 2>&1 &
