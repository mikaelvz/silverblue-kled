#!/bin/bash

set -euo pipefail

# Install chromebook audio
echo "Installing chromebook audio"
git clone https://github.com/WeirdTreeThing/chromebook-linux-audio /tmp/chromebook-linux-audio
cd /tmp/chromebook-linux-audio
./setup-audio -b kled
