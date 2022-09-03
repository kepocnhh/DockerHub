from kepocnhh/jdk-amd64:12.0.2a

env GRADLE_VERSION=7.5.1
run curl --cacert /etc/ssl/certs/ca-certificates.crt \
 -L https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip -o tmpfile \
 && unzip -d /opt tmpfile && rm tmpfile

env GRADLE_HOME=/opt/gradle-$GRADLE_VERSION
env PATH=$PATH:$GRADLE_HOME/bin

run gradle --version
