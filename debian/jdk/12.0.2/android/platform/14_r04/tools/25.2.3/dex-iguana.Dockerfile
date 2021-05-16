from kepocnhh/dex-meerkat:0.0.1

# Android tools
env ANDROID_TOOLS_VERSION=25.2.3
run curl -L http://dl.google.com/android/repository/tools_r${ANDROID_TOOLS_VERSION}-linux.zip \
 -o tmpfile && unzip -q tmpfile -d $ANDROID_SDK_ROOT && rm tmpfile
