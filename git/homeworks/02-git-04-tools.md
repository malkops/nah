## Задание

В клонированном репозитории:

1. Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.
  - `git show aefea` - **aefead2207ef7e2aa5dc81a34aedf0cad4c32545**
 
    **Update CHANGELOG.md**
2. Ответьте на вопросы.

* Какому тегу соответствует коммит `85024d3`?
  *  `git show 85024d3` - **tag: v0.12.23**
* Сколько родителей у коммита `b8d720`? Напишите их хеши.
  * `git show --pretty=%P b8d720` - 2 родителя:
  
  1. **56cd7859e05c36c06b56d013b55a252d0bb7e158**
  2. **9ea88f22fc6269854151c571162c5bcf958bee2b**
* Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами v0.12.23 и v0.12.24.
  * ```bash
    git log v0.12.23..v0.12.24 --oneline
    ```
    ```
    33ff1c03bb (tag: v0.12.24) v0.12.24
    b14b74c493 [Website] vmc provider links
    3f235065b9 Update CHANGELOG.md
    6ae64e247b registry: Fix panic when server is unreachable
    5c619ca1ba website: Remove links to the getting started guide's old location
    06275647e2 Update CHANGELOG.md
    d5f9411f51 command: Fix bug when using terraform login on Windows
    4b6d06cc5d Update CHANGELOG.md
    dd01a35078 Update CHANGELOG.md
    225466bc3e Cleanup after v0.12.23 release
    ```
* Найдите коммит, в котором была создана функция `func providerSource`, её определение в коде выглядит так: `func providerSource(...)` (вместо троеточия перечислены аргументы).
  * `git log -S "func providerSource(" --oneline` - **8c928e8358**
* Найдите все коммиты, в которых была изменена функция `globalPluginDirs`.
  * `git log -L :"func globalPluginDirs":plugins.go`
   ```
   78b12205587fe839f10d946ea3fdc06719decb05
   52dbf94834cb970b510f2fba853a5b49ad9b1a46
   41ab0aef7a0fe030e84018973a64135b11abcd70
   66ebff90cdfaa6938f26f908c7ebad8d547fea17
   ```
* Кто автор функции `synchronizedWriters`?
  ```
  git log -S "func synchronizedWriters"
  git checkout 5ac311e2a91e381e2f52234668b49ba670aa0fe5
  git blame -L 1,31 synchronized_writers.go
  ```
    **Martin Atkins**
