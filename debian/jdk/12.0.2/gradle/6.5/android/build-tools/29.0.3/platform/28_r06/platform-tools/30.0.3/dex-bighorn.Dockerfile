FROM kepocnhh/dex-bear:0.0.1

# Android platform tools
ENV ANDROID_PLATFORM_TOOLS_VERSION=30.0.3
RUN curl -s \
	-L http://dl.google.com/android/repository/platform-tools_r$ANDROID_PLATFORM_TOOLS_VERSION-linux.zip \
	-o tmpfile
RUN unzip -q tmpfile -d $ANDROID_SDK_ROOT
RUN rm tmpfile

ENV PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH

RUN adb --version
