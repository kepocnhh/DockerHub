FROM kepocnhh/debianex-jdk14.0.1-gradle6.5:0.0.1

# Android
ENV ANDROID_ROOT=$SDK_HOME/android
ENV ANDROID_SDK_ROOT=$ANDROID_ROOT/sdk

RUN mkdir -p $ANDROID_SDK_ROOT

# Android licenses
RUN mkdir -p $ANDROID_SDK_ROOT/licenses
RUN echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > $ANDROID_SDK_ROOT/licenses/android-sdk-license
