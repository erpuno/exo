EXO: Тарифікація та розрахунки
==============================

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

* Вікно споживача: Профіль, Споживання, Серфіси та Тарифи
* Бек-офіс: Звітність, Тарифи, Ролі
* Адміністратор: BPE, FORM, KVS, N2O, MNESIA

### Статичні HTML контейнери Споживача

* [profile.htm](priv/static/profile.htm) Обліковий запис споживача
* [consume.htm](priv/static/consume.htm) Споживання сервісів
* [service.htm](priv/static/service.htm) Налаштування сервісів та тарифи

### Статичні HTML контейнери Бек-офісу

* [reports.htm](priv/static/reports.htm) Звітність
* [tariffs.htm](priv/static/tariffs.htm) Тарифні моделі
* [domains.htm](priv/static/domains.htm) Рольова модель

### Статичні HTML контейнери Адміністратора

* [login.htm](priv/static/login.htm) Сторінка авторизації
* [bpe.htm](priv/static/bpe.htm) Сторінка всіх процесів
* [form.htm](priv/static/form.htm) Сторінка всіх форм
* [process.htm](priv/static/process.htm) Сторінка історії процесу
* [kvs.htm](priv/static/kvs.htm) Сторінка всіх ланцюжків даних
* [n2o.htm](priv/static/n2o.htm) Сторінка службових таблиць сервісів N2O
* [mnesia.htm](priv/static/mnesia.htm) Сторінка таблиць бази даних MNESIA

### Базові модулі

* [application](lib/application.ex) Головний модуль Erlang/OTP додатку
* [schema](lib/schema.ex) хема даних, її налаштування
* [routes](lib/pages/routes.ex) Налаштування маршрутів HTML сторінок для веб-серверу

### Редактори форм

* [bpe_pass](lib/forms/bpe_pass.ex) Форма аутентифікації
* [bpe_create](lib/forms/bpe_create.ex) Форма створення процесу
* [bpe_row](lib/forms/bpe_row.ex) Таблична форма-рядок відображення процесу
* [bpe_trace](lib/forms/bpe_row.ex) Таблична форма-рядок відображення кроку процесу

### Контролери сторінок

* [bpe_act](lib/pages/bpe_act.ex) Сторінка відображення історії процесу
* [bpe_login](lib/pages/bpe_login.ex) Сторінка аутентифікації
* [bpe_index](lib/pages/bpe_index.ex) Сторінка переліку всіх процесів BPE
* [bpe_forms](lib/pages/bpe_forms.ex) Сторінка відображення всіх форм системи FORM
* [kvs_adm](lib/pages/kvs_adm.ex) Сторінка даних KVS
* [n2o_adm](lib/pages/n2o_adm.ex) Сторінка таблиць N2O
* [mnesia_adm](lib/pages/mnesia_adm.ex) Сторінка даних MNESIA

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
