# Домашнее задание к занятию «Основы Terraform. Yandex Cloud»

### Задание 0

1. Ознакомьтесь с [документацией к security-groups в Yandex Cloud](https://cloud.yandex.ru/docs/vpc/concepts/security-groups?from=int-console-help-center-or-nav).
2. Запросите preview доступ к данному функционалу в ЛК Yandex Cloud. Обычно его выдают в течении 24-х часов.
https://console.cloud.yandex.ru/folders/<ваш cloud_id>/vpc/security-groups.   
Этот функционал понадобится к следующей лекции. 

_**Сделано.**_

### Задание 1

1. Изучите проект. В файле variables.tf объявлены переменные для yandex provider.
2. Переименуйте файл personal.auto.tfvars_example в personal.auto.tfvars. Заполните переменные (идентификаторы облака, токен доступа). Благодаря .gitignore этот файл не попадет в публичный репозиторий. **Вы можете выбрать иной способ безопасно передать секретные данные в terraform.**
3. Сгенерируйте или используйте свой текущий ssh ключ. Запишите его открытую часть в переменную **vms_ssh_root_key**.
4. Инициализируйте проект, выполните код. Исправьте возникшую ошибку. Ответьте в чем заключается ее суть? - _**У меня было две ошибки. Одна из-за превышения лимитов на сети. Пришлось немного изменить код. По этой проблеме также есть нужно было добавлять названия сетей в переменные. Вторая в неправильном параметре числа cores.**_
5. Ответьте, как в процессе обучения могут пригодиться параметры```preemptible = true``` и ```core_fraction=5``` в параметрах ВМ? Ответ в документации Yandex cloud. - _**Эти параметры нужны для экономии средств, которые будут списываться за виртуалку (т.е. ВМ будет стоить дешевле).**_

В качестве решения приложите:
- скриншот ЛК Yandex Cloud с созданной ВМ,
- скриншот успешного подключения к консоли ВМ через ssh,
- ответы на вопросы.

![1](https://github.com/malkops/nah/assets/44001733/f3cd8410-51ca-4757-82aa-7006f39c6006)

### Задание 2

1. Изучите файлы проекта.
2. Замените все "хардкод" **значения** для ресурсов **yandex_compute_image** и **yandex_compute_instance** на **отдельные** переменные. К названиям переменных ВМ добавьте в начало префикс **vm_web_** .  Пример: **vm_web_name**.
2. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их **default** прежними значениями из main.tf. 
3. Проверьте terraform plan (изменений быть не должно). 

![2](https://github.com/malkops/nah/assets/44001733/7b05a879-6727-4d49-b92f-a91a361b6354)

### Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ(в файле main.tf): **"netology-develop-platform-db"** ,  cores  = 2, memory = 2, core_fraction = 20. Объявите ее переменные с префиксом **vm_db_** в том же файле('vms_platform.tf').
3. Примените изменения.

https://github.com/malkops/nah/blob/terraform-02/automation_infra/homeworks/tmp/02/src/vms_platform.tf


### Задание 4

1. Объявите в файле outputs.tf output типа map, содержащий { instance_name = external_ip } для каждой из ВМ.
2. Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды ```terraform output```

![4](https://github.com/malkops/nah/assets/44001733/dd4fcc22-21ce-4efd-a1f3-66396dfb1fe9)

### Задание 5

1. В файле locals.tf опишите в **одном** local-блоке имя каждой ВМ, используйте интерполяцию ${..} с несколькими переменными по примеру из лекции.
2. Замените переменные с именами ВМ из файла variables.tf на созданные вами local переменные.
3. Примените изменения.

https://github.com/malkops/nah/blob/terraform-02/automation_infra/homeworks/tmp/02/src/locals.tf

### Задание 6

1. Вместо использования 3-х переменных  ".._cores",".._memory",".._core_fraction" в блоке  resources {...}, объедените их в переменные типа **map** с именами "vm_web_resources" и "vm_db_resources".
2. Так же поступите с блоком **metadata {serial-port-enable, ssh-keys}**, эта переменная должна быть общая для всех ваших ВМ.
3. Найдите и удалите все более не используемые переменные проекта.
4. Проверьте terraform plan (изменений быть не должно).

![6](https://github.com/malkops/nah/assets/44001733/1caab4dc-f6ae-498c-b6a4-9714b4df971b)

### Задание 7*

Изучите содержимое файла console.tf. Откройте terraform console, выполните следующие задания: 

1. Напишите, какой командой можно отобразить **второй** элемент списка test_list?

![7 1](https://github.com/malkops/nah/assets/44001733/763b3f6e-c4a4-453c-a1dc-1aa7df82f5c0)

2. Найдите длину списка test_list с помощью функции length(<имя переменной>).

![7 2](https://github.com/malkops/nah/assets/44001733/827c1625-3bff-4545-b9ad-4b11900d68a1)

3. Напишите, какой командой можно отобразить значение ключа admin из map test_map ?

![7 3](https://github.com/malkops/nah/assets/44001733/e3ee56df-7d7d-4af0-8667-a8736413561e)

4. Напишите interpolation выражение, результатом которого будет: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks", используйте данные из переменных test_list, test_map, servers и функцию length() для подстановки значений.

![7 4](https://github.com/malkops/nah/assets/44001733/f55c3af6-22b7-4204-b249-57af089083fe)
