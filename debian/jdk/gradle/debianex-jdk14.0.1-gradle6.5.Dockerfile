FROM kepocnhh/debianex-jdk14.0.1:0.0.1

# Gradle
ENV GRADLE_VERSION="6.5"
RUN echo "install gradle $GRADLE_VERSION..."
RUN curl -s \
        --cacert /etc/ssl/certs/ca-certificates.crt \
		-L "https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip" \
		-o "tmpfile"
RUN unzip -q "tmpfile" -d $SDK_HOME \
    && rm "tmpfile"
ENV GRADLE_HOME="$SDK_HOME/gradle-$GRADLE_VERSION"
ENV PATH=$GRADLE_HOME/bin:$PATH

RUN gradle -v
