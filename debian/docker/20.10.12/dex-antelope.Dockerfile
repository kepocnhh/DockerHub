from kepocnhh/debianex:bullseye-1

run apt-get install --no-install-recommends -y iptables # containerd
run apt-get install --no-install-recommends -y libdevmapper1.02.1 # dockerd

env DOCKER_VERSION="20.10.12"

run curl -f "https://download.docker.com/linux/debian/dists/bullseye/pool/stable/amd64/\
docker-ce-cli_${DOCKER_VERSION}~3-0~debian-bullseye_amd64.deb" -o /tmp/docker.deb
run dpkg -i /tmp/docker.deb
run rm /tmp/docker.deb
run docker --version

env CONTAINERD_VERSION="1.4.10-1"

run curl -f "https://download.docker.com/linux/debian/dists/bullseye/pool/stable/amd64/\
containerd.io_${CONTAINERD_VERSION}_amd64.deb" -o /tmp/containerd.deb
run dpkg -i /tmp/containerd.deb
run rm /tmp/containerd.deb
run containerd --version

run curl -f "https://download.docker.com/linux/debian/dists/bullseye/pool/stable/amd64/\
docker-ce_${DOCKER_VERSION}~3-0~debian-bullseye_amd64.deb" -o /tmp/dockerd.deb
run dpkg -i /tmp/dockerd.deb
run rm /tmp/dockerd.deb
run dockerd --version

copy run_docker_daemon.sh /usr/local/bin/run_docker_daemon.sh
