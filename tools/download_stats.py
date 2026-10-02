#!/usr/bin/env python3
"""Статистика скачиваний программ сайта по счетчикам релизов GitHub.

Счетчик у файла релиза обнуляется при каждой перевыкладке (gh release upload
--clobber удаляет файл и создает новый, с новым id). Поэтому счетчики копятся в
журнале stats/downloads.csv: строка - дата, тег, файл, id файла и счетчик, пишется,
только когда счетчик изменился или файл новый. Итог по файлу - сумма по всем его
id наибольших счетчиков. Что скачали между последним снимком и перевыкладкой,
теряется - поэтому перед выпуском снимок стоит сделать руками (см. ниже).

Запуск:
  download_stats.py snapshot   дописать журнал текущими счетчиками (так делает
                               GitHub Action раз в 6 часов, .github/workflows/stats.yml)
  download_stats.py            итог по программам и файлам: журнал + текущие счетчики

Перед выпуском: gh workflow run stats.yml --repo daniscoder/daniscoder.github.io
(и дождаться) - или snapshot здесь и коммит журнала.

Нужен только Python 3. Токен - из GITHUB_TOKEN, если задан (в Action), иначе
запросы без него: для публичного репозитория хватает 60 в час.
"""
import csv
import datetime
import json
import os
import sys
import urllib.request
from collections import defaultdict
from pathlib import Path

REPO = 'daniscoder/daniscoder.github.io'
LOG = Path(__file__).resolve().parent.parent / 'stats' / 'downloads.csv'
FIELDS = ['date', 'tag', 'asset', 'asset_id', 'count']


def current():
    """Все файлы всех релизов: (тег, файл, id, счетчик)."""
    rows, page = [], 1
    while True:
        request = urllib.request.Request(
            f'https://api.github.com/repos/{REPO}/releases?per_page=100&page={page}',
            headers={'Accept': 'application/vnd.github+json'})
        token = os.environ.get('GITHUB_TOKEN')
        if token:
            request.add_header('Authorization', f'Bearer {token}')
        with urllib.request.urlopen(request, timeout=60) as response:
            releases = json.load(response)
        if not releases:
            return rows
        for release in releases:
            for asset in release['assets']:
                rows.append((release['tag_name'], asset['name'], str(asset['id']),
                             asset['download_count']))
        page += 1


def read_log():
    if not LOG.is_file():
        return []
    with open(LOG, newline='', encoding='utf-8') as f:
        return list(csv.DictReader(f))


def snapshot():
    last = {}
    for row in read_log():
        last[row['asset_id']] = int(row['count'])
    today = datetime.datetime.now(datetime.timezone.utc).strftime('%Y-%m-%d %H:%M')
    new = [dict(zip(FIELDS, (today, tag, name, asset_id, count)))
           for tag, name, asset_id, count in current() if last.get(asset_id) != count]
    if not new:
        print('счетчики не изменились')
        return
    LOG.parent.mkdir(exist_ok=True)
    fresh = not LOG.is_file()
    with open(LOG, 'a', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, FIELDS, lineterminator='\n')
        if fresh:
            writer.writeheader()
        writer.writerows(new)
    for row in new:
        print(f"{row['tag']}/{row['asset']}: {row['count']}")


def report():
    best = {}       # id файла -> (тег, файл, наибольший счетчик)
    for row in read_log():
        key = row['asset_id']
        count = int(row['count'])
        if key not in best or count > best[key][2]:
            best[key] = (row['tag'], row['asset'], count)
    for tag, name, asset_id, count in current():
        if asset_id not in best or count > best[asset_id][2]:
            best[asset_id] = (tag, name, count)
    by_file = defaultdict(int)
    for tag, name, count in best.values():
        by_file[(tag, name)] += count
    by_tag = defaultdict(int)
    for (tag, name), count in by_file.items():
        by_tag[tag] += count
    for tag in sorted(by_tag, key=lambda t: -by_tag[t]):
        print(f'{tag}: {by_tag[tag]}')
        for (t, name), count in sorted(by_file.items()):
            if t == tag:
                print(f'    {name}: {count}')
    print(f'всего: {sum(by_tag.values())}')


if __name__ == '__main__':
    if sys.argv[1:] == ['snapshot']:
        snapshot()
    elif not sys.argv[1:]:
        report()
    else:
        sys.exit(__doc__)
