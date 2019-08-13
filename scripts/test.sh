#!/bin/sh
# Build
# ./scripts/build.sh

# Free ports
killall -9 config

# Set environment variables
REV=$(eval git rev-parse HEAD)
# Service
export CFG_SVC_NAME="config"
export CFG_SVC_REVISION=$REV
export CFG_SVC_ADMIN_PORT=8081
export CFG_SVC_PROBE_PING_PORT=8082
export CFG_SVC_LIVENESS_PING_PORT=8083
# Rabbit
export CFG_RABBIT_HOST="localhost"
export CFG_RABBIT_PORT="5672"
export CFG_RABBIT_USER="config"
export CFG_RABBIT_PASSWORD="gH492a1k28"
export CFG_RABBIT_EXCHANGE="config"
export CFG_RABBIT_QUEUE="config"
export CFG_RABBIT_ENABLED="true"
export CFG_RABBIT_EXCHANGE_OUT="config"
export CFG_RABBIT_QUEUE_OUT="result"
export CFG_RABBIT_ENABLED="true"
# Misc
export CFG_SVC_LOG_LEVEL=debug
# Ituran
export CFG_LISTEN_HOST=172.17.0.3
export CFG_LISTEN_PORT=8080

# Start
go test -v ./...
