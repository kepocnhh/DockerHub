FROM kepocnhh/deb-j12.0.2-g6.5-a-bt29.0.3-p28_r06-pt30.0.3:0.0.1

# Gradle Android Warming
RUN mkdir -p warming
RUN git clone -q \
	--depth=1 \
	--branch=ktl1.3.70-tbg4.0.0-bt29.0.3 \
	https://github.com/kepocnhh/GradleAndroidWarming.git \
	warming

RUN gradle -p warming --refresh-dependencies compileDebugSources

RUN rm -rf warming
RUN gradle --stop
