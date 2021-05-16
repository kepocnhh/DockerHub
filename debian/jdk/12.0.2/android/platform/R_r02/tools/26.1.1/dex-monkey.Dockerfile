FROM kepocnhh/dex-porcupine:0.0.1

# Android tools
env ANDROID_TOOLS_VERSION=26.1.1
run curl -L http://dl.google.com/android/repository/sdk-tools-linux-4333796.zip \
 -o tmpfile && unzip -q tmpfile -d $ANDROID_SDK_ROOT && rm tmpfile
