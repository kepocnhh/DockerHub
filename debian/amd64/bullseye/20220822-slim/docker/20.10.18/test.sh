#!/bin/bash

rm result

CODE=0

TYPE=dockerindocker
VERSION=1

EXPECTED="$(date +%N)"
echo expected $EXPECTED

docker build --no-cache \
 -f test.docker \
 --build-arg EXPECTED="$EXPECTED" \
 -t "image.${TYPE}:$VERSION" \
 .; CODE=$?

if test $CODE -ne 0; then
 echo "Docker build error!"; exit 21
fi

docker stop container.${TYPE}
docker rm -f container.${TYPE}

# --privileged required for docker in docker

docker run --privileged \
 --name container.${TYPE} image.${TYPE}:$VERSION && \
 docker cp container.${TYPE}:/tmp/result result && \
 docker stop container.${TYPE} && \
 docker rm -f container.${TYPE}; CODE=$?

if test $CODE -ne 0; then
 echo "Docker run error!"; exit 31
fi

if [ ! -f result ]; then
 echo "File result does not exist!"; exit 41
fi

ACTUAL="$(cat result)"

if test "$ACTUAL" != "$EXPECTED"; then
 echo "Expected is \"$EXPECTED\", but actual is \"$ACTUAL\"!"; exit 51
fi

rm result

exit 0
