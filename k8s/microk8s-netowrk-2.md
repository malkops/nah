# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2»

### Задание 1. Создать Deployment приложений backend и frontend

1. Создать Deployment приложения _frontend_ из образа nginx с количеством реплик 3 шт.
2. Создать Deployment приложения _backend_ из образа multitool. 
3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера. 
4. Продемонстрировать, что приложения видят друг друга с помощью Service.
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

[Манифест находится тут](tmp/microk8s-network/ep2/microk8s-network-1.yml)

Трафик с frontend до backend:
![1-front-to-back](https://github.com/malkops/nah/assets/44001733/39a53650-7b56-4461-bba4-4515bc754d4e)

Трафик с backend до frontend:
![1-back-to-front](https://github.com/malkops/nah/assets/44001733/447edbd5-66b5-4f5c-a1f0-c3b4e5fee31d)

------

### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

1. Включить Ingress-controller в MicroK8S.
2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался _frontend_ а при добавлении /api - _backend_.
3. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
4. Предоставить манифесты и скриншоты или вывод команды п.2.

[Манифест находится тут](tmp/microk8s-network/ep2/microk8s-network-2.yml)

Frontend в браузере:
![2-front](https://github.com/malkops/nah/assets/44001733/7404434b-e753-4de4-974d-244b1108e262)

Backend в браузере:
![2-back](https://github.com/malkops/nah/assets/44001733/2b9aff8f-055f-4c1a-93a5-0f02b37778a2)
