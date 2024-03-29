## GIT

**Системы контроля версий** - позволяют разработчикам сохранять все изменения, внесенные в код. СКВ также позволяют нескольким разработчикам работать над одним проектом и сохранять внесенные изменения независимо друг от друга.

**Git** - это инструмент, позволяющий реализовать распределенную систему контроля версий. С помощью git можно откатить свой проект до более старой версии, сравнивать, анализировать или сливать свои изменения в репозиторий.
Репозиторием называют хранилище кода и историю его изменений. Git работает локально и все ваши репозитории хранятся в определенных директориях на жестком диске.

Три состяния файла git:
- **зафиксированный** (committed) - файл уже сохранён в вашей локальной базе.
- **Измененный** (modified) - файлы, которые изменились, но ещё не были зафиксированы.
- **Подготовленный** (staged) - изменённые файлы, отмеченные для включения в следующий коммит.

**Commit** - точка сохранения. У каждого коммита есть **hash** (никальный id) и комментарий. Из таких коммитов собирается ветка. Перед каждым коммитом необходимо проиндексировать файлы, которые будут закоммичены. Последний коммит в ветке обозначается как HEAD.
**Ветка** - это история изменений. У каждой ветки есть свое название. Ветки имеют свою собственную историю и изолированные друг от друга изменения до тех пор, пока вы не решаете слить изменения вместе.

- `git add .` - добавить текущую директорию для отслеживания;
- `git commit` - закоммитить изменения;
- `git checkout branch` - переключиться на ветку;
- `git checkout file_name` - до выполнения индексации, отменяет изменения;
- `git reset HEAD file_name` - после индексации, отменяет изменения;
- `git revert HEAD --no-edit` - откат изменений коммита;
- `git log` - просмотр истории -- `--graph` - история в виде графа, `--oneline` - укороченное представление коммитов;
- `git merge dev` - слияние веток текущей с dev;
- `git remote` - просмотр удаленных репозиториев.

**.gitignore** - файл, в котором определяется, что не будет отслеживать git. Создается в любой директории репозитория.

Конфигурационные параметры могут хранится в трёх местах:
- **/etc/gitconfig** - flag --system
- **~/.gitconfig** or **~/.config/git/config** - flag --global
- **.git/config** - --local

В понятиях гита можно встретить **Автор** и **Коммитер**:
- **Автор** - это человек, изначальной сделавший работу;
- **Коммитер** - человек, который последним применил эту работу.

---

## Что такое DevOps? CI/CD

**DevOps** - это методололгия разработки ПО, задача которой наладить взаимодействие программистов и сисадминов в компании. Если ИТ-специалисты из разных отделов недопонимают суть задач друг дурга, выпуск новых приложений и обновлений для них затягивается.

Важными процессами для достижения результатов DevOps являются процессы CI/CD.

**CI (Continuous Integration)** - непрерывная интеграция. В задачи этого процесса входит иметь максимально рабочую версию каждого нового релиза. В первую очередь это сборка и тестирование проекта с каждым внесением изменений.

**CD (Continuous Deployment)** - непрерывная поставка. Суть этого процесса заключается в постоянной выкладке ПО на сервера.

**Пример CI/CD процесса**:
1. Сборка проекта, например docker build;
2. Запуск статических тестов. В зависимости от языка могут вызываться по разному и могут запускаться до сборки;
3. Деплой проекта на тестовое окружение;
4. Запуск тестов для всего тестового окружения;
5. Деплой проекта на продакшн окружение.
