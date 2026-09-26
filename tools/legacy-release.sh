#!/bin/bash
# Сборки для старых Linux (Qt5, *-legacy) - на CentOS 7 или Oracle Linux 7.9.
# Ключи: --force, --no-upload. Подробно - в release-build.sh.
exec "$(dirname "$0")/release-build.sh" legacy "$@"
