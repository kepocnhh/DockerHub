FROM kepocnhh/debianex-jdk12-gradle601:latest

# Android
ENV ANDROID_HOME=$SDK_HOME/android/sdk
RUN mkdir -p $ANDROID_HOME && mkdir -p $ANDROID_HOME/licenses
RUN echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > $ANDROID_HOME/licenses/android-sdk-license

RUN list="28_r06 29_r04" && \
	mkdir -p $ANDROID_HOME/platforms && \
	for v in $list; do \
		echo "install platform $v..." && \
		curl -s "http://dl.google.com/android/repository/platform-${v}.zip" -o "tmpfile" && \
		mkdir -p $ANDROID_HOME/tmp && \
		unzip -q "tmpfile" -d $ANDROID_HOME/tmp && rm "tmpfile" && \
		oldName=$(ls $ANDROID_HOME/tmp) && \
		newName=$(echo $v | cut -d'_' -f1) && \
		mv $ANDROID_HOME/tmp/$oldName $ANDROID_HOME/platforms/android-$newName && \
		rm -rf $ANDROID_HOME/tmp && \
		echo "install platform $v success"; \
	done

RUN echo "test3"
# RUN exit 1
RUN list="28.0.3 29.0.2 29.0.3" && \
	mkdir -p $ANDROID_HOME/build-tools && \
	for v in $list; do \
		echo "install build tools $v..." && \
		curl -s "http://dl.google.com/android/repository/build-tools_r${v}-linux.zip" -o "tmpfile" && \
		mkdir -p $ANDROID_HOME/tmp && \
		unzip -q "tmpfile" -d $ANDROID_HOME/tmp && rm "tmpfile" && \
		name=$(ls $ANDROID_HOME/tmp) && mv $ANDROID_HOME/tmp/$name $ANDROID_HOME/build-tools/$v && \
		rm -rf $ANDROID_HOME/tmp && \
		echo "install build tools $v success"; \
	done

RUN echo "install platform tools..." && \
	curl -s "http://dl.google.com/android/repository/platform-tools_r29.0.5-linux.zip" -o "tmpfile" && \
	echo "download platform tools success" && \
	unzip -q "tmpfile" -d $ANDROID_HOME/ && rm "tmpfile" && \
	echo "install platform tools success"

ENV PATH=$ANDROID_HOME/bin:$PATH

RUN mkdir -p warming
RUN git clone -q --depth=1 \
	--branch=dev \
	https://github.com/kepocnhh/GradleAndroidWarming.git \
	warming
# RUN gradle -p warming --no-daemon --refresh-dependencies androidDependencies lint
RUN gradle -p warming assembleDebug
RUN rm -rf warming
RUN gradle --stop

# RUN exit 1
RUN mkdir -p warming2
RUN git clone -q --depth=1 \
	--branch=dev \
	https://github.com/kepocnhh/GradleAndroidWarming.git \
	warming2
RUN gradle -p warming2 assembleDebug
RUN rm -rf warming2
RUN gradle --stop

# RUN exit 1
# RUN echo "test2"
# RUN mkdir -p CalendarViewSlider
# RUN git clone -q --depth=1 \
# 	--branch=dev \
# 	https://github.com/StanleyDevelop/CalendarViewSlider.git \
# 	CalendarViewSlider
# RUN gradle -p CalendarViewSlider clean assembleDebug
# RUN rm -rf CalendarViewSlider
# RUN gradle --stop
