EXO: Автоматизована система розрахунків
=======================================

[![Hex pm](http://img.shields.io/hexpm/v/exosculat.svg?style=flat)](https://hex.pm/packages/exosculat)
[![Actions Status](https://github.com/erpuno/exo/workflows/mix/badge.svg)](https://github.com/erpuno/exo/actions)

EXO (EXOSCULAT, рахунок латиною) — автоматизована система обліку наданих послуг, їх тарифікації і виставляння рахунків для оплати.
EXO — це універсальний менеджер облікових записів (клієнтських рахунків),
які містять історію тарифікованих транзакцій. Облікові записи контролюються BPMN процесами,
активності яких визначені Erlang функціями. EXO, як приклад <a href="https://erp.uno">ERP.UNO</a>
може бути використаний як прототип для побудови білінгових систем, банків та інших облікових систем.

Запуск
------

Бізнес-процеси підприємства BPE визначають інфраструктуру для оркестрування виробничих процесів
згідно стандарту BPMN, та систем на основі декларативних правил. BPE зберігає транзакційно усі
кроки бізнес-процесів у сучасній системі даних KVS на базі RocksDB.

```
$ sudo apt install erlang elixir build-essential cmake
```

```
$ git clone https://github.com/erpuno/exo
$ cd exo
$ mix deps.get
$ iex -S mix
$ open http://localhost:8051/app/login.htm
```

Це навчальний приклад освітнього підготовчого курсу для інтернів, який використовується для
здодобуття навичок програмування систем на бібліотеках <a href="https://n2o.dev/ua/">N2O.DEV</a>.

Структура проекту
-----------------

### Статичні HTML контейнери

* [login.htm](priv/static/login.htm) Сторінка авторизації
* [index.html](priv/static/index.html) Домашня сторінка
* [forms.html](priv/static/forms.htm) Сторінка всіх форм
* [actors.html](priv/static/actors.htm) Сторінка всіх процесів
* [act.html](priv/static/act.htm) Сторінка історії процесу

### Базові модулі

* [exo_kvs](src/boot/exo_kvs.erl) Схема даних, її налаштування
* [exo_route](src/pages/exo_route.erl) Налаштування маршрутів HTML сторінок для веб-серверу
* [exosculat](src/exosculat.erl) Головний модуль Erlang/OTP додатку

### Редактори форм

* [bpe_pass](src/forms/bpe_pass.erl) Форма аутентифікації
* [bpe_create](src/forms/bpe_create.erl) Форма створення процесу
* [bpe_row](src/forms/bpe_row.erl) Таблична форма-рядок відображення процесу
* [bpe_trace](src/forms/bpe_row.erl) Таблична форма-рядок відображення кроку процесу

### Контролери сторінок

* [bpe_act](src/pages/bpe_act.erl) Сторінка відображення історії процесу
* [bpe_forms](src/pages/bpe_forms.erl) Сторінка відображення всіх форм системи
* [bpe_login](src/pages/bpe_login.erl) Сторінка аутентифікації
* [bpe_index](src/pages/bpe_index.erl) Сторінка переліку всіх процесів та їх створення

Аутентифікація
--------------

Сторінка аутентифікації та авторизаціх разом з системними сесіями є важливою частиною кожної ERP системи.
У прикладі наведена PLAIN password HTML форма.

![image](https://user-images.githubusercontent.com/144776/200148867-67025100-560e-4dc5-bcdd-dacf88e50c83.png)

Процеси
-------

Сторінка переліку BPE процесів ERP системи та форма для їх створення.

![image](https://user-images.githubusercontent.com/144776/200149087-e2a2af6a-bd5c-4006-b6fe-f3b95f12b11f.png)

Форми
-----

Сторінка переліку всіх форм ERP системи.

![image](https://user-images.githubusercontent.com/144776/200148896-b09d25b6-2c67-4d1d-b851-aaadc9164c82.png)

Транзакції
----------

Сторінка історії кроків бізнес-процесу BPE.

![image](https://user-images.githubusercontent.com/144776/200149114-dcd21f61-28a4-4aa9-a020-bcb2f70b7a1f.png)

Дописувачі
----------

* Максим Сохацький
