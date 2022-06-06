from kepocnhh/debian-amd64:2

run apt-get update
run apt-get upgrade -y
run apt autoremove -y

env INSTALL="apt-get install --no-install-recommends --no-install-suggests -y"

# configure
run $INSTALL build-essential
run $INSTALL libedit-dev
run $INSTALL uuid-dev
run $INSTALL libxml2-dev
run $INSTALL libsqlite3-dev
run $INSTALL libsrtp2-dev # SRTP support module is not loaded or available. Try loading res_srtp.so.

# make
# libssl-dev : Depends: libssl1.1 (= 1.1.1n-0+deb11u1) but 1.1.1n-0+deb11u2 is to be installed
run $INSTALL --allow-downgrades libssl1.1=1.1.1n-0+deb11u1
run $INSTALL libssl-dev
run $INSTALL libjansson-dev

env INSTALL=""

env ASTERISK_VERSION="18.12.1"
run curl http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-${ASTERISK_VERSION}.tar.gz \
 -o /tmp/file && tar -xzf /tmp/file -C /usr/src && rm /tmp/file

workdir /usr/src/asterisk-$ASTERISK_VERSION

run ./configure
run make menuselect/menuselect menuselect-tree menuselect.makeopts
run menuselect/menuselect --disable BUILD_NATIVE menuselect.makeopts

run make
run make install
run make samples
run make dist-clean

workdir /

run useradd --system asterisk
run chown -R asterisk:asterisk /etc/asterisk
run chown -R asterisk:asterisk /var/*/asterisk
run chown -R asterisk:asterisk /usr/*/asterisk

user asterisk

run /usr/sbin/asterisk -V
