FROM kepocnhh/debianex:0.0.1

# Android
ENV ANDROID_ROOT=$SDK_HOME/android

RUN mkdir -p $ANDROID_ROOT

# Android NDK
ENV ANDROID_NDK_VERSION=21
ENV ANDROID_NDK_ROOT=$ANDROID_ROOT/android-ndk-r$ANDROID_NDK_VERSION
RUN curl -s https://dl.google.com/android/repository/android-ndk-r${ANDROID_NDK_VERSION}-linux-x86_64.zip -o tmpfile
RUN unzip -q tmpfile -d $ANDROID_ROOT
RUN rm tmpfile
