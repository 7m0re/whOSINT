#!/bin/sh

set -e

cd /usr/share/nexfil
exec python3 nexfil.py "$@"