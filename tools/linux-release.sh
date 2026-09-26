#!/bin/bash
# Сборки для новых Linux (Qt6, файлы без суффикса) - на Ubuntu в WSL.
# Ключи: --force, --no-upload. Подробно - в release-build.sh.
exec "$(dirname "$0")/release-build.sh" linux "$@"
