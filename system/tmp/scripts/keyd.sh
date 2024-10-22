#!/bin/bash

set -euo pipefail

# Install keyd
echo "Installing keyd"
FEDORA_VERSION=$(rpm -E %fedora)
curl -fL https://copr.fedorainfracloud.org/coprs/alternateved/keyd/repo/fedora-"$FEDORA_VERSION"/alternateved-keyd-fedora-"$FEDORA_VERSION".repo -o /etc/yum.repos.d/_copr:alternateved:keyd.repo
rpm-ostree install keyd
rm -f /etc/yum.repos.d/_copr:alternateved:keyd.repo
systemctl enable keyd

echo "Installing keyd configuration"
# Install keyboard configuration
git clone https://github.com/WeirdTreeThing/cros-keyboard-map /tmp/cros-keyboard-map
mkdir -p /etc/libinput
cp /tmp/cros-keyboard-map/local-overrides.quirks /etc/libinput/local-overrides.quirks
