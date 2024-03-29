# Домашнее задание к занятию 13 «Введение в мониторинг»

## Обязательные задания

1. Вас пригласили настроить мониторинг на проект. На онбординге вам рассказали, что проект представляет из себя платформу для вычислений с выдачей текстовых отчётов, которые сохраняются на диск. 
Взаимодействие с платформой осуществляется по протоколу http. Также вам отметили, что вычисления загружают ЦПУ. Какой минимальный набор метрик вы выведите в мониторинг и почему?

_**Минимальные метрики для сбора: нагрузку ЦПУ, количество inode, заполненность диска, скорость записи и чтения диска, статус http сервера, пропускную способность сети.**_

_**Данные метрики выбрал, так как они непосредственно используются при работе проекта.**_

2. Менеджер продукта, посмотрев на ваши метрики, сказал, что ему непонятно, что такое RAM/inodes/CPUla. Также он сказал, что хочет понимать, насколько мы выполняем свои обязанности перед клиентами и какое качество обслуживания. Что вы можете ему предложить?

**_Для него можно вынести отдельные метрики SLA, SLO, SLI. Чему будут раны эти метрики, можно договориться внутри команды + вычислить на основании этой договоренности текущий SLI._**

_**Дополнение после проверки: RAM - мониторинг оперативной памяти (всего, свободно, занято), inodes - количество файловых дескриптором (т.е. сколько файлов еще можно создать в системе), CPUla - показатель средней загрузки центрального процессора за разные промежутки времени (например, 1 мин, 5 мин, 15 мин).**_

3. Вашей DevOps-команде в этом году не выделили финансирование на построение системы сбора логов. Разработчики, в свою очередь, хотят видеть все ошибки, которые выдают их приложения. Какое решение вы можете предпринять в этой ситуации, чтобы разработчики получали ошибки приложения?

_**Поверхностный гуглеж показал что есть Rollbar или sentry. Либо попросить разработчиков логировать ошибка в отдельный файл. Либо попросить разработчиков собирать ошибки и превращать их в метрики, а мы их будем показывать в мониторинге (если он есть).**_

_**Дополнение, после проверки: Rollbar и доработки приложения не подойдут, остается Sentry.**_

4. Вы, как опытный SRE, сделали мониторинг, куда вывели отображения выполнения SLA = 99% по http-кодам ответов. 
Этот параметр вычисляется по формуле: summ_2xx_requests/summ_all_requests. Он не поднимается выше 70%, но при этом в вашей системе нет кодов ответа 5xx и 4xx. Где у вас ошибка?

_**В данной формуле не учтены ошибки 1хх и 3хх, т.е. формула должна быть summ_2xx_requests/(summ_all_requests-summ_1xx_requests-summ_3xx_requests)**_

5. Опишите основные плюсы и минусы pull и push систем мониторинга.

**_Push:короткоживущие,_**
- _**Плюсы: Легче получить данные с внешних либо пользовательских устройств, легче масштабируется**_
- _**Минусы: появляется сильная зависимость между приложением и системой мониторинга, более длительный поиск причин недоступности ноды, сложнее настраивать конфигурацию сбора (тапк как есть агенты)**_

**_Pull:_**
- _**Плюсы: слабая зависимость между приложением и системой мониторинга, быстрое обнаружение недоступность ноды, легче настраивать конфигурацию сбора**_
- _**Минусы: довольно сложно добиться получения метрик с внешних устройств (например приложение на телефоне), чуит сложнее масштабируется**_

6. Какие из ниже перечисленных систем относятся к push модели, а какие к pull? А может есть гибридные?

    - Prometheus **_- в первоначальном виде pull, но с push-gateway можно рабоать как с push_**
    - TICK **_- push_**
    - Zabbix **_- гибрид_**
    - VictoriaMetrics **_- гибрид_**
    - Nagios **_- push_**

