package zerossl;

import loader.Balancer;
import zerossl.api.CancelCertificate;
import zerossl.api.CreateCertificate;
import zerossl.api.DeleteCertificate;
import zerossl.api.DownloadCertificate;
import zerossl.api.DownloadCertificateZIP;
import zerossl.api.GenerateACMEEABCredentials;
import zerossl.api.GetCertificate;
import zerossl.api.ListCertificates;
import zerossl.api.ResendVerification;
import zerossl.api.VerificationStatus;
import zerossl.api.VerifyDomains;

/**
 * API Интерфейс сервиса [ZeroSSL](https://zerossl.com/).
 * 
 * Этот класс предоставляет общую точку для вызова всех методов API сервиса.
 * Сервис используется для выдачи, продления и удаления SSL сертификатов.
 */
@:dce
class ZeroSSL
{
    /**
     * Создать новый экземпляр.
     */
    public function new() {
    }

    /**
     * URL Адрес для вызова методов API.  
     * По умолчанию: `https://api.zerossl.com/`
     */
    public var url:String = "https://api.zerossl.com/";

    /**
     * Сервисный ключ.  
     * Перед вызовом любых методов вы **должны** указать ваш сервисный
     * ключ для авторизации на сервере API. Его можно получить в
     * [личном кабинете](https://app.zerossl.com/developer "ZeroSSL API Key") ZeroSSL.
     * 
     * По умолчанию: `null` (Перед вызовами укажите ключ)
     */
    public var accessKey:String = null;

    /**
     * Баланчировщик нагрузки вызовов к API.  
     * Не может быть `null`.
     */
    public var balancer(default, null):Balancer = new Balancer();

    /**
     * Запрос на получение нового сертификата.
     * @param params Параметры запроса.
     * @param callback Функция обратного вызова.
     * @param priority Приоритет для выполнения запроса.
     * @return Объект запроса.
     */
    public function createCertificate(params:CreateCertificateParams, callback:CreateCertificate->Void = null, priority:Int = 0):CreateCertificate {
        var item = new CreateCertificate(this, params, priority);
        item.callback = callback;
        item.load();
        return item;
    }

    /**
     * Запрос получения данных по сертификату.
     * @param params Параметры запроса.
     * @param callback Функция обратного вызова.
     * @param priority Приоритет для выполнения запроса.
     * @return Объект запроса.
     */
    public function getCertificate(params:GetCertificateParams, callback:GetCertificate->Void = null, priority:Int = 0):GetCertificate {
        var item = new GetCertificate(this, params, priority);
        item.callback = callback;
        item.load();
        return item;
    }

    /**
     * Запрос имеющихся сертификатов.
     * @param params Параметры запроса.
     * @param callback Функция обратного вызова.
     * @param priority Приоритет для выполнения запроса.
     * @return Объект запроса.
     */
    public function getCertificates(params:ListCertificatesParams, callback:ListCertificates->Void = null, priority:Int = 0):ListCertificates {
        var item = new ListCertificates(this, params, priority);
        item.callback = callback;
        item.load();
        return item;
    }

    /**
     * Отмена сертификата.
     * @param params Параметры запроса.
     * @param callback Функция обратного вызова.
     * @param priority Приоритет для выполнения запроса.
     * @return Объект запроса.
     */
    public function cancelCertificate(params:CancelCertificateParams, callback:CancelCertificate->Void = null, priority:Int = 0):CancelCertificate {
        var item = new CancelCertificate(this, params, priority);
        item.callback = callback;
        item.load();
        return item;
    }

    /**
     * Удаление сертификата.
     * @param params Параметры запроса.
     * @param callback Функция обратного вызова.
     * @param priority Приоритет для выполнения запроса.
     * @return Объект запроса.
     */
    public function deleteCertificate(params:DeleteCertificateParams, callback:DeleteCertificate->Void = null, priority:Int = 0):DeleteCertificate {
        var item = new DeleteCertificate(this, params, priority);
        item.callback = callback;
        item.load();
        return item;
    }

    /**
     * Получение учётных данных ACME EAB.
     * @param params Параметры запроса.
     * @param callback Функция обратного вызова.
     * @param priority Приоритет для выполнения запроса.
     * @return Объект запроса.
     */
    public function generateACMEEABCredentials(params:Dynamic, callback:GenerateACMEEABCredentials->Void = null, priority:Int = 0):GenerateACMEEABCredentials {
        var item = new GenerateACMEEABCredentials(this, params, priority);
        item.callback = callback;
        item.load();
        return item;
    }

    /**
     * Получить статус проверки сертификата. (Домена)
     * @param params Параметры запроса.
     * @param callback Функция обратного вызова.
     * @param priority Приоритет для выполнения запроса.
     * @return Объект запроса.
     */
    public function verificationStatus(params:VerificationStatusParams, callback:VerificationStatus->Void = null, priority:Int = 0):VerificationStatus {
        var item = new VerificationStatus(this, params, priority);
        item.callback = callback;
        item.load();
        return item;
    }

    /**
     * Повторная отправка проверки на email.
     * @param params Параметры запроса.
     * @param callback Функция обратного вызова.
     * @param priority Приоритет для выполнения запроса.
     * @return Объект запроса.
     */
    public function resendVerification(params:ResendVerificationParams, callback:ResendVerification->Void = null, priority:Int = 0):ResendVerification {
        var item = new ResendVerification(this, params, priority);
        item.callback = callback;
        item.load();
        return item;
    }

    /**
     * Запуск проверки верификации и подтверждения домена.
     * @param params Параметры запроса.
     * @param callback Функция обратного вызова.
     * @param priority Приоритет для выполнения запроса.
     * @return Объект запроса.
     */
    public function verifyDomains(params:VerifyDomainsParams, callback:VerifyDomains->Void = null, priority:Int = 0):VerifyDomains {
        var item = new VerifyDomains(this, params, priority);
        item.callback = callback;
        item.load();
        return item;
    }

    /**
     * Скачать сертификат.
     * @param params Параметры запроса.
     * @param callback Функция обратного вызова.
     * @param priority Приоритет для выполнения запроса.
     * @return Объект запроса.
     */
    public function downloadCertificate(params:DownloadCertificateParams, callback:DownloadCertificate->Void = null, priority:Int = 0):DownloadCertificate {
        var item = new DownloadCertificate(this, params, priority);
        item.callback = callback;
        item.load();
        return item;
    }

    /**
     * Скачать сертификат в ZIP файле.
     * @param params Параметры запроса.
     * @param callback Функция обратного вызова.
     * @param priority Приоритет для выполнения запроса.
     * @return Объект запроса.
     */
    public function downloadCertificateZIP(params:DownloadCertificateZIPParams, callback:DownloadCertificateZIP->Void = null, priority:Int = 0):DownloadCertificateZIP {
        var item = new DownloadCertificateZIP(this, params, priority);
        item.callback = callback;
        item.load();
        return item;
    }

    /**
     * Получить строковое представление объекта.  
     * Возвращает строковое описанияе этого экземпляра.
     * @return Строковое описание объекта.
     */
    @:keep
    public function toString():String {
        return '[ZeroSSL]';
    }
}