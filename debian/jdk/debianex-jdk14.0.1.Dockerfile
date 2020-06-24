FROM kepocnhh/debianex:latest

# Java
ENV JDK_VERSION="14.0.1"
RUN echo "install java $JDK_VERSION..."
RUN curl -s \
		"https://download.java.net/java/GA/jdk$JDK_VERSION/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-${JDK_VERSION}_linux-x64_bin.tar.gz" \
#		"https://download.oracle.com/otn-pub/java/jdk/14.0.1+7/664493ef4a6946b186ff29eb326336a2/jdk-14.0.1_linux-x64_bin.tar.gz" \
#		"https://download.oracle.com/otn-pub/java/jdk/$JDK_VERSION+7/664493ef4a6946b186ff29eb326336a2/jdk-${JDK_VERSION}_linux-x64_bin.tar.gz" \
		-o "tmpfile"
RUN tar xf "tmpfile" -C $SDK_HOME \
    && rm "tmpfile"

ENV JAVA_HOME="$SDK_HOME/jdk-$JDK_VERSION"
ENV PATH=$JAVA_HOME/bin:$PATH

RUN java -version
