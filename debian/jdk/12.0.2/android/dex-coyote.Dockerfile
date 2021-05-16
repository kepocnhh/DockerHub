FROM kepocnhh/dex-zebra:0.0.1

# Android
env ANDROID_ROOT=$SDK_HOME/android
env ANDROID_SDK_ROOT=$ANDROID_ROOT/sdk

env mkdir -p $ANDROID_SDK_ROOT

# Android licenses
run mkdir -p $ANDROID_SDK_ROOT/licenses
run echo 24333f8a63b6825ea9c5514f83c2829b004d1fee > $ANDROID_SDK_ROOT/licenses/android-sdk-license

env ANDROID_HOME=$ANDROID_SDK_ROOT
