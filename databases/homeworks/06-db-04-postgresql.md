## Задача 1

Используя Docker, поднимите инстанс PostgreSQL (версию 13). Данные БД сохраните в volume.

Подключитесь к БД PostgreSQL, используя `psql`.

Воспользуйтесь командой `\?` для вывода подсказки по имеющимся в `psql` управляющим командам.

**Найдите и приведите** управляющие команды для:

- вывода списка БД, - \l
- подключения к БД, - \c
- вывода списка таблиц, - \dt
- вывода описания содержимого таблиц, - \dS+ NAME
- выхода из psql. - \q

## Задача 2

Используя `psql`, создайте БД `test_database`.

Изучите [бэкап БД](https://github.com/netology-code/virt-homeworks/tree/virt-11/06-db-04-postgresql/test_data).

Восстановите бэкап БД в `test_database`.

Перейдите в управляющую консоль `psql` внутри контейнера.

Подключитесь к восстановленной БД и проведите операцию ANALYZE для сбора статистики по таблице.

Используя таблицу [pg_stats](https://postgrespro.ru/docs/postgresql/12/view-pg-stats), найдите столбец таблицы `orders` 
с наибольшим средним значением размера элементов в байтах.

**Приведите в ответе** команду, которую вы использовали для вычисления, и полученный результат.

```sql
SELECT attname, avg_width FROM pg_stats WHERE avg_width = (SELECT MAX(avg_width) FROM pg_stats WHERE tablename = 'orders');

 attname | avg_width 
---------+-----------
 title   |        16
(1 row)
```

## Задача 3

Архитектор и администратор БД выяснили, что ваша таблица orders разрослась до невиданных размеров и
поиск по ней занимает долгое время. Вам как успешному выпускнику курсов DevOps в Нетологии предложили
провести разбиение таблицы на 2: партицировать на orders_1 - price>499 и orders_2 - price<=499.

Предложите SQL-транзакцию для проведения этой операции.

_**Удивительно, что этим не занялся администратор БД, иначе зачем он вообще нужен?)**_

_**Для этого метода понадобится невиданных размеров диск, так как проиходит полное копирование данных.**_

```SQL
BEGIN;

--- rename table and index for delete in the future
ALTER TABLE orders RENAME TO orders_old;
ALTER INDEX orders_pkey RENAME TO orders_pkey_old;

-- create master partition table
CREATE TABLE public.orders (
    id integer NOT NULL,
    title character varying(80) NOT NULL,
    price integer DEFAULT 0
)
PARTITION BY RANGE (price);

-- create data partition tables
CREATE TABLE orders_1 PARTITION OF orders
FOR VALUES FROM (MINVALUE) TO (499);

CREATE TABLE orders_2 PARTITION OF orders
FOR VALUES FROM (499) TO (MAXVALUE);

-- copy data
INSERT INTO orders (id, title, price)
SELECT id, title, price FROM orders_old;

-- remove old table
DROP TABLE orders_old;

END;

-- COMMIT;
```

Можно ли было изначально исключить ручное разбиение при проектировании таблицы orders?

_**Изначально можно было создать мастер таблицу, которая уже работала бы с партицированными таблицами. [Пример](https://pgdash.io/blog/postgres-11-sharding.html)**_

## Задача 4

Используя утилиту `pg_dump`, создайте бекап БД `test_database`.

Как бы вы доработали бэкап-файл, чтобы добавить уникальность значения столбца `title` для таблиц `test_database`?

Я бы добавил `UNIQE` в строку `title character varying(80) NOT NULL` - `title character varying(80) UNIQE NOT NULL`
