# Домашнее задание к занятию «Микросервисы: масштабирование»

Вы работаете в крупной компании, которая строит систему на основе микросервисной архитектуры.
Вам как DevOps-специалисту необходимо выдвинуть предложение по организации инфраструктуры для разработки и эксплуатации.

## Задача 1: Кластеризация

Предложите решение для обеспечения развёртывания, запуска и управления приложениями.
Решение может состоять из одного или нескольких программных продуктов и должно описывать способы и принципы их взаимодействия.

Решение должно соответствовать следующим требованиям:
- поддержка контейнеров;
- обеспечивать обнаружение сервисов и маршрутизацию запросов;
- обеспечивать возможность горизонтального масштабирования;
- обеспечивать возможность автоматического масштабирования;
- обеспечивать явное разделение ресурсов, доступных извне и внутри системы;
- обеспечивать возможность конфигурировать приложения с помощью переменных среды, в том числе с возможностью безопасного хранения чувствительных данных таких как пароли, ключи доступа, ключи шифрования и т. п.

Обоснуйте свой выбор.

_**На ум приходят различные оркестраторы, потому что они уже подерживают необходимые требования из коробки, но иногда можгут потребоваться и дополнительные инструменты (например для хранения чувствительных данных). Из примеров можно назвать kubernetes, openshift, rancher, nomad. **_

---

## Задача 2: Распределённый кеш * (необязательная)

Разработчикам вашей компании понадобился распределённый кеш для организации хранения временной информации по сессиям пользователей.
Вам необходимо построить Redis Cluster, состоящий из трёх шард с тремя репликами.

### Схема:

![11-04-01](https://user-images.githubusercontent.com/1122523/114282923-9b16f900-9a4f-11eb-80aa-61ed09725760.png)

_**[Ansible playbook для реализации схемы тут](11-microservices-04-scaling/redis-cluster.yml)**_

_**После выполнения плейбука необходимо зайти на сервер, выполнить поманду:**_
```bash
redis-cli --cluster create LIST_OF_REDIS_INTANCES --cluster-replicas 1
```

_**Где `LIST_OF_REDIS_INTANCES` список инстансов redis в формате `ip1:6379 ip2:6378 ip3:6379 ip4:6378 ip5:6379 ip6:6378`. После этого кластер будет построен.**_

![image](https://github.com/malkops/nah/assets/44001733/5bab3af6-3c57-4837-81aa-455e08a94626)
