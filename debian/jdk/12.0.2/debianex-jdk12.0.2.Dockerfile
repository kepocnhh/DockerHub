FROM kepocnhh/debianex:0.0.1

# Java
ENV JDK_VERSION=12.0.2
RUN curl -s \
		https://download.java.net/java/GA/jdk$JDK_VERSION/e482c34c86bd4bf8b56c0b35558996b9/10/GPL/openjdk-${JDK_VERSION}_linux-x64_bin.tar.gz \
		-o tmpfile
RUN tar xf tmpfile -C $SDK_HOME
RUN rm tmpfile

ENV JAVA_HOME=$SDK_HOME/jdk-$JDK_VERSION
ENV PATH=$JAVA_HOME/bin:$PATH

RUN java -version
