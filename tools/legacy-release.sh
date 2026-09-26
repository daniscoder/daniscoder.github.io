#!/bin/bash
# Сборки для CentOS 7 (Qt5) - одной командой на виртуальной CentOS 7.
#
# По каждому проекту: git pull; если текущий коммит еще не собран - пересобрать
# через 2exe.py и выложить файл *-legacy в релиз программы на сайте.
# xvelutil_qt только собирается: на сайт он не идет.
#
# Что собрано и что выложено, скрипт помнит по коммиту - в dist/.legacy-built и
# dist/.legacy-uploaded. Поэтому упавшая сборка или загрузка повторяется при
# следующем запуске, даже если новых коммитов нет.
#
# Запуск:
#   ~/daniscoder.github.io/tools/legacy-release.sh             как описано выше
#   ~/daniscoder.github.io/tools/legacy-release.sh --force     пересобрать и выложить все
#   ~/daniscoder.github.io/tools/legacy-release.sh --no-upload собрать, но не выкладывать
#
# Что нужно на машине (как настроено 25.09.2026): проекты склонированы в домашний
# каталог, gcc из devtoolset-11, окружение ~/qt5env по requirements-qt5.txt, gh с
# входом в GitHub. Подробно - в README любого из проектов, раздел про CentOS 7.

REPO=daniscoder/daniscoder.github.io
# проект:тег релиза; без тега - только собрать
PROJECTS="lmoToXY:lmoToXY polygon:polygon histogram_for_reg:histogram_for_reg xvelutil_qt:"

FORCE=0
UPLOAD=1
for arg in "$@"; do
    case "$arg" in
        --force) FORCE=1 ;;
        --no-upload) UPLOAD=0 ;;
        *) echo "неизвестный ключ: $arg" >&2; exit 2 ;;
    esac
done

source /opt/rh/devtoolset-11/enable || exit 1
source ~/qt5env/bin/activate || exit 1
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
        output=dist/xvelutil-legacy
    else
        output=dist/$name-legacy
    fi
    built_stamp=dist/.legacy-built
    uploaded_stamp=dist/.legacy-uploaded

    if [ "$FORCE" = 1 ] || [ ! -f "$output" ] || [ "$(cat "$built_stamp" 2>/dev/null)" != "$head" ]; then
        # Зависимости приходят вместе с кодом; если все уже стоит, это пара секунд
        if ! pip install -q -r requirements-qt5.txt; then
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
echo '=== итог'
echo "собрано:            ${built[*]:-нет}"
echo "выложено в релизы:  ${uploaded[*]:-нет}"
echo "без изменений:      ${skipped[*]:-нет}"
if [ ${#failed[@]} -gt 0 ]; then
    printf 'ошибки:             %s\n' "${failed[@]}"
    exit 1
fi
