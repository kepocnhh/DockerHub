FROM kepocnhh/debianex-jdk12.0.2:0.0.2

# Gradle
ENV GRADLE_VERSION=6.5
RUN curl -s \
        --cacert /etc/ssl/certs/ca-certificates.crt \
		-L https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip \
		-o tmpfile
RUN unzip -q tmpfile -d $SDK_HOME
RUN rm tmpfile

ENV GRADLE_HOME=$SDK_HOME/gradle-$GRADLE_VERSION
ENV PATH=$GRADLE_HOME/bin:$PATH

RUN gradle -v
