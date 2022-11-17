EXO: Тарифікація та розрахунки
==============================

[![Hex pm](http://img.shields.io/hexpm/v/exosculat.svg?style=flat)](https://hex.pm/packages/exosculat)
[![Actions Status](https://github.com/erpuno/exo/workflows/mix/badge.svg)](https://github.com/erpuno/exo/actions)

EXO (EXOSCULAT, рахунок латиною) — автоматизована система обліку наданих послуг,
їх тарифікації і виставляння рахунків для оплати.
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

* Сторінка авторизації
* Адміністратор: BPE, FORM, KVS, N2O, MNESIA
* Бек-офіс: Звітність, Тарифи, Ролі
* Вікно споживача: Профіль, Споживання, Сервіси

### Статичні HTML контейнери Споживача

* [profile.htm](priv/static/consumer/profile.htm) Обліковий запис споживача
* [consume.htm](priv/static/consumer/consume.htm) Споживання сервісів
* [service.htm](priv/static/consumer/service.htm) Налаштування сервісів та тарифи

### Статичні HTML контейнери Бек-офісу

* [reports.htm](priv/static/backoffice/reports.htm) Звітність
* [tariffs.htm](priv/static/backoffice/tariffs.htm) Тарифні моделі
* [domains.htm](priv/static/backoffice/domains.htm) Рольова модель

### Статичні HTML контейнери Адміністратора

* [login.htm](priv/static/admin/login.htm) Сторінка авторизації
* [bpe.htm](priv/static/admin/bpe.htm) Сторінка всіх процесів
* [form.htm](priv/static/admin/form.htm) Сторінка всіх форм
* [process.htm](priv/static/admin/process.htm) Сторінка історії процесу
* [kvs.htm](priv/static/admin/kvs.htm) Сторінка всіх ланцюжків даних
* [n2o.htm](priv/static/admin/n2o.htm) Сторінка службових таблиць сервісів N2O
* [mnesia.htm](priv/static/admin/mnesia.htm) Сторінка таблиць бази даних MNESIA

### Базові модулі

* [application.ex](lib/application.ex) Головний модуль Erlang/OTP додатку
* [schema.ex](lib/schema.ex) Схема даних, її налаштування
* [routes.ex](lib/routes.ex) Налаштування маршрутів HTML сторінок для веб-серверу
* [boot.ex](lib/boot.ex) Первинна ініціалізація тестових даних

### Редактори форм

* [phone_form.ex](lib/forms/phone_form.ex) Форма аутентифікації
* [process_form.ex](lib/forms/admin/process_form.ex) Форма створення процесу
* [process_row.ex](lib/forms/admin/process_row.ex) Таблична форма-рядок відображення процесу
* [hist_row.ex](lib/forms/admin/hist_row.ex) Таблична форма-рядок відображення кроку процесу

### Контролери сторінок

* [adm_act.ex](lib/pages/admin/adm_act.ex) Сторінка відображення історії процесу
* [adm_bpe.ex](lib/pages/admin/adm_bpe.ex) Сторінка переліку всіх процесів BPE
* [adm_form.ex](lib/pages/admin/adm_form.ex) Сторінка відображення всіх форм системи FORM
* [adm_kvs.ex](lib/pages/admin/adm_kvs.ex) Сторінка даних KVS
* [adm_n2o.ex](lib/pages/admin/adm_n2o.ex) Сторінка таблиць N2O
* [adm_mnesia.ex](lib/pages/admin/adm_mnesia.ex) Сторінка даних MNESIA
* [exo_login.ex](lib/pages/exo_login.ex) Сторінка аутентифікації
* [exo_tariffs.ex](lib/pages/exo_tariffs.ex) Сторінка налаштування тарифних моделей
* [exo_domains.ex](lib/pages/exo_domains.ex) Сторінка адміністрування користувачів системи
* [exo_service.ex](lib/pages/exo_service.ex) Сторінка підключення сервісів споживача

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

Дидактичні матеріали
--------------------

* <a href="https://tonpa.guru/stream/2019/2019-07-31%20N2O%20FAQ.htm">N2O FAQ</a>
* <a href="https://tonpa.guru/stream/2016/2016-01-29%20PhoenixFramework%20vs%20N2O.htm">PhoenixFramework vs N2O</a>
* <a href="https://n2o.dev/ua/books/vol.2/index.html">Книга N2O</a>
* <a href="https://n2o.dev/ua/books/vol.3/index.html">Книга ERP</a>
* <a href="https://tonpa.guru/stream/2022/2022-11-17%20%D0%A1%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0%20%D0%B2%D0%B5%D0%B1-%D1%84%D1%80%D0%B5%D0%B9%D0%BC%D0%B2%D0%BE%D1%80%D0%BA%D1%96%D0%B2.htm">Структура веб-фреймворків та приклад EXO</a>

Дописувачі
----------

* Максим Сохацький
