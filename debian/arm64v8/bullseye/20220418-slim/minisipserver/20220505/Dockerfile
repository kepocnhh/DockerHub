from kepocnhh/debian-arm:2
#from kepocnhh/debian-amd64:1

run apt-get install --no-install-recommends -y binutils
run apt-get install --no-install-recommends -y xz-utils
run apt-get install --no-install-recommends -y \
 libqt5core5a libqt5network5

run mkdir /tmp/mss
env MINISIPSERVER_VERSION=39
run curl https://www.myvoipapp.com/download/mss_v${MINISIPSERVER_VERSION}/linux/mss_v${MINISIPSERVER_VERSION}_x64_u5.deb \
 -o /tmp/mss/deb
workdir /tmp/mss
run ar x /tmp/mss/deb
workdir /
run tar xf /tmp/mss/data.tar.xz -C /
#run cp -r /tmp/mss/opt/sipserver /opt/sipserver
run rm -rf /tmp/mss
#run /opt/sipserver/minisipserver-cli
#run exit 1 # todo

cmd /opt/sipserver/minisipserver-cli
