FROM kepocnhh/deb-j12.0.2-g6.5-amin:0.0.1

ENV ANDROID_REPOSITORY_URL=http://dl.google.com/android/repository

# Android platform tools
ENV ANDROID_PLATFORM_TOOLS_VERSION=30.0.3
RUN curl -s \
	-L $ANDROID_REPOSITORY_URL/platform-tools_r$ANDROID_PLATFORM_TOOLS_VERSION-linux.zip \
	-o "tmpfile"
RUN unzip -q "tmpfile" -d $ANDROID_SDK_ROOT
RUN rm "tmpfile"

ENV PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH

RUN adb --version
