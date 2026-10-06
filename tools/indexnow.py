#!/usr/bin/env python3
"""Сообщить поисковикам по протоколу IndexNow, что страницы сайта обновились.

Берет все адреса из выложенного sitemap.xml и отправляет их одним запросом на
api.indexnow.org - оттуда уведомление расходится всем участникам протокола, среди
них Яндекс и Bing. Без этого они узнают об изменениях только при очередном обходе.

Ключ подтверждает, что сайт наш: файл docs/<ключ>.txt с ним же внутри лежит в
корне сайта. Ключ не секретный, его видит любой; удалить или переименовать файл -
значит отправка перестанет приниматься.

Запуск: так делает GitHub Action после каждой выкладки (.github/workflows/pages.yml),
руками - python tools/indexnow.py. Нужен только Python 3.
"""

import json
import sys
import urllib.error
import urllib.request
import xml.etree.ElementTree as ET

SITE = 'https://daniscoder.github.io'
KEY = '4a2d5985590abb1c4714f7c0b9c5fc7c'
ENDPOINT = 'https://api.indexnow.org/indexnow'
SITEMAP_NS = '{http://www.sitemaps.org/schemas/sitemap/0.9}'


def sitemap_urls():
    with urllib.request.urlopen(f'{SITE}/sitemap.xml', timeout=30) as response:
        root = ET.fromstring(response.read())
    return [loc.text.strip() for loc in root.iter(f'{SITEMAP_NS}loc')]


def main():
    urls = sitemap_urls()
    body = json.dumps({
        'host': SITE.split('://', 1)[1],
        'key': KEY,
        'keyLocation': f'{SITE}/{KEY}.txt',
        'urlList': urls,
    }).encode()
    request = urllib.request.Request(
        ENDPOINT, data=body, headers={'Content-Type': 'application/json; charset=utf-8'})
    try:
        with urllib.request.urlopen(request, timeout=30) as response:
            status = response.status
    except urllib.error.HTTPError as error:
        print(f'IndexNow отказал: {error.code} {error.reason}, адресов {len(urls)}')
        return 1
    # 200 - принято, 202 - принято, ключ еще проверяется
    print(f'IndexNow: {status}, отправлено адресов {len(urls)}')
    return 0


if __name__ == '__main__':
    sys.exit(main())
