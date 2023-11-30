from kepocnhh/debian-arm64v8:5b

env JAVA_VERSION='17.0.2'
run curl "https://download.java.net/java/GA/jdk${JAVA_VERSION}/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-${JAVA_VERSION}_linux-aarch64_bin.tar.gz" \
 -o tmpfile && tar xf tmpfile -C /tmp/ && rm tmpfile \
 && mv "/tmp/jdk-${JAVA_VERSION}" "/opt/jdk-${JAVA_VERSION}"

env JAVA_HOME="/opt/jdk-${JAVA_VERSION}"
env PATH="${PATH}:${JAVA_HOME}/bin"

run java --version