7. Склонируйте себе [репозиторий](https://github.com/influxdata/sandbox/tree/master) и запустите TICK-стэк, 
используя технологии docker и docker-compose.

В виде решения на это упражнение приведите скриншот веб-интерфейса ПО chronograf (`http://localhost:8888`). 

P.S.: если при запуске некоторые контейнеры будут падать с ошибкой - проставьте им режим `Z`, например
`./data:/var/lib:Z`

![image](https://github.com/malkops/nah/assets/44001733/d767bf1a-3e5e-4275-ba1d-cb42acc78d3c)

8. Перейдите в веб-интерфейс Chronograf (http://localhost:8888) и откройте вкладку Data explorer.
        
    - Нажмите на кнопку Add a query
    - Изучите вывод интерфейса и выберите БД telegraf.autogen
    - В `measurments` выберите cpu->host->telegraf-getting-started, а в `fields` выберите usage_system. Внизу появится график утилизации cpu.
    - Вверху вы можете увидеть запрос, аналогичный SQL-синтаксису. Поэкспериментируйте с запросом, попробуйте изменить группировку и интервал наблюдений.

Для выполнения задания приведите скриншот с отображением метрик утилизации cpu из веб-интерфейса.

![image](https://github.com/malkops/nah/assets/44001733/52a94d65-512e-4094-a68c-8518f916b1f2)

9. Изучите список [telegraf inputs](https://github.com/influxdata/telegraf/tree/master/plugins/inputs). 
Добавьте в конфигурацию telegraf следующий плагин - [docker](https://github.com/influxdata/telegraf/tree/master/plugins/inputs/docker):
```
[[inputs.docker]]
  endpoint = "unix:///var/run/docker.sock"
```

![image](https://github.com/malkops/nah/assets/44001733/f058c904-34ac-4db4-befe-a5b66d2e8172)

---

Вы устроились на работу в стартап. На данный момент у вас нет возможности развернуть полноценную систему 
мониторинга, и вы решили самостоятельно написать простой python3-скрипт для сбора основных метрик сервера. 

Вы, как опытный системный администратор, знаете, что системная информация сервера лежит в директории `/proc`. Также знаете, что в системе Linux есть  планировщик задач cron, который может запускать задачи по расписанию.

Суммировав всё, вы спроектировали приложение, которое:

- является python3-скриптом;
- собирает метрики из папки `/proc`;
- складывает метрики в файл 'YY-MM-DD-awesome-monitoring.log' в директорию /var/log 
(YY — год, MM — месяц, DD — день);
- каждый сбор метрик складывается в виде json-строки, в виде:
  + timestamp — временная метка, int, unixtimestamp;
  + metric_1 — метрика 1;
  + metric_2 — метрика 2;
  
     ...
     
  + metric_N — метрика N.
  
- сбор метрик происходит каждую минуту по cron-расписанию.

Для успешного выполнения задания нужно привести:

* работающий код python3-скрипта;
* конфигурацию cron-расписания;
* пример верно сформированного 'YY-MM-DD-awesome-monitoring.log', имеющий не меньше пяти записей.

Дополнительная информация:

1. Количество собираемых метрик должно быть не меньше четырёх.
1. По желанию можно не ограничивать себя только сбором метрик из `/proc`.

_**Файл скрипта - [proc-monitoring.py](tmp/proc-monitoring.py)**_

_**Файл лога - [proc-monitoring.py](tmp/23-08-15-awesome-monitoring.log)**_

_**Конфигурация cron - `* * * * * /usr/bin/python3 /home/user/netology/monitoring/monitoring.py`**_

2. В веб-интерфейсе откройте вкладку `Dashboards`. Попробуйте создать свой dashboard с отображением:

    - утилизации ЦПУ
    - количества использованного RAM
    - утилизации пространства на дисках
    - количество поднятых контейнеров
    - аптайм
    - ...
    - фантазируйте)
    
![image](https://github.com/malkops/nah/assets/44001733/f15a5317-78c3-4c8f-82e9-21e23a54645d)
