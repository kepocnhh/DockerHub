FROM kepocnhh/debianex:latest

# Java
ENV JDK_VERSION="12"
RUN echo "install java $JDK_VERSION..."
RUN curl -s \
		"https://download.java.net/openjdk/jdk$JDK_VERSION/ri/openjdk-$JDK_VERSION+32_linux-x64_bin.tar.gz" \
		-o "tmpfile"
RUN tar xf "tmpfile" -C $SDK_HOME \
    && rm "tmpfile"

ENV JAVA_HOME="$SDK_HOME/jdk-$JDK_VERSION"
ENV PATH=$JAVA_HOME/bin:$PATH

RUN java -version
