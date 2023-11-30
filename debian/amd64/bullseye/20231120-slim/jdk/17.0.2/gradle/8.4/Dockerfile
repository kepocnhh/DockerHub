from kepocnhh/jdk-amd64:17.0.2

env GRADLE_VERSION='8.4'
run curl -L "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -o tmpfile \
 && unzip -d /opt tmpfile && rm tmpfile

env GRADLE_HOME="/opt/gradle-${GRADLE_VERSION}"
env PATH="${PATH}:${GRADLE_HOME}/bin"

run gradle --version
