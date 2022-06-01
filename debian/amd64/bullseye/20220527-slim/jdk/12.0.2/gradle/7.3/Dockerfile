from kepocnhh/jdk-amd64:12.0.2

env GRADLE_VERSION=7.3
run curl --cacert /etc/ssl/certs/ca-certificates.crt \
 -L https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip -o tmpfile && \
 unzip -d /opt tmpfile && rm tmpfile

env GRADLE_HOME=/opt/gradle-$GRADLE_VERSION
env PATH=$GRADLE_HOME/bin:$PATH

run gradle --version
