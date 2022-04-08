#!/bin/sh

set -e

cd /usr/share/osint-suite-tools
exec python3 BuscadorNoticiasFalsas.py "$@"