#!/bin/bash

set -euo pipefail

# Variables
echo "Setting up variables"
export IMAGE_NAME="silverblue-kled"
export IMAGE_REGISTRY="ghcr.io/mikaelvz"
export MODULE_DIRECTORY="$(dirname "$0")/scripts"

# Installing RPM Fusion repositories
echo "Installing RPM Fusion repositories"
rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

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

# Signing
echo "Installing signing policy"
rpm-ostree install yq
.$(dirname "$0")/scripts/signing/signing.sh