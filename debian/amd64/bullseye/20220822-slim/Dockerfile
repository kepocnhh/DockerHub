from amd64/debian:bullseye-20220822-slim

run echo "deb http://deb.debian.org/debian bullseye main" > /etc/apt/sources.list

run apt-get update \
 && apt-get upgrade -y \
 && apt autoremove

run apt-get install --no-install-recommends -y curl unzip \
 && curl --version

run apt-get install --no-install-recommends -y openssl ca-certificates \
 && openssl version

run update-ca-certificates -f

run apt-get install --no-install-recommends -y git \
 && git --version

run apt-get install --no-install-recommends -y jq \
 && jq --version

run apt-get install --no-install-recommends -y gpg gpg-agent \
 && gpg --version
