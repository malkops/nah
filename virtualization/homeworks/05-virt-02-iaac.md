## Задача 1

- Опишите основные преимущества применения на практике IaaC-паттернов.

_**Повышение скорости развертывания инфраструктуры, идемпотентность настройки архитектуры каждый единицы**_

- Какой из принципов IaaC является основополагающим?

_**Идемпотентность настройки архитектуры, является основополагающим**_

## Задача 2

- Чем Ansible выгодно отличается от других систем управление конфигурациями?

_**Тем, что это условно безагентный инструмент, работающий по pull принципу**_

- Какой, на ваш взгляд, метод работы систем конфигурации более надёжный — push или pull?

_**На мой взгляд, push метод более надёжный, так как предоставляет больший контроль над системой и проще в использовании.**_

## Задача 3

Установите на личный компьютер:

- [VirtualBox](https://www.virtualbox.org/),
- [Vagrant](https://github.com/netology-code/devops-materials),
- [Terraform](https://github.com/netology-code/devops-materials/blob/master/README.md),
- Ansible.

*Приложите вывод команд установленных версий каждой из программ, оформленный в Markdown.*

```zsh
a@pop-os ~/netology/nah % ansible --version
ansible [core 2.14.1]
  config file = None
  configured module search path = ['/home/a/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/a/.local/lib/python3.10/site-packages/ansible
  ansible collection location = /home/a/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/a/.local/bin/ansible
  python version = 3.10.6 (main, Nov 14 2022, 16:10:14) [GCC 11.3.0] (/usr/bin/python3)
  jinja version = 3.0.3
  libyaml = True

a@pop-os ~/netology/nah % terraform -v
Terraform v1.4.0
on linux_amd64

a@pop-os ~/netology/nah % vagrant -v
Vagrant 2.2.19

a@pop-os ~/netology/nah % vboxmanage --version
6.1.36_Ubuntur152435
```

## Задача 4 

Воспроизведите практическую часть лекции самостоятельно.

- Создайте виртуальную машину.
- Зайдите внутрь ВМ, убедитесь, что Docker установлен с помощью команды

```
docker ps
```

