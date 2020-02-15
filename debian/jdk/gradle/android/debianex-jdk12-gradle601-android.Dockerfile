FROM kepocnhh/debianex-jdk12-gradle601:latest

# Android
ENV ANDROID_HOME=$SDK_HOME/android/sdk
RUN mkdir -p $ANDROID_HOME && mkdir -p $ANDROID_HOME/licenses
RUN echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > $ANDROID_HOME/licenses/android-sdk-license

ENV PATH=$ANDROID_HOME/bin:$PATH
