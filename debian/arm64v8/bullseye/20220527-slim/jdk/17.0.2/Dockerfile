from kepocnhh/debian-arm64v8:2

env JDK_VERSION=17.0.2
run curl https://download.java.net/java/GA/jdk${JDK_VERSION}/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-${JDK_VERSION}_linux-aarch64_bin.tar.gz \
 -o tmpfile && tar xf tmpfile -C /opt && rm tmpfile

env JAVA_HOME=/opt/jdk-$JDK_VERSION
env PATH=$JAVA_HOME/bin:$PATH
run java --version
