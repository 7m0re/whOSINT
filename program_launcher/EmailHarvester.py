#!/bin/sh

set -e

cd /usr/share/EmailHarvester
exec python EmailHarvester.py "$@"
