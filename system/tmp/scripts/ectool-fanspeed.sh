#!/bin/bash

set -euo pipefail

# Install ectool
curl -fL https://files.tree123.org/utils/x86_64/gnu/ectool -o /usr/bin/ectool
chmod +x /usr/bin/ectool

systemctl enable ectool-fanspeed
