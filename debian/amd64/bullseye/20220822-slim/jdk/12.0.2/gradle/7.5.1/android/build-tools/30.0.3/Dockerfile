from kepocnhh/android-amd64:2

env ANDROID_BUILD_TOOLS_VERSION=30.0.3

run curl http://dl.google.com/android/repository/build-tools_r${ANDROID_BUILD_TOOLS_VERSION}-linux.zip -o tmpfile && \
 unzip tmpfile -d /tmp/build-tools/ && rm tmpfile && \
 mkdir -p $ANDROID_SDK_ROOT/build-tools/${ANDROID_BUILD_TOOLS_VERSION} && \
 mv /tmp/build-tools/android-11/* $ANDROID_SDK_ROOT/build-tools/${ANDROID_BUILD_TOOLS_VERSION}

run cat $ANDROID_SDK_ROOT/build-tools/$ANDROID_BUILD_TOOLS_VERSION/source.properties
