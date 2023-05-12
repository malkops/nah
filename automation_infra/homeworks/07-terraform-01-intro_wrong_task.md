# Домашнее задание к занятию 1. «Инфраструктура как код»

## Задача 1. Выбор инструментов
 
### Легенда
 
Через час совещание, на котором менеджер расскажет о новом проекте. Начать работу над проектом нужно 
будет уже сегодня. 
Сейчас известно, что это будет сервис, который ваша компания будет предоставлять внешним заказчикам.
Первое время, скорее всего, будет один внешний клиент, со временем внешних клиентов станет больше.

Также по разговорам в компании есть вероятность, что техническое задание ещё не чёткое, что приведёт к большому
количеству небольших релизов, тестирований интеграций, откатов, доработок, то есть скучно не будет.  
   
Вам как DevOps-инженеру будет нужно принять решение об инструментах для организации инфраструктуры.
В вашей компании уже используются следующие инструменты: 

- остатки Сloud Formation, 
- некоторые образы сделаны при помощи Packer,
- год назад начали активно использовать Terraform, 
- разработчики привыкли использовать Docker, 
- уже есть большая база Kubernetes-конфигураций, 
- для автоматизации процессов используется Teamcity, 
- также есть совсем немного Ansible-скриптов, 
- ряд bash-скриптов для упрощения рутинных задач.  

На совещании нужно будет выяснить подробности о проекте, чтобы определиться с инструментами:

1. Какой тип инфраструктуры будем использовать для этого проекта: изменяемый или не изменяемый? - _**Базовая часть инфраструктуры будет не изменяемой, на на ней будут стоят инструменты изменяемой инфраструктуры (k8s, docker), так как предстоит большое количество правок и экспериментов.**_
1. Будет ли центральный сервер для управления инфраструктурой? - _**Да, иметь центральный сервер для управления инфраструктурой имеет свои плюсы и минусы, но также может быть требованием безопасности.**_
1. Будут ли агенты на серверах? - _**Да, будут агенты для мониторинга. Но при этом, для управления инфраструктурой не будет агентов.**_
1. Будут ли использованы средства для управления конфигурацией или инициализации ресурсов? - _**Средства управления конфигурацией использоваться будут - тот же Ansible.**_
 
Так как проект стартует уже сегодня, на совещании нужно будет определиться со всеми этими вопросами.

### Вам нужно:

1. Ответить на четыре вопроса из раздела «Легенда».
1. Решить, какие инструменты из уже используемых вы хотели бы применить для нового проекта. - _**Желаемые инструменты: Ansible, Terraform, Docker, Teamcity, Kubernetes.**_
1. Определиться, хотите ли рассмотреть возможность внедрения новых инструментов для этого проекта. - _**Да, можно рассмотреть альтернативы текущим инструментам, например agroci, gitlab ci, openshift и инструменты мониторинга.**_

Если для ответов на эти вопросы недостаточно информации, напишите, какие моменты уточните на совещании.

## Задача 2. Установка Terraform и Задача 3. Поддержка legacy-кода

[Официальный сайт Terraform](https://www.terraform.io/).   
В связи с недоступностью ресурсов для загрузки Terraform на территории РФ вы можете воспользоваться VPN или использовать зеркало YandexCloud:      
[ссылки для установки открытого ПО](https://github.com/netology-code/devops-materials/blob/master/README.md)

Установите Terraform при помощи менеджера пакетов, используемого в вашей операционной системе.

В какой-то момент вы обновили Terraform до новой версии, например с 0.12 до 0.13. 
Код одного из проектов настолько устарел, что не может работать с версией 0.13. 
Нужно сделать так, чтобы вы могли одновременно использовать последнюю версию Terraform, установленную при помощи
штатного менеджера пакетов, и устаревшую версию 0.12. 

В виде результата этой задачи приложите вывод `--version` двух версий Terraform, доступных на вашем компьютере 
или виртуальной машине.

_**Установил версии через git, так как через пакетный менеджер нужен VPN :(**_

![image](https://github.com/malkops/nah/assets/44001733/54364574-2acf-403a-8262-46085d96a1e2)
