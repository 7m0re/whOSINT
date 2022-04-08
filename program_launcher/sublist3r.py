#!/bin/sh

set -e

cd /usr/share/Sublist3r
exec python sublist3r.py "$@"