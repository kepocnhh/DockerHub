FROM kepocnhh/dex-bighorn:0.0.1

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
