FROM kepocnhh/debianex:0.0.2

# Java
env JDK_VERSION=12.0.2
run curl https://download.java.net/java/GA/jdk$JDK_VERSION/e482c34c86bd4bf8b56c0b35558996b9/10/GPL/openjdk-${JDK_VERSION}_linux-x64_bin.tar.gz \
 -o tmpfile && tar xf tmpfile -C $SDK_HOME && rm tmpfile

env JAVA_HOME=$SDK_HOME/jdk-$JDK_VERSION
env PATH=$JAVA_HOME/bin:$PATH
