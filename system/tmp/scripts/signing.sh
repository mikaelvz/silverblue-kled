#!/bin/bash

set -euo pipefail

rpm-ostree install yq
export MODULE_DIRECTORY="$(dirname "$0")"
.$(dirname "$0")/signing/signing.sh
