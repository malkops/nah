# Домашнее задание к занятию 15 «Система сбора логов Elastic Stack»

## Задание повышенной сложности

Не используйте директорию [help](./help) при выполнении домашнего задания.

## Задание 1

Вам необходимо поднять в докере и связать между собой:

- elasticsearch (hot и warm ноды);
- logstash;
- kibana;
- filebeat.

Logstash следует сконфигурировать для приёма по tcp json-сообщений.

Filebeat следует сконфигурировать для отправки логов docker вашей системы в logstash.

В директории [help](./help) находится манифест docker-compose и конфигурации filebeat/logstash для быстрого 
выполнения этого задания.

Результатом выполнения задания должны быть:

- скриншот `docker ps` через 5 минут после старта всех контейнеров (их должно быть 5);

![image](https://github.com/malkops/nah/assets/44001733/5885864e-c040-4f4b-93bc-83ef2c969bad)

- скриншот интерфейса kibana;

![image](https://github.com/malkops/nah/assets/44001733/9b57eb3c-d068-4f4c-af20-79d92f2db41d)

- docker-compose манифест (если вы не использовали директорию help);
- ваши yml-конфигурации для стека (если вы не использовали директорию help).

Docker-compose.yml и другие конфгурационные файлы модно [найти тут](tmp/elk/04/)

## Задание 2

Перейдите в меню [создания index-patterns  в kibana](http://localhost:5601/app/management/kibana/indexPatterns/create) и создайте несколько index-patterns из имеющихся.

![image](https://github.com/malkops/nah/assets/44001733/e4d63792-8ee7-4595-b11f-72da14b1d763)

Перейдите в меню просмотра логов в kibana (Discover) и самостоятельно изучите, как отображаются логи и как производить поиск по логам.

В манифесте директории help также приведенно dummy-приложение, которое генерирует рандомные события в stdout-контейнера.
Эти логи должны порождать индекс logstash-* в elasticsearch. Если этого индекса нет — воспользуйтесь советами и источниками из раздела «Дополнительные ссылки» этого задания.

![image](https://github.com/malkops/nah/assets/44001733/00671e11-a8bd-4bdd-8701-919af9504b3a)

![image](https://github.com/malkops/nah/assets/44001733/5fe2bdc8-560f-4bf4-a17f-3554baa10d71)
