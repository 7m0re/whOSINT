#!/bin/sh

set -e

cd /usr/share/infoga
exec python3 infoga.py "$@"