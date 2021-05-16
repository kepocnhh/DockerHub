from kepocnhh/dex-iguana:0.0.1

# Android NDK
env ANDROID_NDK_VERSION=17
env ANDROID_NDK_ROOT=$ANDROID_ROOT/android-ndk-r$ANDROID_NDK_VERSION
run curl https://dl.google.com/android/repository/android-ndk-r${ANDROID_NDK_VERSION}-linux-x86_64.zip -o tmpfile \
&& unzip -q tmpfile -d $ANDROID_ROOT && rm tmpfile
