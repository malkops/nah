# Домашнее задание к занятию 7 «Жизненный цикл ПО»

## Подготовка к выполнению

1. Получить бесплатную версию [Jira](https://www.atlassian.com/ru/software/jira/free).
2. Настроить её для своей команды разработки.
3. Создать доски Kanban и Scrum.

![0](https://github.com/malkops/nah/assets/44001733/33d3e3f4-d6f8-42a2-bffe-1437986dca54)

## Основная часть

Необходимо создать собственные workflow для двух типов задач: bug и остальные типы задач. Задачи типа bug должны проходить жизненный цикл:

1. Open -> On reproduce.
2. On reproduce -> Open, Done reproduce.
3. Done reproduce -> On fix.
4. On fix -> On reproduce, Done fix.
5. Done fix -> On test.
6. On test -> On fix, Done.
7. Done -> Closed, Open.

Остальные задачи должны проходить по упрощённому workflow:

1. Open -> On develop.
2. On develop -> Open, Done develop.
3. Done develop -> On test.
4. On test -> On develop, Done.
5. Done -> Closed, Open.

**Что нужно сделать**

1. Создайте задачу с типом bug, попытайтесь провести его по всему workflow до Done.

![1](https://github.com/malkops/nah/assets/44001733/ceb6b0e4-5ded-476c-a1e2-63fd9ce02000)

2. Создайте задачу с типом epic, к ней привяжите несколько задач с типом task, проведите их по всему workflow до Done.

![2](https://github.com/malkops/nah/assets/44001733/74563353-6d76-4d29-83f3-1d7f885a9b28)

![3](https://github.com/malkops/nah/assets/44001733/6d244ed3-3cac-4b03-acf8-8730230d4f20)

3. При проведении обеих задач по статусам используйте kanban.
4. Верните задачи в статус Open.
5. Перейдите в Scrum, запланируйте новый спринт, состоящий из задач эпика и одного бага, стартуйте спринт, проведите задачи до состояния Closed. Закройте спринт.

![4](https://github.com/malkops/nah/assets/44001733/161fcce8-fd4b-40f8-9811-b292b1f91c61)

![5](https://github.com/malkops/nah/assets/44001733/1c9b8b03-6b87-4209-8e9b-d5b5d718b2dd)

6. Если всё отработалось в рамках ожидания — выгрузите схемы workflow для импорта в XML. Файлы с workflow и скриншоты workflow приложите к решению задания.

BUG:
[XML для bug](tmp/intro/netology-bug.xml)

![bug](https://github.com/malkops/nah/assets/44001733/d8160725-623d-45d6-bbb0-07bebecd6a5d)

OTHER:
[XML для bug](tmp/intro/netology-other.xml)

![all](https://github.com/malkops/nah/assets/44001733/d214309f-98cc-401d-97d6-9ae91d19f999)

