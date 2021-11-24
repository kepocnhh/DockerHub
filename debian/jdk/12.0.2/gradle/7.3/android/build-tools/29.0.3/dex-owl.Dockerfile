FROM kepocnhh/dex-starfish:0.0.1

# Android build tools
RUN mkdir -p $ANDROID_SDK_ROOT/build-tools
ENV ANDROID_BUILD_TOOLS_VERSION=29.0.3
RUN curl -s http://dl.google.com/android/repository/build-tools_r$ANDROID_BUILD_TOOLS_VERSION-linux.zip -o tmpfile
RUN mkdir -p $ANDROID_SDK_ROOT/tmp
RUN unzip -q tmpfile -d $ANDROID_SDK_ROOT/tmp
RUN rm tmpfile
RUN name=$(ls $ANDROID_SDK_ROOT/tmp) && \
		mv $ANDROID_SDK_ROOT/tmp/$name $ANDROID_SDK_ROOT/build-tools/$ANDROID_BUILD_TOOLS_VERSION && \
		rm -rf $ANDROID_SDK_ROOT/tmp

RUN cat $ANDROID_SDK_ROOT/build-tools/$ANDROID_BUILD_TOOLS_VERSION/source.properties
