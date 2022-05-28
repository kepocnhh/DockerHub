from amd64/debian:bullseye-20220527-slim

run echo "deb http://deb.debian.org/debian bullseye main" > /etc/apt/sources.list

run apt-get update
run apt-get upgrade -y
run apt autoremove -y

run apt-get install --no-install-recommends -y curl unzip
run curl --version

run apt-get install --no-install-recommends -y openssl ca-certificates
run openssl version

run update-ca-certificates -f

run apt-get install --no-install-recommends -y git
run git --version

run apt-get install --no-install-recommends -y jq
run jq --version
