#!/bin/sh

set -e

cd /usr/share/EmailHarvester
exec python3 EmailHarvester.py "$@"
