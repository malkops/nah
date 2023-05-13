# Домашнее задание к занятию «Введение в Terraform»

### Задание 1

1. Перейдите в каталог [**src**](https://github.com/netology-code/ter-homeworks/tree/main/01/src). Скачайте все необходимые зависимости, использованные в проекте. 
2. Изучите файл **.gitignore**. В каком terraform файле допустимо сохранить личную, секретную информацию? - _**Сохранить можно в файле с расширением `*.tfvars` или, если брать оригинальный `.gitignore`, в файле `personal.auto.tfvars`.**_
3. Выполните код проекта. Найдите в State-файле секретное содержимое созданного ресурса **random_password**. Пришлите его в качестве ответа. - _**`"result": "63zHctKLecnL5Dnm"`.**_
4. Раскомментируйте блок кода, примерно расположенный на строчках 29-42 файла **main.tf**.
Выполните команду ```terraform validate```. Объясните в чем заключаются намеренно допущенные ошибки? Исправьте их. - _**Ошибка в имени ресурса, название должно начинаться только с буквы или нижнего подчеркивания. Также не было задано имя для ресурса `docker_image`.**_
5. Выполните код. В качестве ответа приложите вывод команды ```docker ps```![image](https://github.com/malkops/nah/assets/44001733/33ab0be3-ac3d-46fe-b39f-dda482c748a8)

6. Замените имя docker-контейнера в блоке кода на ```hello_world```, выполните команду ```terraform apply --auto-approve```.
Объясните своими словами, в чем может быть опасность применения ключа  ```--auto-approve``` ? - _**Может быть опасна наличием логических ошибок в коде, которые можно проверить в плане команды `apply`, но с `--auto-approve` этого сделать не получится.**_
8. Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**. - _**Содержимое ниже.**_
9. Объясните, почему при этом не был удален docker образ **nginx:latest** ?(Ответ найдите в коде проекта или документации) - _**Образ не удаляется, так как мы указываем параметр `keep_locally = true`, который и говорит о необходимости сохранения образа локально. Интересно, что совместно с флагом `force_remove = true`, он всё равно образ не удалет. Т.е. `keep_locally` имеет больший приоритет, чем `force_remove`, хотя судя по наличию `force` это должно быть наоборот.**_

```json
{
  "version": 4,
  "terraform_version": "1.3.7",
  "serial": 11,
  "lineage": "fb4b22222-1f22-b2342342-ssss-asdasdasd",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```

------

### Задание 2*

1. Изучите в документации provider [**Virtualbox**](https://registry.tfpla.net/providers/shekeriev/virtualbox/latest/docs/overview/index) от 
shekeriev.
2. Создайте с его помощью любую виртуальную машину.

В качестве ответа приложите plan для создаваемого ресурса.

```bash
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # virtualbox_vm.vm1 will be created
  + resource "virtualbox_vm" "vm1" {
      + cpus   = 1
      + id     = (known after apply)
      + image  = "https://app.vagrantup.com/shekeriev/boxes/debian-11/versions/0.2/providers/virtualbox.box"
      + memory = "512 mib"
      + name   = "debian-11"
      + status = "running"

      + network_adapter {
          + device                 = "IntelPro1000MTDesktop"
          + host_interface         = "vboxnet1"
          + ipv4_address           = (known after apply)
          + ipv4_address_available = (known after apply)
          + mac_address            = (known after apply)
          + status                 = (known after apply)
          + type                   = "hostonly"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + IPAddress = (known after apply)
```
