FROM kepocnhh/debianex-jdk12-gradle601-android:latest

# Gradle Android Warming
RUN mkdir -p warming
RUN git clone -q --depth=1 \
	--branch=dev \
	https://github.com/kepocnhh/GradleAndroidWarming.git \
	warming
RUN gradle -p warming clean compileDebugSources
RUN gradle -p warming clean assembleDebug
RUN gradle -p warming clean compileReleaseSources
RUN gradle -p warming clean assembleRelease
RUN rm -rf warming
