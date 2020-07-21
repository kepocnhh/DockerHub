FROM kepocnhh/dex-bighorn:0.0.1

# Gradle Android Warming

RUN mkdir -p warming11
RUN git clone -q \
	--depth=1 \
	--branch=clean \
	https://github.com/kepocnhh/GradleAndroidWarming.git \
	warming11
RUN gradle -p warming11 --refresh-dependencies compileDebugSources
RUN rm -rf warming11
RUN gradle --stop

RUN mkdir -p warming12
RUN git clone -q \
	--depth=1 \
	--branch=clean \
	https://github.com/kepocnhh/GradleAndroidWarming.git \
	warming12
RUN gradle -p warming12 compileDebugSources
RUN rm -rf warming12
RUN gradle --stop

RUN mkdir -p warming13
RUN git clone -q \
	--depth=1 \
	--branch=clean \
	https://github.com/kepocnhh/GradleAndroidWarming.git \
	warming13
RUN gradle -p warming13 assembleDebug
RUN rm -rf warming13
RUN gradle --stop

RUN mkdir -p warming21
RUN git clone -q \
	--depth=1 \
	--branch=clean \
	https://github.com/kepocnhh/GradleAndroidWarming.git \
	warming21
RUN gradle -p warming21 --refresh-dependencies compileReleaseSources
RUN rm -rf warming21
RUN gradle --stop

RUN mkdir -p warming22
RUN git clone -q \
	--depth=1 \
	--branch=clean \
	https://github.com/kepocnhh/GradleAndroidWarming.git \
	warming22
RUN gradle -p warming22 compileReleaseSources
RUN rm -rf warming22
RUN gradle --stop

RUN mkdir -p warming23
RUN git clone -q \
	--depth=1 \
	--branch=clean \
	https://github.com/kepocnhh/GradleAndroidWarming.git \
	warming23
RUN gradle -p warming23 assembleRelease
RUN rm -rf warming23
RUN gradle --stop
