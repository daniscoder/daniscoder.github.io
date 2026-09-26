#!/bin/bash
# Linux-сборки программ сайта одной командой: git pull, пересборка того, что не
# собрано на текущем коммите, и выкладка в релиз программы. xvelutil_qt только
# собирается: на сайт он не идет.
#
# Режимы - две Linux-сборки, у каждой своя машина:
#   legacy  Qt5, файлы *-legacy - для старых Linux (glibc 2.17). Собирается на
#           CentOS 7 или Oracle Linux 7.9 (WSL): gcc из devtoolset-11, окружение
#           ~/qt5env по requirements-qt5.txt.
#   linux   Qt6, файлы без суффикса - для новых Linux. Собирается на Ubuntu
#           (WSL): окружение ~/qt6env по requirements.txt проекта, скрипт заводит
#           его сам.
# Обычно зовется через обертки legacy-release.sh и linux-release.sh.
#
# Что собрано и что выложено, скрипт помнит по коммиту - в dist/.<режим>-built и
# dist/.<режим>-uploaded. Поэтому упавшая сборка или загрузка повторяется при
# следующем запуске, даже если новых коммитов нет.
#
# Запуск:
#   release-build.sh legacy|linux              как описано выше
#   release-build.sh legacy|linux --force      пересобрать и выложить все
#   release-build.sh legacy|linux --no-upload  собрать, но не выкладывать
#
# На машине: проекты склонированы в домашний каталог, gh с входом в GitHub.

REPO=daniscoder/daniscoder.github.io
# проект:тег релиза; без тега - только собрать
PROJECTS="lmoToXY:lmoToXY polygon:polygon histogram_for_reg:histogram_for_reg xvelutil_qt:"

MODE=${1:-}
shift
case "$MODE" in
    legacy)
        SUFFIX=-legacy
        REQUIREMENTS=requirements-qt5.txt
        source /opt/rh/devtoolset-11/enable || exit 1
        source ~/qt5env/bin/activate || exit 1
        ;;
    linux)
        SUFFIX=
        REQUIREMENTS=requirements.txt
        if [ ! -x ~/qt6env/bin/python ]; then
            python3 -m venv ~/qt6env || exit 1
            ~/qt6env/bin/pip install -q --upgrade pip || exit 1
        fi
        source ~/qt6env/bin/activate || exit 1
        # Сборщик в requirements.txt проектов не входит - он нужен только здесь
        pip install -q nuitka zstandard || exit 1
        ;;
    *)
        echo 'режим: release-build.sh legacy|linux [--force] [--no-upload]' >&2
        exit 2
        ;;
esac

FORCE=0
UPLOAD=1
for arg in "$@"; do
    case "$arg" in
        --force) FORCE=1 ;;
        --no-upload) UPLOAD=0 ;;
        *) echo "неизвестный ключ: $arg" >&2; exit 2 ;;
    esac
done

if [ "$UPLOAD" = 1 ] && ! gh auth status >/dev/null 2>&1; then
    echo 'gh не вошел в GitHub: gh auth login (или запуск с --no-upload)' >&2
    exit 1
fi

built=()
uploaded=()
skipped=()
failed=()

for item in $PROJECTS; do
    name=${item%%:*}
    tag=${item#*:}
    dir=~/$name
    echo
    echo "=== $name"
    if ! cd "$dir" 2>/dev/null; then
        echo "нет каталога $dir - склонируйте проект" >&2
        failed+=("$name: нет каталога")
        continue
    fi
    if ! git pull --ff-only; then
        failed+=("$name: git pull")
        continue
    fi
    head=$(git rev-parse HEAD)

    # У xvelutil_qt файлов два (окно и пакетный режим) - сверяемся по окну
    if [ "$name" = xvelutil_qt ]; then
        output=dist/xvelutil$SUFFIX
    else
        output=dist/$name$SUFFIX
    fi
    built_stamp=dist/.$MODE-built
    uploaded_stamp=dist/.$MODE-uploaded

    if [ "$FORCE" = 1 ] || [ ! -f "$output" ] || [ "$(cat "$built_stamp" 2>/dev/null)" != "$head" ]; then
        # Зависимости приходят вместе с кодом; если все уже стоит, это пара секунд
        if ! pip install -q -r "$REQUIREMENTS"; then
            failed+=("$name: pip install")
            continue
        fi
        if ! python 2exe.py; then
            failed+=("$name: сборка")
            continue
        fi
        echo "$head" > "$built_stamp"
        rm -f "$uploaded_stamp"
        built+=("$name")
    fi

    if [ -n "$tag" ] && [ "$UPLOAD" = 1 ] && [ "$(cat "$uploaded_stamp" 2>/dev/null)" != "$head" ]; then
        if gh release upload "$tag" "$output" --clobber --repo "$REPO"; then
            echo "$head" > "$uploaded_stamp"
            uploaded+=("$name")
        else
            failed+=("$name: загрузка в релиз")
            continue
        fi
    fi

    case " ${built[*]} ${uploaded[*]} " in
        *" $name "*) ;;
        *) echo 'уже собрано и выложено - пропускаю'; skipped+=("$name") ;;
    esac
done

echo
echo "=== итог ($MODE)"
echo "собрано:            ${built[*]:-нет}"
echo "выложено в релизы:  ${uploaded[*]:-нет}"
echo "без изменений:      ${skipped[*]:-нет}"
if [ ${#failed[@]} -gt 0 ]; then
    printf 'ошибки:             %s\n' "${failed[@]}"
    exit 1
fi
