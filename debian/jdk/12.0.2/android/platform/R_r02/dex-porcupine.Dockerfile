from kepocnhh/dex-coyote:0.0.1

# Android platforms
run mkdir -p $ANDROID_SDK_ROOT/platforms
env ANDROID_PLATFORM_VERSION_NAME=R
env ANDROID_PLATFORM_VERSION_REVISION=02
env ANDROID_PLATFORM_VERSION=${ANDROID_PLATFORM_VERSION_NAME}_r$ANDROID_PLATFORM_VERSION_REVISION

run curl http://dl.google.com/android/repository/platform-$ANDROID_PLATFORM_VERSION.zip -o tmpfile \
&& mkdir -p $ANDROID_SDK_ROOT/tmp \
&& unzip -q tmpfile -d $ANDROID_SDK_ROOT/tmp && rm tmpfile \
&& mv $ANDROID_SDK_ROOT/tmp/$(ls $ANDROID_SDK_ROOT/tmp) $ANDROID_SDK_ROOT/platforms/android-$ANDROID_PLATFORM_VERSION_NAME \
&& rm -rf $ANDROID_SDK_ROOT/tmp
