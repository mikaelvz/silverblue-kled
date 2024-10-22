#!/bin/bash

set -euo pipefail

# Variables
echo "Setting up variables"
export IMAGE_NAME="silverblue-kled"
export IMAGE_REGISTRY="ghcr.io/mikaelvz"
export SCRIPTS_DIRECTORY="$(dirname "$0")/scripts"

# Build steps
.$SCRIPTS_DIRECTORY/rpmfusion.sh
.$SCRIPTS_DIRECTORY/packages.sh
.$SCRIPTS_DIRECTORY/keyd.sh
.$SCRIPTS_DIRECTORY/chromebook-audio.sh
.$SCRIPTS_DIRECTORY/ectool-fanspeed.sh
.$SCRIPTS_DIRECTORY/signing.sh
