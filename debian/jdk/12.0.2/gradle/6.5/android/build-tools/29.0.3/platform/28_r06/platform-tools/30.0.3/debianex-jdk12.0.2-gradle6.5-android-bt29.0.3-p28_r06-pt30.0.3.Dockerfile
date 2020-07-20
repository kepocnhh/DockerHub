FROM kepocnhh/deb-j12.0.2-g6.5-a-bt29.0.3-p28_r06:0.0.1

# Android platform tools
ENV ANDROID_PLATFORM_TOOLS_VERSION=30.0.3
RUN curl -s \
	-L http://dl.google.com/android/repository/platform-tools_r$ANDROID_PLATFORM_TOOLS_VERSION-linux.zip \
	-o tmpfile
RUN unzip -q tmpfile -d $ANDROID_SDK_ROOT
RUN rm tmpfile

ENV PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH

RUN adb --version
