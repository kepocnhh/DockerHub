#!/bin/bash

CODE=0

TYPE=minisipserver
VERSION=2

docker build \
 --platform linux/amd64 \
 -f Dockerfile \
 -t image.${TYPE}:$VERSION \
 .; CODE=$?

if test $CODE -ne 0; then
 echo "Docker build error!"; exit 21
fi

#exit 1 # todo
docker stop container.${TYPE}
docker rm -f container.${TYPE}

# --privileged required for docker in docker

docker run \
 --privileged \
 --platform linux/amd64 \
 --name container.${TYPE} image.${TYPE}:$VERSION && \
 docker stop container.${TYPE} && \
 docker rm -f container.${TYPE}; CODE=$?

if test $CODE -ne 0; then
 echo "Docker run error!"; exit 31
fi

exit 1 # todo
exit 0
