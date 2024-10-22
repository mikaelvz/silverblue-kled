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

# Signing
echo "Installing signing policy"
rpm-ostree install yq
.$(dirname "$0")/scripts/signing/signing.sh