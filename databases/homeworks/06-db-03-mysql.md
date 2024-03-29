## Задача 1

Найдите команду для выдачи статуса БД и **приведите в ответе** из её вывода версию сервера БД.

**Приведите в ответе** количество записей с `price` > 300.

_`Server version:         8.0.32 MySQL Community Server - GPL`_

![image](https://user-images.githubusercontent.com/44001733/232265961-59fea4e7-72db-4253-8279-7eb831cf8a91.png)

## Задача 2

Создайте пользователя test в БД c паролем test-pass, используя:

- плагин авторизации mysql_native_password
- срок истечения пароля — 180 дней 
- количество попыток авторизации — 3 
- максимальное количество запросов в час — 100
- аттрибуты пользователя:
    - Фамилия "Pretty"
    - Имя "James".

Предоставьте привелегии пользователю `test` на операции SELECT базы `test_db`.
    
Используя таблицу INFORMATION_SCHEMA.USER_ATTRIBUTES, получите данные по пользователю `test` и 
**приведите в ответе к задаче**.

![image](https://user-images.githubusercontent.com/44001733/232266742-31b2e4bb-1589-4a59-adb8-b1d7ec09d12a.png)

## Задача 3

Установите профилирование `SET profiling = 1`.
Изучите вывод профилирования команд `SHOW PROFILES;`.

Исследуйте, какой `engine` используется в таблице БД `test_db` и **приведите в ответе**.

Используется `InnoDB`;

![image](https://user-images.githubusercontent.com/44001733/232267549-e106aad3-535f-4119-b645-3fe65b2f75ba.png)

Измените `engine` и **приведите время выполнения и запрос на изменения из профайлера в ответе**:
- на `MyISAM`,
- на `InnoDB`.

![image](https://user-images.githubusercontent.com/44001733/232269121-758a52c5-abac-4342-bae8-92663c94b3ae.png)

## Задача 4 

Изучите файл `my.cnf` в директории /etc/mysql.

Измените его согласно ТЗ (движок InnoDB):

- скорость IO важнее сохранности данных;
- нужна компрессия таблиц для экономии места на диске;
- размер буффера с незакомиченными транзакциями 1 Мб;
- буффер кеширования 30% от ОЗУ;
- размер файла логов операций 100 Мб.

Приведите в ответе изменённый файл `my.cnf`.

```ini
[mysqld]
skip-host-cache
skip-name-resolve
datadir=/var/lib/mysql
socket=/var/run/mysqld/mysqld.sock
secure-file-priv=/var/lib/mysql-files
user=mysql

# added for task 4
innodb_flush_log_at_trx_commit = 2
innodb_compression_level       = 9 # default 6, 0 to 9
innodb_log_buffer_size         = 1M
innodb_buffer_pool_size        = 4096M
innodb_log_file_size           = 100M

pid-file=/var/run/mysqld/mysqld.pid
[client]
socket=/var/run/mysqld/mysqld.sock

!includedir /etc/mysql/conf.d/
```
