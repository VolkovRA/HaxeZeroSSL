package zerossl.api;

import js.lib.Error;
import loader.ILoader;
import loader.Request;
import zerossl.Protocol;

/**
 * Экземпляр вызываемого метода.  
 * Это абстрактный, базовый класс для всех методов API ZeroSSL.
 * Для доступа к экземплярам этого класса вы должны использовать
 * методы: `zerossl.ZeroSSL`.
 * 
 * Этот класс используется для:
 * 1. Обобщения свойств, методов и реализации выполняемых запросов.
 * 2. Возможности простого добавления реализации новых методов API,
 *    с типизацией.
 * 3. Создания отдельного контекста (экземпляра класса) для каждого
 *    отдельного вызова API. (Хранить данные между вызовами)
 */
@:dce
class MethodAPI<P:Dynamic, D:Response, T:MethodAPI<P,D,T>> 
{
    /**
     * ID Для следующего экземпляра класса.  
     * Этот счётчик автоматически увеличивается на один при создании
     * нового экземплара класса.
     * 
     * По умолчанию: `1`
     */
    static public var nextID(default, null):Int = 1;

    /**
     * Загрузчик.  
     * Кроссплатформенно выполняет запрос и загрузку данных.  
     * Не может быть `null`
     */
    private var ldr:ILoader;

    /**
     * Параметры запроса.  
     * Этот объект **должен** быть настроен до вызова метода `load()`
     * в классе - наследнике.  
     * Не может быть `null`
     */
    private var req:Request;

    /**
     * Создать новый запрос.
     * @param parent Родительский объект.
     * @param params Параметры вызова.
     * @param priority Приоритет вызова.
     * @throws Error Родительский объект не должен быть `null`.
     */
    private function new(parent:ZeroSSL, params:P = null, priority:Int = 0) {
        if (parent == null)
            throw new Error("Parent cannot be null");

        this.id = id++;
        this.parent = parent;
        this.params = params;
        this.priority = priority;

        // Выбор реализации:
        #if nodejs
        ldr = new loader.nodejs.LoaderNodeJS();
        req = new loader.Request();
        #else
        ldr = new loader.xhr.LoaderXHR();
        req = new loader.Request();
        #end
    }

    /**
     * ID Запроса.  
     * Содержит уникальный идентификатор этого запроса.  
     * Не может быть `null`
     */
    public var id(default, null):Int;

    /**
     * Родительский объект.  
     * Не может быть `null`
     */
    public var parent(default, null):ZeroSSL;

    /**
     * URL Адрес выполняемого запроса.
     */
    public var url(get, never):String;
    inline function get_url():String {
        return req.url;
    }

    /**
     * Параметры вызова.  
     * Содержит объект, переданный в конструктор вызова.  
     * Может быть `null`, если параметры не передавались.
     */
    public var params(default, null):P;

    /**
     * Приоритет этого запроса.  
     * Чем выше приоритет, теб раньше остальных он отправится к API.  
     * По умолчанию: `0`
     */
    public var priority(default, null):Int;

    /**
     * Ошибка.  
     * Свойство содержит описание ошибки, если такая имела место
     * быть при запросе к API.  
     * По умолчанию: `null`
     */
    public var error:Error = null;

    /**
     * Загруженные данные.  
     * Становятся доступны после завершения вызова. Перед доступом
     * к данным проверьте свойство `error` на наличие ошибок.  
     * По умолчанию: `null`
     */
    public var data:D = null;

    /**
     * Произвольные, пользовательские данные.  
     * Позволяет хранить любые данные между вызовами.  
     * По умолчанию: `null`
     */
    public var userData:Dynamic = null;

    /**
     * Колбек обратного вызова.  
     * Если задан, вызывается после завершения выполнения запроса,
     * в том числе и в случае ошибки.  
     * По умолчанию: `null`
     */
    public var callback:T->Void = null;

    /**
     * Запустить выполнение запроса.
     */
    @:allow(zerossl.ZeroSSL)
    private function load():Void {
        ldr.balancer = parent.balancer;
        ldr.priority = priority;
        ldr.onComplete = function(item) {
            data = item.data;
            if (data.error != null)
                error = new Error('ZeroSSL API returned error code: ' + data.error.code + ' ' + data.error.type + (data.error.info==null?'':('. '+data.error.info)));
            if (callback != null)
                callback(untyped this);
        }
        ldr.load(req);
    }

    /**
     * Отменить вызов.  
     * Вызов инорируется, если запрос уже был выполнен.  
     * Никакие данные не удаляются.
     */
    public function cancel():Void {
        if (ldr != null) {
            ldr.close();
            ldr = null;
        }
    }

    /**
     * Получить строковое представление объекта.  
     * Возвращает строковое описание этого экземпляра.
     * @return Возвращает строковое описание этого экземпляра.
     */
    @:keep
    public function toString():String {
        return '[MethodAPI url="' + url + '"]';
    }
}