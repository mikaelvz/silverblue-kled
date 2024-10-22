#!/bin/bash

set -euo pipefail

# Installing packages
echo "Installing packages"
rpm-ostree override remove \
fdk-aac-free \
mesa-va-drivers \
ffmpeg-free \
libavcodec-free \
libavdevice-free \
libavfilter-free \
libavformat-free \
libavutil-free  \
libpostproc-free \
libswresample-free \
libswscale-free \
firefox \
firefox-langpacks \
--install=libheif-freeworld \
--install=libheif-tools \
--install=intel-media-driver \
--install=gstreamer1-plugin-libav \
--install=gstreamer1-plugins-bad-free-extras \
--install=gstreamer1-plugins-bad-freeworld \
--install=gstreamer1-plugins-ugly \
--install=gstreamer1-vaapi \
--install=ffmpeg \
--install=ffmpeg-libs \
--install=ffmpegthumbnailer \
--install=pipewire-codec-aptx \
--install=mesa-va-drivers-freeworld \
--install=fdk-aac \
--install=gnome-tweaks