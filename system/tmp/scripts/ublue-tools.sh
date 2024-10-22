#!/bin/bash

set -euo pipefail

# Install Universal Blue tools
echo "Installing Universal Blue tools"
rpm-ostree install fzf \
/tmp/ublue-os/config/rpms/ublue-os-just.noarch.rpm \
/tmp/ublue-os/config/rpms/ublue-os-luks.noarch.rpm \
/tmp/ublue-os/config/rpms/ublue-os-signing.noarch.rpm \
/tmp/ublue-os/config/rpms/ublue-os-update-services.noarch.rpm
