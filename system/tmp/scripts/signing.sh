#!/bin/bash

set -euo pipefail

# Signing
echo "Installing signing policy"
export MODULE_DIRECTORY="$(dirname "$0")"
rpm-ostree install yq \
/tmp/ublue-os/config/rpms/ublue-os-signing.noarch.rpm
.$(dirname "$0")/signing/signing.sh