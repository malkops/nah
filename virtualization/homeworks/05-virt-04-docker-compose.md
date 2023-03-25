## Задача 1

Создайте собственный образ любой операционной системы (например ubuntu-20.04) с помощью Packer ([инструкция](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/packer-quickstart)).

![image](https://user-images.githubusercontent.com/44001733/227514979-cd77b127-b6af-43f2-b59a-90cee8085e3c.png)

## Задача 2

**2.1.** Создайте вашу первую виртуальную машину в YandexCloud с помощью web-интерфейса YandexCloud.        

![image](https://user-images.githubusercontent.com/44001733/227516545-5c12395a-3dc3-4a34-8421-55997bfc4cbd.png)

**2.2.*** **(Необязательное задание)**      
Создайте вашу первую виртуальную машину в YandexCloud с помощью Terraform (вместо использования веб-интерфейса YandexCloud).
Используйте Terraform-код в директории ([src/terraform](https://github.com/netology-group/virt-homeworks/tree/virt-11/05-virt-04-docker-compose/src/terraform)).

Чтобы получить зачёт, вам нужно предоставить вывод команды terraform apply и страницы свойств, созданной ВМ из личного кабинета YandexCloud.

![image](https://user-images.githubusercontent.com/44001733/227526843-dbfaf3dc-b59b-4ee2-9450-d761d24fd9e6.png)

```terminal
# some string

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + external_ip_address_node01_yandex_cloud = (known after apply)
  + internal_ip_address_node01_yandex_cloud = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_vpc_network.defaults: Creating...
yandex_vpc_network.defaults: Creation complete after 1s [id=enp69kj6ss0n9l93c9ib]
yandex_vpc_subnet.defaults: Creating...
yandex_vpc_subnet.defaults: Creation complete after 2s [id=e9bulh345a3jvicg21qs]
yandex_compute_instance.node01: Creating...
yandex_compute_instance.node01: Still creating... [10s elapsed]
yandex_compute_instance.node01: Still creating... [20s elapsed]
yandex_compute_instance.node01: Creation complete after 25s [id=fhm4l41emj2fkj8s8jep]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:

external_ip_address_node01_yandex_cloud = "158.160.38.235"
internal_ip_address_node01_yandex_cloud = "192.168.101.12"
```

## Задача 3

С помощью Ansible и Docker Compose разверните на виртуальной машине из предыдущего задания систему мониторинга на основе Prometheus/Grafana.
Используйте Ansible-код в директории ([src/ansible](https://github.com/netology-group/virt-homeworks/tree/virt-11/05-virt-04-docker-compose/src/ansible)).

file:///home/a/.var/app/org.telegram.desktop/data/TelegramDesktop/tdata/temp_data/image_2023-03-25_15-18-46.png![image](https://user-images.githubusercontent.com/44001733/227711596-786c93ea-8fca-4959-a286-30c5cbce6615.png)

## Задача 4

1. Откройте веб-браузер, зайдите на страницу http://<внешний_ip_адрес_вашей_ВМ>:3000.
2. Используйте для авторизации логин и пароль из [.env-file](https://github.com/netology-group/virt-homeworks/blob/virt-11/05-virt-04-docker-compose/src/ansible/stack/.env).
3. Изучите доступный интерфейс, найдите в интерфейсе автоматически созданные docker-compose-панели с графиками([dashboards](https://grafana.com/docs/grafana/latest/dashboards/use-dashboards/)).
4. Подождите 5-10 минут, чтобы система мониторинга успела накопить данные.

![image](https://user-images.githubusercontent.com/44001733/227711580-e5b970d3-7352-445c-8cb2-02c77a98a583.png)

## Задача 5 (*)

Создайте вторую ВМ и подключите её к мониторингу, развёрнутому на первом сервере.

Чтобы получить зачёт, предоставьте:

- скриншот из Grafana, на котором будут отображаться метрики добавленного вами сервера.

![image](https://user-images.githubusercontent.com/44001733/227713246-7138cfe6-1aaf-44e9-8ebb-a8c6b142fee4.png)
