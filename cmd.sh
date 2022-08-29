#!/bin/bash

set -euo pipefail

# Get env vars in the Dockerfile to show up in the SSH session
eval "$(printenv | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)"

echo "Starting SSH ..."
service ssh start
exec flask run -h 0.0.0.0
