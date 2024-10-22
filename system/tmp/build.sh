#!/bin/bash

set -euo pipefail

# Variables
echo "Setting up variables"
export IMAGE_NAME="silverblue-kled"
export IMAGE_REGISTRY="ghcr.io/mikaelvz"
export MODULE_DIRECTORY="$(dirname "$0")/scripts"

# Signing
echo "Installing signing policy"
rpm-ostree install yq
.$(dirname "$0")/scripts/signing/signing.sh