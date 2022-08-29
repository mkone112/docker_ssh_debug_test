#!/bin/bash

set -euo pipefail
/usr/sbin/sshd -D
exec python /app.py
