FROM kepocnhh/dex-pony:0.0.1

# Android NDK
ENV ANDROID_NDK_VERSION=21
ENV ANDROID_NDK_ROOT=$ANDROID_ROOT/android-ndk-r$ANDROID_NDK_VERSION
RUN curl -s https://dl.google.com/android/repository/android-ndk-r${ANDROID_NDK_VERSION}-linux-x86_64.zip -o tmpfile
RUN unzip -q tmpfile -d $ANDROID_ROOT
RUN rm tmpfile
