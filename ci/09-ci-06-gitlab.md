# Домашнее задание к занятию 12 «GitLab»

## Подготовка к выполнению

1. Подготовьте к работе GitLab [по инструкции](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/gitlab-containers).
2. Создайте свой новый проект.
3. Создайте новый репозиторий в GitLab, наполните его [файлами](./repository).
4. Проект должен быть публичным, остальные настройки по желанию.

![repo](https://github.com/malkops/nah/assets/44001733/ebf8b5e3-48c4-416d-bffe-ca0c8e79bfd5)

## Основная часть

### DevOps

В репозитории содержится код проекта на Python. Проект — RESTful API сервис. Ваша задача — автоматизировать сборку образа с выполнением python-скрипта:

1. Образ собирается на основе [centos:7](https://hub.docker.com/_/centos?tab=tags&page=1&ordering=last_updated).
2. Python версии не ниже 3.7.
3. Установлены зависимости: `flask` `flask-jsonpify` `flask-restful`.
4. Создана директория `/python_api`.
5. Скрипт из репозитория размещён в /python_api.
6. Точка вызова: запуск скрипта.
7. При коммите в любую ветку должен собираться docker image с форматом имени hello:gitlab-$CI_COMMIT_SHORT_SHA . Образ должен быть выложен в Gitlab registry или yandex registry.

8.* (задание необязательное к выполению) При комите в ветку master после сборки должен подняться pod в kubernetes. Примерный pipeline для push в kubernetes по [ссылке](https://github.com/awertoss/devops-netology/blob/main/09-ci-06-gitlab/gitlab-ci.yml).

_**[Dockerfile тут](tmp/gitlab/Dockerfile)**_

**_Образ собирается:_**

![1](https://github.com/malkops/nah/assets/44001733/6a11b9bc-0940-4e64-a5fb-0ac558c0c191)

_**И Поднимается под в k8s:**_

![1 2](https://github.com/malkops/nah/assets/44001733/def80e8d-6fd8-4b9e-b291-0e445754e8df)

### Product Owner

Вашему проекту нужна бизнесовая доработка: нужно поменять JSON ответа на вызов метода GET `/rest/api/get_info`, необходимо создать Issue в котором указать:

1. Какой метод необходимо исправить.
2. Текст с `{ "message": "Already started" }` на `{ "message": "Running" }`.
3. Issue поставить label: feature.

![2](https://github.com/malkops/nah/assets/44001733/32f4cb97-1722-439d-83e3-75651fa573d0)


### Developer

Пришёл новый Issue на доработку, вам нужно:

1. Создать отдельную ветку, связанную с этим Issue.
2. Внести изменения по тексту из задания.
3. Подготовить Merge Request, влить необходимые изменения в `master`, проверить, что сборка прошла успешно.

_**Всё вместе на одном скриншоте**_
![developer](https://github.com/malkops/nah/assets/44001733/c0f32805-cb27-49ab-bd51-3ebe1480f831)

_**+ пройденная сборка**_

![tester 1](https://github.com/malkops/nah/assets/44001733/4ac646b8-035f-4034-aaec-dfa11f89aa03)

### Tester

Разработчики выполнили новый Issue, необходимо проверить валидность изменений:

1. Поднять докер-контейнер с образом `python-api:latest` и проверить возврат метода на корректность.
2. Закрыть Issue с комментарием об успешности прохождения, указав желаемый результат и фактически достигнутый.

_**Тестировщик проверил**_

![tester](https://github.com/malkops/nah/assets/44001733/c82d0d7f-75a7-4856-99de-6b34956559a1)

## Итог

В качестве ответа пришлите подробные скриншоты по каждому пункту задания:

- файл gitlab-ci.yml; _**- [.gitlab-ci.yml](tmp/gitlab/gitlab-ci.yml)**_
- Dockerfile; _**- [Dockerfile](tmp/gitlab/Dockerfile)**_
- лог успешного выполнения пайплайна; **_- есть выше_**
- решённый Issue. _**- есть ниже**_

_**Issue решен и закрыт**_

![merged](https://github.com/malkops/nah/assets/44001733/f351d307-2e47-48a4-a26a-ca22e14f26c1)
