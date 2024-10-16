#!/bin/bash

set -ouex pipefail

# Install keyd
FEDORA_VERSION=$(rpm -E %fedora)
curl -fL https://copr.fedorainfracloud.org/coprs/alternateved/keyd/repo/fedora-"$FEDORA_VERSION"/alternateved-keyd-fedora-"$FEDORA_VERSION".repo -o /etc/yum.repos.d/_copr:alternateved:keyd.repo
rpm-ostree install keyd
systemctl enable keyd

# Install keyboard configuration
mkdir -p /etc/keyd
cp /tmp/cros.conf /etc/keyd

git clone https://github.com/WeirdTreeThing/cros-keyboard-map /tmp/cros-keyboard-map
mkdir -p /etc/libinput
cp /tmp/cros-keyboard-map/local-overrides.quirks /etc/libinput/local-overrides.quirks

# Install SOF
git clone https://github.com/WeirdTreeThing/chromebook-linux-audio /tmp/chromebook-linux-audio
cp -r /tmp/chromebook-linux-audio/conf/sof/tplg/* /lib/firmware/intel/sof-tplg/

# Install UCM configuration
git clone https://github.com/WeirdTreeThing/chromebook-ucm-conf /tmp/chromebook-ucm-conf
cp -r /tmp/chromebook-ucm-conf/cml/* /usr/share/alsa/ucm2/conf.d
cp -r /tmp/chromebook-ucm-conf/common/* /usr/share/alsa/ucm2/common
cp -r /tmp/chromebook-ucm-conf/codecs/* /usr/share/alsa/ucm2/codecs
cp -r /tmp/chromebook-ucm-conf/platforms/* /usr/share/alsa/ucm2/platforms

mkdir -p /usr/share/alsa/ucm2/conf.d/sof-rt5682
cp -r /tmp/chromebook-ucm-conf/sof-rt5682/* /usr/share/alsa/ucm2/conf.d/sof-rt5682

mkdir -p /usr/share/alsa/ucm2/conf.d/sof-cs42l42
cp -r /tmp/chromebook-ucm-conf/sof-cs42l42/* /usr/share/alsa/ucm2/conf.d/sof-cs42l42

# Install ectool
curl -fL https://files.tree123.org/utils/x86_64/gnu/ectool -o /usr/bin/ectool
chmod a+x /usr/bin/ectool

systemctl enable ectool-fanspeed