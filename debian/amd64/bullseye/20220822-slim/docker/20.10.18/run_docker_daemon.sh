#!/bin/bash

CODE=0

dockerd > /dev/null 2>&1 &

TIMEOUT=10 # seconds
TIME_START=$(date +%s)
while :; do
 test $(($(date +%s)-TIME_START)) -gt $TIMEOUT && break
 docker ps > /dev/null 2>&1 && exit 0
 sleep 1
done

echo "Docker failed to start after $TIMEOUT seconds!"
exit 1
