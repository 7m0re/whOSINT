#!/bin/sh

set -e

cd /usr/share/spiderfoot-3.5
exec python3 sf.py "$@"