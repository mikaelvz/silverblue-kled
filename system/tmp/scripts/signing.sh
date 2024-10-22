#!/bin/bash

set -euo pipefail

# Signing
echo "Installing signing policy"
export MODULE_DIRECTORY="$(dirname "$0")"
rpm-ostree install yq
.$(dirname "$0")/signing/signing.sh