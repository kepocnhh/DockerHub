from kepocnhh/android-amd64:b30.0.3pt33.0.2

env ANDROID_PLATFORM_VERSION=31

run curl https://dl.google.com/android/repository/platform-${ANDROID_PLATFORM_VERSION}_r01.zip -o tmpfile && \
 unzip tmpfile -d /tmp/platforms/ && rm tmpfile && \
 mkdir -p $ANDROID_SDK_ROOT/platforms/android-${ANDROID_PLATFORM_VERSION} && \
 mv /tmp/platforms/android-12/* $ANDROID_SDK_ROOT/platforms/android-${ANDROID_PLATFORM_VERSION}

run cat $ANDROID_SDK_ROOT/platforms/android-${ANDROID_PLATFORM_VERSION}/source.properties
