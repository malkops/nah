# Домашнее задание к занятию 5. «Elasticsearch»

## Задача 1

В ответе приведите:

- текст Dockerfile-манифеста,
- ссылку на образ в репозитории dockerhub,
- ответ `Elasticsearch` на запрос пути `/` в json-виде.

_**Так как заполучить доступ до архива эластика не получилось, образ был построен на базе ubuntu и deb пакета из зеркала яндекса.**_

https://hub.docker.com/repository/docker/malkops/elastic/general

```dockerfile
FROM ubuntu:22.10

LABEL maintainer="Create by @malkops"

RUN apt update && apt install -y wget && \
    wget https://mirror.yandex.ru/mirrors/elastic/7/pool/main/e/elasticsearch/elasticsearch-7.17.9-amd64.deb && \
    apt install -y /elasticsearch-7.17.9-amd64.deb && \
    rm -rf /var/lib/yum/lists/* && \
    rm -f elasticsearch-7.17.9-amd64.deb && \
    ulimit -n 65535 && \
    sed "s/## -Xms4g/-Xms4g/" /etc/elasticsearch/jvm.options && \
    sed "s/## -Xmx4g/-Xmx4g/" /etc/elasticsearch/jvm.options

COPY elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
    
EXPOSE 9200 9300

CMD [ "/bin/bash", "-c", "/etc/init.d/elasticsearch start; /bin/bash" ]
```

```json
{
  "name" : "netology_test",
  "cluster_name" : "netology-elastic",
  "cluster_uuid" : "XfWCOUjuQIulGEm8TPSwQw",
  "version" : {
    "number" : "7.17.9",
    "build_flavor" : "default",
    "build_type" : "deb",
    "build_hash" : "ef48222227ee6b9e70e502f0f0daa52435ee634d",
    "build_date" : "2023-01-31T05:34:43.305517834Z",
    "build_snapshot" : false,
    "lucene_version" : "8.11.1",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}
```

## Задача 2

Получите список индексов и их статусов, используя API, и **приведите в ответе** на задание.

```
green  open .geoip_databases zzQN4caYSpOuLC4RKCwtoQ 1 0 42 0 40.7mb 40.7mb
green  open ind-1            OXFq4XWjQhCJBMULs4I1zg 1 0  0 0   226b   226b
yellow open ind-3            2gkj310TSsW5qOop7lKCfA 4 2  0 0   904b   904b
yellow open ind-2            DI3vRo65SKyQDYPdcti5cg 2 1  0 0   452b   452b
```

Получите состояние кластера `Elasticsearch`, используя API.

```
1682667681 07:41:21 netology-elastic yellow 1 1 10 10 0 0 10 0 - 50.0%
```

Как вы думаете, почему часть индексов и кластер находятся в состоянии yellow?

Часть индексов имеет состояние yellow потому что у них есть шарды, которые не привязаны к какой-либо реплике. Сам кластер yellow, так как не все индексы green и не все они могут быть среплецированы на указанное количество реплик (у меня одна нода в кластере, а реплик указано больше).

## Задача 3

В этом задании вы научитесь:

- создавать бэкапы данных,
- восстанавливать индексы из бэкапов.

Создайте директорию `{путь до корневой директории с Elasticsearch в образе}/snapshots`.

Используя API, [зарегистрируйте](https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-register-repository.html#snapshots-register-repository) 
эту директорию как `snapshot repository` c именем `netology_backup`.

**Приведите в ответе** запрос API и результат вызова API для создания репозитория.

```bash
curl -X PUT "localhost:9200/_snapshot/netology_backup?pretty" -H 'Content-Type: application/json' -d' { "type": "fs", "settings": { "location": "/var/lib/elasticsearch/snapshots" } } '
{
  "acknowledged" : true
}
```

Создайте индекс `test` с 0 реплик и 1 шардом и **приведите в ответе** список индексов.

```
green open .geoip_databases sVqn4LTvQJ660uFXmyz3Tg 1 0 42 0 40.7mb 40.7mb
green open test             md74YCBEQWO2H2riUW6i8Q 1 0  0 0   226b   226b
```

[Создайте `snapshot`](https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-take-snapshot.html) 
состояния кластера `Elasticsearch`.

**Приведите в ответе** список файлов в директории со `snapshot`.
```bash
ll /var/lib/elasticsearch/snapshots
total 44
drwxr-sr-x. 3 elasticsearch elasticsearch   134 Apr 28 08:11 ./
drwxr-s---. 1 elasticsearch elasticsearch    36 Apr 28 08:03 ../
-rw-r--r--. 1 elasticsearch elasticsearch  1431 Apr 28 08:11 index-0
-rw-r--r--. 1 elasticsearch elasticsearch     8 Apr 28 08:11 index.latest
drwxr-sr-x. 6 elasticsearch elasticsearch   126 Apr 28 08:11 indices/
-rw-r--r--. 1 elasticsearch elasticsearch 29229 Apr 28 08:11 meta-pRUQbXllQgKoJP8_BGvIhQ.dat
-rw-r--r--. 1 elasticsearch elasticsearch   718 Apr 28 08:11 snap-pRUQbXllQgKoJP8_BGvIhQ.dat
```

Удалите индекс `test` и создайте индекс `test-2`. **Приведите в ответе** список индексов.

```
green open test-2           FyU-b4HBSMCvTLW_aRGnkw 1 0  0 0   226b   226b
green open .geoip_databases sVqn4LTvQJ660uFXmyz3Tg 1 0 42 0 40.7mb 40.7mb
```

[Восстановите](https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-restore-snapshot.html) состояние
кластера `Elasticsearch` из `snapshot`, созданного ранее. 

**Приведите в ответе** запрос к API восстановления и итоговый список индексов.

```bash
curl -X POST "localhost:9200/_snapshot/netology_backup/snapshot_2023.04.28/_restore?pretty" -H 'Content-Type: application/json' -d' { "indices": "test" } '
```

```
green open .geoip_databases sVqn4LTvQJ660uFXmyz3Tg 1 0 42 0 40.7mb 40.7mb
green open test             4RYBrHJURnelKJMOtbfGvg 1 0  0 0   226b   226b
```
