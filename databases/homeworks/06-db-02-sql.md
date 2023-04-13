## Задача 1

Используя Docker, поднимите инстанс PostgreSQL (версию 12) c 2 volume, 
в который будут складываться данные БД и бэкапы.

Приведите получившуюся команду или docker-compose-манифест.

```yaml
services:
  postgres:
    image: postgres:12
    environment:
      POSTGRES_DB: "test_db"
      POSTGRES_USER: "test-admin-user"
      POSTGRES_PASSWORD: ""
      PGDATA: "/var/lib/postgresql/data/pgdata"
    volumes:
      - /home/user/docker/data=/var/lib/postgresql/data/pgdata
      - /home/user/docker/backup:/var/lib/postgresql/backup
    ports:
      - "5432:5432"
```

## Задача 2

В БД из задачи 1: 

- создайте пользователя test-admin-user и БД test_db;
- в БД test_db создайте таблицу orders и clients (спeцификация таблиц ниже);
- предоставьте привилегии на все операции пользователю test-admin-user на таблицы БД test_db;
- создайте пользователя test-simple-user;
- предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE этих таблиц БД test_db.

Таблица orders:

- id (serial primary key);
- наименование (string);
- цена (integer).

Таблица clients:

- id (serial primary key);
- фамилия (string);
- страна проживания (string, index);
- заказ (foreign key orders).

Приведите:

- итоговый список БД после выполнения пунктов выше;

![image](https://user-images.githubusercontent.com/44001733/231746568-1d778abf-ea22-4c3a-9007-5d93617da385.png)

- описание таблиц (describe);

![image](https://user-images.githubusercontent.com/44001733/231751362-89a43419-0176-4652-93b1-4e05a450fdc5.png)

- SQL-запрос для выдачи списка пользователей с правами над таблицами test_db;

```sql
SELECT grantee, table_name, privilege_type  
FROM information_schema.role_table_grants 
WHERE table_name in ('orders', 'clients');
```

- список пользователей с правами над таблицами test_db.

![image](https://user-images.githubusercontent.com/44001733/231748188-4d2f69ed-0a9e-4c4e-ab85-8e57b6794d3d.png)

## Задача 3

Используя SQL-синтаксис, наполните таблицы следующими тестовыми данными:

Таблица orders

|Наименование|цена|
|------------|----|
|Шоколад| 10 |
|Принтер| 3000 |
|Книга| 500 |
|Монитор| 7000|
|Гитара| 4000|

Таблица clients

|ФИО|Страна проживания|
|------------|----|
|Иванов Иван Иванович| USA |
|Петров Петр Петрович| Canada |
|Иоганн Себастьян Бах| Japan |
|Ронни Джеймс Дио| Russia|
|Ritchie Blackmore| Russia|

Используя SQL-синтаксис:
- вычислите количество записей для каждой таблицы.

Приведите в ответе:

    - запросы,
    - результаты их выполнения.

```sql
INSERT INTO orders (name, price) VALUES 
    ('Шоколад', 10), 
    ('Принтер', 3000), 
    ('Книга', 500), 
    ('Монитор', 7000), 
    ('Гитара', 4000);
    
>> INSERT 0 5

INSERT INTO clients (surname, country) VALUES 
    ('Иванов Иван Иванович', 'USA'), 
    ('Петров Петр Петрович', 'Canada'), 
    ('Иоганн Себастьян Бах', 'Japan'), 
    ('Ронни Джеймс Дио', 'Russia'), 
    ('Ritchie Blackmore', 'Russia');

>> INSERT 0 5
```

## Задача 4

Часть пользователей из таблицы clients решили оформить заказы из таблицы orders.

Используя foreign keys, свяжите записи из таблиц, согласно таблице:

|ФИО|Заказ|
|------------|----|
|Иванов Иван Иванович| Книга |
|Петров Петр Петрович| Монитор |
|Иоганн Себастьян Бах| Гитара |

Приведите SQL-запросы для выполнения этих операций.

```sql
UPDATE clients SET order_id = '3' WHERE surname = 'Иванов Иван Иванович';
UPDATE clients SET order_id = '4' WHERE surname = 'Петров Петр Петрович';
UPDATE clients SET order_id = '5' WHERE surname = 'Иоганн Себастьян Бах';
```

Приведите SQL-запрос для выдачи всех пользователей, которые совершили заказ, а также вывод этого запроса.
 
```sql
SELECT * FROM clients;

 id |       surname        | country | order_id 
----+----------------------+---------+----------
  4 | Ронни Джеймс Дио     | Russia  |         
  5 | Ritchie Blackmore    | Russia  |         
  1 | Иванов Иван Иванович | USA     |        3
  2 | Петров Петр Петрович | Canada  |        4
  3 | Иоганн Себастьян Бах | Japan   |        5
```

## Задача 5

Получите полную информацию по выполнению запроса выдачи всех пользователей из задачи 4 
(используя директиву EXPLAIN).

Приведите получившийся результат и объясните, что значат полученные значения.

```sql
EXPLAIN ANALYZE SELECT * FROM clients;
                                             QUERY PLAN                                              
-----------------------------------------------------------------------------------------------------
 Seq Scan on clients  (cost=0.00..18.10 rows=810 width=72) (actual time=0.007..0.008 rows=5 loops=1)
 Planning Time: 0.034 ms
 Execution Time: 0.015 ms
(3 rows)
```

- `Seq Scan` - последовательное сканирование строк таблицы
- `on clients` - таблица для сканирования
- `cost=0.00..18.10 rows=810 width=72` - 00 = приблизительная стоимость запуска, т.е. время, прежде чем начнётся этап вывода данных; 18.10 = общая стоимость запуска и чтения всех строк; rows=810 - ожидаемое число строк; width=72 - размер вывода в байтах
- `actual time=0.007..0.008 rows=5 loops=1` - фактические результаты

## Задача 6

Создайте бэкап БД test_db и поместите его в volume, предназначенный для бэкапов (см. задачу 1).

Остановите контейнер с PostgreSQL, но не удаляйте volumes.

Поднимите новый пустой контейнер с PostgreSQL.

Восстановите БД test_db в новом контейнере.

Приведите список операций, который вы применяли для бэкапа данных и восстановления. 

Для дампа:

`pg_dumpall -c -U test-admin-user > dump.sql`

Для бэкапа:

`cat dump.sql | docker exec -i pgsql-postgres-1 psql -U test-admin-user -d test_db`
