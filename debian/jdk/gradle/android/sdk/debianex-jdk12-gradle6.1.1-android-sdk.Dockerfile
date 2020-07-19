FROM kepocnhh/deb-j12-g6.1.1-amin:0.0.1

ENV ANDROID_REPOSITORY_URL=http://dl.google.com/android/repository

# Android platforms
RUN mkdir -p $ANDROID_SDK_ROOT/platforms
RUN list="\
14_r04 15_r05 16_r05 17_r03 18_r03 19_r04 20_r02 21_r02 22_r02 \
" && \
	for v in $list; do \
		echo "download android platform $v..." && \
		newName=$(echo $v | cut -d'_' -f1) && \
		curl -s $ANDROID_REPOSITORY_URL/android-$v.zip -o "tmpfile" && \
		mkdir -p $ANDROID_SDK_ROOT/tmp && \
		echo "unzip android platform $v..." && \
		unzip -q "tmpfile" -d $ANDROID_SDK_ROOT/tmp && rm "tmpfile" && \
		oldName=$(ls $ANDROID_SDK_ROOT/tmp) \
		mv $ANDROID_SDK_ROOT/tmp/$oldName $ANDROID_SDK_ROOT/platforms/android-$newName && \
		rm -rf $ANDROID_SDK_ROOT/tmp && \
		echo "install android platform $v success"; \
	done
RUN list="\
23_r03 24_r02 25_r03 26_r02 27_r03 28_r06 29_r04 R_r02 \
" && \
	for v in $list; do \
		echo "download android platform $v..." && \
		newName=$(echo $v | cut -d'_' -f1) && \
		curl -s $ANDROID_REPOSITORY_URL/platform-$v.zip -o "tmpfile" && \
		mkdir -p $ANDROID_SDK_ROOT/tmp && \
		echo "unzip android platform $v..." && \
		unzip -q "tmpfile" -d $ANDROID_SDK_ROOT/tmp && rm "tmpfile" && \
		oldName=$(ls $ANDROID_SDK_ROOT/tmp) \
		mv $ANDROID_SDK_ROOT/tmp/$oldName $ANDROID_SDK_ROOT/platforms/android-$newName && \
		rm -rf $ANDROID_SDK_ROOT/tmp && \
		echo "install android platform $v success"; \
	done

# Android build tools
RUN mkdir -p $ANDROID_SDK_ROOT/build-tools
RUN list="\
17 \
18.0.1 18.1 18.1.1 \
19 19.0.1 19.0.2 19.0.3 19.1 \
20 \
" && \
	for v in $list; do \
		echo "download android build tools $v..." && \
		curl -s $ANDROID_REPOSITORY_URL/build-tools_r$v-linux.zip -o "tmpfile" && \
		mkdir -p $ANDROID_SDK_ROOT/tmp && \
		echo "unzip android build tools $v..." && \
		unzip -q "tmpfile" -d $ANDROID_SDK_ROOT/tmp && rm "tmpfile" && \
		name=$(ls $ANDROID_SDK_ROOT/tmp) && mv $ANDROID_SDK_ROOT/tmp/$name $ANDROID_SDK_ROOT/build-tools/$v && \
		rm -rf $ANDROID_SDK_ROOT/tmp && \
		echo "install android build tools $v success"; \
	done
RUN list="\
21 21.0.1 21.0.2 21.1 21.1.1 21.1.2 \
22 22.0.1 \
23 23.0.1 23.0.2 23.0.3 \
24 24.0.1 24.0.2 24.0.3 \
" && \
	for v in $list; do \
		echo "download android build tools $v..." && \
		curl -s $ANDROID_REPOSITORY_URL/build-tools_r$v-linux.zip -o "tmpfile" && \
		mkdir -p $ANDROID_SDK_ROOT/tmp && \
		echo "unzip android build tools $v..." && \
		unzip -q "tmpfile" -d $ANDROID_SDK_ROOT/tmp && rm "tmpfile" && \
		name=$(ls $ANDROID_SDK_ROOT/tmp) && mv $ANDROID_SDK_ROOT/tmp/$name $ANDROID_SDK_ROOT/build-tools/$v && \
		rm -rf $ANDROID_SDK_ROOT/tmp && \
		echo "install android build tools $v success"; \
	done
RUN list="\
25 25.0.1 25.0.2 25.0.3 \
26 26-rc1 26-rc2 26.0.1 26.0.2 26.0.3 \
27 27.0.1 27.0.2 27.0.3 \
28 28-rc1 28-rc2 28.0.1 28.0.2 28.0.3 \
29 29-rc1 29-rc2 29-rc3 29.0.1 29.0.2 29.0.3 \
30-rc1 30-rc2 \
" && \
	for v in $list; do \
		echo "download android build tools $v..." && \
		curl -s $ANDROID_REPOSITORY_URL/build-tools_r$v-linux.zip -o "tmpfile" && \
		mkdir -p $ANDROID_SDK_ROOT/tmp && \
		echo "unzip android build tools $v..." && \
		unzip -q "tmpfile" -d $ANDROID_SDK_ROOT/tmp && rm "tmpfile" && \
		name=$(ls $ANDROID_SDK_ROOT/tmp) && mv $ANDROID_SDK_ROOT/tmp/$name $ANDROID_SDK_ROOT/build-tools/$v && \
		rm -rf $ANDROID_SDK_ROOT/tmp && \
		echo "install android build tools $v success"; \
	done

# Android platform tools
ENV ANDROID_PLATFORM_TOOLS_VERSION=30.0.3
RUN curl -s \
	-L $ANDROID_REPOSITORY_URL/platform-tools_r$ANDROID_PLATFORM_TOOLS_VERSION-linux.zip \
	-o "tmpfile"
RUN unzip -q "tmpfile" -d $ANDROID_SDK_ROOT
RUN rm "tmpfile"

# Android tools
ENV ANDROID_TOOLS_VERSION=25.2.5
# ENV ANDROID_TOOLS_VERSION=26.1.1
RUN curl -s \
	-L $ANDROID_REPOSITORY_URL/tools_r$ANDROID_TOOLS_VERSION-linux.zip \
	# -L $ANDROID_REPOSITORY_URL/sdk-tools-linux-4333796.zip \
	-o "tmpfile"
RUN unzip -q "tmpfile" -d $ANDROID_SDK_ROOT
RUN rm "tmpfile"

ENV ANDROID_HOME=$ANDROID_SDK_ROOT
ENV PATH=$ANDROID_HOME/bin:$PATH
