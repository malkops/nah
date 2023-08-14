# Домашнее задание к занятию 11 «Teamcity»

## Подготовка к выполнению

1. В Yandex Cloud создайте новый инстанс (4CPU4RAM) на основе образа `jetbrains/teamcity-server`.
2. Дождитесь запуска teamcity, выполните первоначальную настройку.
3. Создайте ещё один инстанс (2CPU4RAM) на основе образа `jetbrains/teamcity-agent`. Пропишите к нему переменную окружения `SERVER_URL: "http://<teamcity_url>:8111"`.
4. Авторизуйте агент.
5. Сделайте fork [репозитория](https://github.com/aragastmatb/example-teamcity).
6. Создайте VM (2CPU4RAM) и запустите [playbook](./infrastructure).

## Основная часть

1. Создайте новый проект в teamcity на основе fork.

![1](https://github.com/malkops/nah/assets/44001733/d5d5d49f-4998-401e-a891-8b580f13575d)

2. Сделайте autodetect конфигурации.

![2](https://github.com/malkops/nah/assets/44001733/ac40e092-e828-438b-b446-9003b51f81ae)

3. Сохраните необходимые шаги, запустите первую сборку master.

![3](https://github.com/malkops/nah/assets/44001733/56540ceb-c50a-470d-b4d0-d9b65f5d7dbb)

4. Поменяйте условия сборки: если сборка по ветке `master`, то должен происходит `mvn clean deploy`, иначе `mvn clean test`.

![4](https://github.com/malkops/nah/assets/44001733/20308e97-3516-49be-ad12-88f76c5300cb)

5. Для deploy будет необходимо загрузить [settings.xml](./teamcity/settings.xml) в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.
6. В pom.xml необходимо поменять ссылки на репозиторий и nexus.
7. Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.
8. Мигрируйте `build configuration` в репозиторий.
9. Создайте отдельную ветку `feature/add_reply` в репозитории.
10. Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово `hunter`.
11. Дополните тест для нового метода на поиск слова `hunter` в новой реплике.
12. Сделайте push всех изменений в новую ветку репозитория.

_**Тут на скриншоте видны все предыдущие пункты.**_

![12](https://github.com/malkops/nah/assets/44001733/31a5f8eb-a158-4223-b25c-0f92f9d36d12)

13. Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.

![13 1](https://github.com/malkops/nah/assets/44001733/8ffaa354-7717-427a-9266-2fccd377eb26)

![13 2](https://github.com/malkops/nah/assets/44001733/99dccd2e-32cf-44e0-8739-fc3ece98bd7a)

14. Внесите изменения из произвольной ветки `feature/add_reply` в `master` через `Merge`.

![14](https://github.com/malkops/nah/assets/44001733/c93b0582-2f6b-43d4-a99c-895213c2909c)

15. Убедитесь, что нет собранного артефакта в сборке по ветке `master`.

![15](https://github.com/malkops/nah/assets/44001733/3e2c12ca-c8c9-4c2e-968f-d854ada67ec4)

16. Настройте конфигурацию так, чтобы она собирала `.jar` в артефакты сборки.

![16](https://github.com/malkops/nah/assets/44001733/f3a6cb48-f16c-42ab-89e8-1a9fe964e6a9)

17. Проведите повторную сборку мастера, убедитесь, что сбора прошла успешно и артефакты собраны.

![17](https://github.com/malkops/nah/assets/44001733/b2479d53-7b6c-4c09-b572-25b6ffd284ea)

![18](https://github.com/malkops/nah/assets/44001733/e8bee252-19ab-44ea-881a-d4499dd5ec8e)

18. Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.
19. В ответе пришлите ссылку на репозиторий.
**_https://github.com/malkops/example-teamcity_**
