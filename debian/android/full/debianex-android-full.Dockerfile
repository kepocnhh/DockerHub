FROM kepocnhh/debianex-android-sdk:0.0.1

# Android ndk
ENV ANDROID_NDK_PATH=$ANDROID_ROOT/ndk
RUN mkdir -p $ANDROID_NDK_PATH
RUN list="\
16 17 18 19 19 20 20 21 \
" && \
	for v in $list; do \
		echo "download android ndk $v..." && \
		curl -s "$ANDROID_REPOSITORY_URL/android-ndk-r${v}-linux-x86_64.zip" -o "tmpfile" && \
		unzip -q "tmpfile" -d $ANDROID_NDK_PATH && rm "tmpfile" && \
		echo "install android ndk $v success"; \
	done
ENV ANDROID_NDK_VERSION=21
ENV ANDROID_NDK_ROOT=$ANDROID_NDK_PATH/android-ndk-r$ANDROID_NDK_VERSION

RUN echo $ANDROID_NDK_VERSION
RUN ls -a $ANDROID_NDK_PATH
RUN ls -a $ANDROID_NDK_ROOT
RUN exit 1

ENV ANDROID_HOME=$ANDROID_ROOT
ENV PATH=$ANDROID_HOME/bin:$PATH
