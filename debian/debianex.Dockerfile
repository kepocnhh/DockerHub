from debian:stable-20210511-slim

run echo "deb http://deb.debian.org/debian stable main" > /etc/apt/sources.list

run apt-get update && apt-get upgrade -y

run apt-get install --no-install-recommends -y \
 curl unzip
run apt-get install --no-install-recommends -y \
 openssl ca-certificates

run update-ca-certificates -f

run apt-get install --no-install-recommends -y git

env SDK_HOME=/opt
