#!/bin/bash

set -euo pipefail

# Install chromebook audio
echo "Installing chromebook audio"
git clone https://github.com/WeirdTreeThing/chromebook-linux-audio /tmp/chromebook-linux-audio
cd /tmp/chromebook-linux-audio
git reset --hard 2002c72e108c99b822d94e1b383f68a00d7cca9d
./setup-audio -b kled
