# Домашнее задание к занятию 14 «Средство визуализации Grafana»

## Задание повышенной сложности

**При решении задания 1** не используйте директорию [help](./help) для сборки проекта. Самостоятельно разверните grafana, где в роли источника данных будет выступать prometheus, а сборщиком данных будет node-exporter:

- grafana;
- prometheus-server;
- prometheus node-exporter.

За дополнительными материалами можете обратиться в официальную документацию grafana и prometheus.

В решении к домашнему заданию также приведите все конфигурации, скрипты, манифесты, которые вы 
использовали в процессе решения задания.

**При решении задания 3** вы должны самостоятельно завести удобный для вас канал нотификации, например, Telegram или email, и отправить туда тестовые события.

В решении приведите скриншоты тестовых событий из каналов нотификаций.

## Обязательные задания

### Задание 1

1. Используя директорию [help](./help) внутри этого домашнего задания, запустите связку prometheus-grafana.
1. Зайдите в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.
1. Подключите поднятый вами prometheus, как источник данных.
1. Решение домашнего задания — скриншот веб-интерфейса grafana со списком подключенных Datasource.

Docker compose и prometheus.yml [лежут тут](tmp/grafana/03/)

![image](https://github.com/malkops/nah/assets/44001733/e6eff30a-f045-4a23-9757-2701d6e0371d)

## Задание 2

Изучите самостоятельно ресурсы:

1. [PromQL tutorial for beginners and humans](https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085).
1. [Understanding Machine CPU usage](https://www.robustperception.io/understanding-machine-cpu-usage).
1. [Introduction to PromQL, the Prometheus query language](https://grafana.com/blog/2020/02/04/introduction-to-promql-the-prometheus-query-language/).

Создайте Dashboard и в ней создайте Panels:

- утилизация CPU для nodeexporter (в процентах, 100-idle); - _**`100 - avg(rate(node_cpu_seconds_total{job="node-exporter", mode="idle"}[$__rate_interval])) by (mode) * 100`**_
- CPULA 1/5/15; - _**`node_load1{instance="$host"}`**_, _**`node_load5{instance="$host"}`**_, _**`node_load15{instance="$host"}`**_
- количество свободной оперативной памяти; - _**`node_memory_MemAvailable_bytes{instance="$host"} / 1073741824`**_
- количество места на файловой системе. - _**`node_filesystem_free_bytes{instance="$host", device=~".+:\\\\134"} / 1073741824`**_

Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.

![image](https://github.com/malkops/nah/assets/44001733/5c90b99a-31a5-45e2-818c-918ff69f4403)

## Задание 3

1. Создайте для каждой Dashboard подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».
1. В качестве решения задания приведите скриншот вашей итоговой Dashboard.

![image](https://github.com/malkops/nah/assets/44001733/bb659012-517c-484a-b5b2-e1a9c6786e17)

![image](https://github.com/malkops/nah/assets/44001733/6e6d8d7a-cf14-4e89-9de7-87303c5e448b)

![image](https://github.com/malkops/nah/assets/44001733/ce10d077-288b-4ea5-9a4c-515ef62065a8)

## Задание 4

1. Сохраните ваш Dashboard. Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
1. В качестве решения задания приведите листинг этого файла.

[JSON model final dashboard](tmp/grafana/03/json_model_dashboard.json)
