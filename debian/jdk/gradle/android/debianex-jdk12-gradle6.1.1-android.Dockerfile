FROM kepocnhh/deb-j12-g6.1.1:0.0.1

ENV ANDROID_REPOSITORY_URL=http://dl.google.com/android/repository

# Android
ENV ANDROID_HOME=$SDK_HOME/android/sdk
RUN mkdir -p $ANDROID_HOME && mkdir -p $ANDROID_HOME/licenses
RUN echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > $ANDROID_HOME/licenses/android-sdk-license

# Android platforms
RUN mkdir -p $ANDROID_HOME/platforms
RUN list="\
23_r03 24_r02 25_r03 26_r02 27_r03 28_r06 29_r04 \
" && \
	for v in $list; do \
		echo "install platform $v..." && \
		curl -s $ANDROID_REPOSITORY_URL/platform-$v.zip -o "tmpfile" && \
		mkdir -p $ANDROID_HOME/tmp && \
		unzip -q "tmpfile" -d $ANDROID_HOME/tmp && rm "tmpfile" && \
		oldName=$(ls $ANDROID_HOME/tmp) && \
		newName=$(echo $v | cut -d'_' -f1) && \
		mv $ANDROID_HOME/tmp/$oldName $ANDROID_HOME/platforms/android-$newName && \
		rm -rf $ANDROID_HOME/tmp && \
		echo "install platform $v success"; \
	done

# Android build tools
RUN mkdir -p $ANDROID_HOME/build-tools
RUN list="\
27.0.3 28.0.1 28.0.2 28.0.3 29.0.1 29.0.2 29.0.3 \
" && \
	for v in $list; do \
		echo "install build tools $v..." && \
		curl -s $ANDROID_REPOSITORY_URL/build-tools_r$v-linux.zip -o "tmpfile" && \
		mkdir -p $ANDROID_HOME/tmp && \
		unzip -q "tmpfile" -d $ANDROID_HOME/tmp && rm "tmpfile" && \
		name=$(ls $ANDROID_HOME/tmp) && mv $ANDROID_HOME/tmp/$name $ANDROID_HOME/build-tools/$v && \
		rm -rf $ANDROID_HOME/tmp && \
		echo "install build tools $v success"; \
	done

# Android platform tools
ENV ANDROID_PLATFORM_TOOLS_VERSION=29.0.5
RUN echo "install platform tools..." && \
	curl -s $ANDROID_REPOSITORY_URL/platform-tools_r$ANDROID_PLATFORM_TOOLS_VERSION-linux.zip -o "tmpfile" && \
	echo "download platform tools success" && \
	unzip -q "tmpfile" -d $ANDROID_HOME/ && rm "tmpfile" && \
	echo "install platform tools success"

ENV PATH=$ANDROID_HOME/bin:$PATH
