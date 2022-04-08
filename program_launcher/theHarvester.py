#!/bin/sh

set -e

cd /usr/share/theHarvester
exec python3 theHarvester.py "$@"