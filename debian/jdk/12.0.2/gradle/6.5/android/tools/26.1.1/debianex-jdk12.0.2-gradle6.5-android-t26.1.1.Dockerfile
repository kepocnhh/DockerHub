FROM kepocnhh/deb-j12.0.2-g6.5-amin:0.0.1

ENV ANDROID_REPOSITORY_URL=http://dl.google.com/android/repository

# Android tools
ENV ANDROID_TOOLS_VERSION=26.1.1
RUN curl -s \
	-L $ANDROID_REPOSITORY_URL/sdk-tools-linux-4333796.zip \
	-o "tmpfile"
RUN unzip -q "tmpfile" -d $ANDROID_SDK_ROOT
RUN rm "tmpfile"

RUN cat $ANDROID_SDK_ROOT/tools/source.properties
