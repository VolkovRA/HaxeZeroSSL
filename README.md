# Haxe клиент для [ZeroSSL](https://zerossl.com/ "Trusted Certificate Authority") REST API

Зачем это нужно
------------

Позволяет использовать [REST API](https://zerossl.com/documentation/api/) центра сертификации напрямую из Haxe приложения в JavaScript, чтобы полностью автоматизировать все операций с сертификатами.

Описание
------------

Это Haxe клиент для среды JavaScript. Включает полную реализацию всех методов ZeroSSL API, типизацию и перенесённую документацию в комментарий к классам. Позволяет легко вызывать методы сервиса и обрабатывать ответы. Для сетевых HTTP/S вызовов используется кроссплатформенная библиотека [HaxeLoader](https://github.com/VolkovRA/HaxeLoader), благодоря чему этот клиент может работать как в NodeJS, так и в браузере. (Второе не тестировалось)

Как использовать
------------------------------

```
var api = new ZeroSSL();
api.accessKey = "********************************";

// Создать сертификат:
api.createCertificate({
    certificate_domains: "mydomain.ru",
    certificate_validity_days: "90",
    certificate_csr: csr,
},
function(item) {
    trace(item.error);
    trace(item.data);
});
```

Добавление библиотеки
------------------------------

1. Установите haxelib себе на локальную машину, чтобы вы могли использовать библиотеки Haxe.
2. Установите zerossl себе на локальную машину, глобально, используя cmd:
```
haxelib git zerossl https://github.com/VolkovRA/HaxeZeroSSL master
```
Синтаксис команды:
```
haxelib git [project-name] [git-clone-path] [branch]
haxelib git minject https://github.com/massiveinteractive/minject.git         # Use HTTP git path.
haxelib git minject git@github.com:massiveinteractive/minject.git             # Use SSH git path.
haxelib git minject git@github.com:massiveinteractive/minject.git v2          # Checkout branch or tag `v2`.
```
3. Добавьте библиотеку zerossl в ваш Haxe проект.

Полезные инструменты:
- Онлайн [CSR Generator](https://csrgenerator.com/), который необходим для заказа сертификата.
- Онлайн [валидатор CSR](https://ssltools.digicert.com/checker/views/csrCheck.jsp) для проверки его корректности.

Дополнительная информация:
 * [Документация ZeroSSL](https://zerossl.com/documentation/api/ "ZeroSSL Documentation")
 * [Документация Haxelib](https://lib.haxe.org/documentation/using-haxelib/ "Using Haxelib")
 * [Документация компилятора Haxe](https://haxe.org/manual/compiler-usage-hxml.html "Configure compile.hxml")