from kepocnhh/debian-arm64v8:4

env JAVA_VERSION='11.0.18'
run curl "https://cdn.azul.com/zulu-embedded/bin/zulu11.62.17-ca-jdk${JAVA_VERSION}-linux_aarch64.tar.gz" \
 -o tmpfile && tar xf tmpfile -C /tmp/ && rm tmpfile \
 && mv "/tmp/zulu11.62.17-ca-jdk${JAVA_VERSION}-linux_aarch64" "/opt/jdk-${JAVA_VERSION}"

env JAVA_HOME="/opt/jdk-${JAVA_VERSION}"
env PATH="${PATH}:${JAVA_HOME}/bin"

run java --version
