from kepocnhh/android-amd64:b30.0.3

env ANDROID_PLATFORM_TOOLS_VERSION=33.0.2

run curl http://dl.google.com/android/repository/platform-tools_r${ANDROID_PLATFORM_TOOLS_VERSION}-linux.zip -o tmpfile && \
 unzip tmpfile -d $ANDROID_SDK_ROOT && rm tmpfile

run cat $ANDROID_SDK_ROOT/platform-tools/source.properties
