# Домашнее задание к занятию «Базовые объекты K8S»

### Задание 1. Создать Pod с именем hello-world

1. Создать манифест (yaml-конфигурацию) Pod.
2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Подключиться локально к Pod с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

![image](https://github.com/malkops/nah/assets/44001733/67754d03-ea76-4b33-b96b-b74d92b66be0)

------

### Задание 2. Создать Service и подключить его к Pod

1. Создать Pod с именем netology-web.
2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Создать Service с именем netology-svc и подключить к netology-web.
4. Подключиться локально к Service с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

![image](https://github.com/malkops/nah/assets/44001733/9b432446-b527-4e70-a23e-4fbcdbf9ec52)

![image](https://github.com/malkops/nah/assets/44001733/dfb13127-73d6-42c5-96a8-72efeaaa8403)

[Манифест находится тут](tmp/microk8s-pods/netology-web.yml)
