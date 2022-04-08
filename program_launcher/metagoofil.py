#!/bin/sh

set -e

cd /usr/share/metagoofil
exec python metagoofil.py "$@"