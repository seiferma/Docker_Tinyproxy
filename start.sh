#!/bin/sh

USER_NAME=proxy
GROUP_NAME=proxy

# Generating user account
echo "Generating user account"
if [ "$PROXY_GID" == "" ]; then
	export PROXY_GID=1500
fi
if [ "$PROXY_UID" == "" ]; then
	export PROXY_UID=1500
fi
addgroup -g $PROXY_GID $GROUP_NAME
adduser -D -H -G $GROUP_NAME -u $PROXY_UID $USER_NAME
chown $USER_NAME:$GROUP_NAME $DATA_VOLUME

# Run server
if [ "$1" == "default" ]; then
	echo "Starting proxy server"
	su-exec $USER_NAME /usr/bin/tinyproxy -d
else
	echo "Executing command"
	exec "$@"
fi
