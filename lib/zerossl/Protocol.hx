package zerossl;

import haxe.DynamicAccess;

/**
 * Протокол взаимодействия с сервисом ZeroSSL.  
 * Базовый формат ответа сервера.
 */
typedef Response =
{
    /**
     * Результат выполнения запроса.  
     * В случае ошибки это значение будет равно `false`.
     */
    var success:Bool;

    /**
     * Ошибка выполнения запроса.  
     * Содержит описание причины ошибки, если такая имела место быть.
     */
    @:optional var error:ErrorResponse;
}

/**
 * Описание ошибки вызова API.
 * @see Документация: https://zerossl.com/documentation/api/error-codes/
 */
typedef ErrorResponse =
{
    /**
     * Код ошибки.  
     * Однозначно идентифицирует причину сбоя.
     */
    var code:ErrorCode;

    /**
     * Тип ошибки.  
     * Аналог для кода ошибки, только в виде строки.  
     * Пример: `certificate_not_found`
     */
    var type:String;

    /**
     * Дополнительная, справочная информация.
     */
    @:optional var info:String;

    /**
     * Дополнительные сведения.  
     * Могут быть получены в запросе от verify-domains.
     */
    @:optional var details:DynamicAccess<VerifyErrorResponse>;
}

/**
 * Details information of which the domains could be verified
 * and which could not be verified.
 */
typedef VerifyErrorResponse =
{
    /**
     * Returns `1` or `0` depending on whether or not your CNAME-record was found.
     */
    var cname_found:Int;

    /**
     * Returns `1` or `0` depending on whether the CNAME-record found is correct.
     */
    var record_correct:Int;

    /**
     * Returns the host-part (Name) of the required CNAME-record.
     */
    var target_host:String;

    /**
     * Returns the value-part (Point To) of the required CNAME-record.
     */
    var target_record:String;

    /**
     * Returns the value-part of the CNAME record found for the given domain.
     */
    var actual_record:String;
}

/**
 * The a series of sub-objects related to domain verification.
 */
typedef ValidationResponse =
{
    /**
     * Returns an array of eligible domain verification emails.
     */
    var email_validation:DynamicAccess<Array<String>>;

    /**
     * Returns a series of sub-objects (one for each domain in your
     * certificate) containing alternative verification methods.
     */
    var other_methods:DynamicAccess<OtherValidationResponse>;
}

/**
 * List of certificates.
 */
typedef ListCertificateResponse =
{
    >Response,
    
    /**
     * Returns the total number of results found for your query.
     */
    var total_count:Int;

    /**
     * Returns the number of results shown on the current page.
     */
    var result_count:Int;

    /**
     * Returns the current page number.
     */
    var page:Int;

    /**
     * Returns the specified pagination page limit.
     */
    var limit:Int;

    /**
     * Returns an array of certificates.  
     * For detailed information about certificate response objects,
     * please refer to the [Get Certificate](https://zerossl.com/documentation/api/get-certificate/) section.
     */
    var results:Array<CertificateResponse>;
}

/**
 * The certificate data containing all the details of your newly created
 * SSL certificate.
 */
typedef CertificateResponse =
{
    >Response,

    /**
     * Returns the internal certificate ID, also referred to as certificate hash.
     */
    var id:String;

    /**
     * Returns a numeric ID to identify the certificate type.
     */
    var type:CertificateType;

    /**
     * Returns the common name (e.g. `domain.com`) of your certificate.
     */
    var common_name:String;

    /**
     * Returns any additional domains (SANs) in your certificate.
     */
    var additional_domains:String;

    /**
     * Returns the exact time (UTC) your certificate was created.  
     * Example: `2020-12-18 00:00:00`
     */
    var created:String;

    /**
     * Returns the exact time (UTC) your certificate will expire.  
     * Example: `2020-12-18 00:00:00`
     */
    var expires:String;

    /**
     * Returns the current certificate status.
     */
    var status:CertificateStatus;

    /**
     * Returns `null` if domain verification has not been initiated, or the
     * selected verification type. Possible values: `EMAIL` (email verification),
     * `CNAME_CSR_HASH` (CNAME verification), `HTTP_CSR_HASH` (HTTP file upload),
     * `HTTPS_CSR_HASH` (HTTPS file upload)
     */
    var validation_type:ValidationMethod;

    /**
     * Returns one or a comma-separated list of selected verification emails if
     * email verification is chosen for this certificate.
     */
    var validation_emails:String;

    /**
     * Returns the ID (certificate hash) of the existing certificate this
     * certificate is replacing as part of a renewal.
     */
    var replacement_for:String;

    /**
     * Returns a series of sub-objects related to domain verification.
     */
    var validation:ValidationResponse;
}

/**
 * The a series of sub-objects (one for each domain in your certificate)
 * containing alternative verification methods.
 */
typedef OtherValidationResponse =
{
    /**
     * Returns the URL (http format) your verification file must be
     * uploaded to as part of domain verification.
     */
    var file_validation_url_http:String;

    /**
     * Returns the URL (https format) your verification file must be
     * uploaded to as part of domain verification.
     */
    var file_validation_url_https:String;

    /**
     * Returns the content your verification file must contain,
     * consisting of three lines of plain-text.
     */
    var file_validation_content:Array<String>;

    /**
     * Returns the host-part (Name) of the CNAME-record that must be
     * created as part of domain verification.
     */
    var cname_validation_p1:String;

    /**
     * Returns the value-part (Point To) of the CNAME-record that must
     * be created as part of domain verification.
     */
    var cname_validation_p2:String;
}

/**
 * Your ACME EAB credentials.
 */
typedef GenerateACMEEABCredentialsResponse = 
{
    >Response,

    /**
     * Returns your EAB KID value.
     */
    var eab_kid:String;

    /**
     * Returns your EAB HMAC key value.
     */
    var eab_hmac_key:String;
}

/**
 * Information about the domain verification status for a specific certificate.
 */
typedef VerificationStatusResponse =
{
    >Response,

    /**
     * Returns `1` or `0` depending on whether or not domain verification
     * has been completed.
     */
    var validation_completed:Int;

    /**
     * Returns a sub-object for each domain (or pair of www and non-www domains)
     * containing verification information.
     */
    var details:DynamicAccess<DetailVerificationStatusResponse>;
}

/**
 * Domain verification information.
 */
typedef DetailVerificationStatusResponse =
{
    /**
     * Returns the verification email selected for the given domain.
     */
    var method:String;

    /**
     * Returns the current verification status of the given domain.
     */
    var status:String;
}

/**
 * Certificate files in JSON format.  
 * Containing: `certificate.crt` and `ca_bundle.crt` properties.
 */
typedef DownloadCertificateResponse =
{
    >Response,

    /**
     * Returns your primary certificate file.
     */
    //var certificate.crt:String; // <-- Ограниченный Haxe синтаксис не позволяет это выразить

    /**
     * Returns your certificate bundle file.
     */
    //var ca_bundle.crt:String; // <-- Ограниченный Haxe синтаксис не позволяет это выразить
}

/**
 * Тип сертификата.  
 */
enum abstract CertificateType(String) from String to String
{
    /**
     * Обычный на 90 дней.
     */
    var D90 = "1";

    /**
     * Wildcard на 90 дней.
     */
    var WILDCARD_D90 = "2";

    /**
     * Многодоменный на 90 дней.
     */
    var MULTI_DOMAIN_D90 = "3";

    /**
     * Обычный на 1 год.
     */
    var Y1 = "4";

    /**
     * Wildcard на 1 год.
     */
    var WILDCARD_Y1 = "5";

    /**
     *  Многодоменный на 1 год.
     */
    var MULTI_DOMAIN_Y1 = "6";
}

/**
 * Статус сертификата.
 */
enum abstract CertificateStatus(String) from String to String
{
    /**
     * Черновик.
     */
    var DRAFT = "draft";

    /**
     * Ожидает проверки.
     */
    var PENDING_VALIDATION = "pending_validation";

    /**
     * Выпущен.
     */
    var ISSUED = "issued";

    /**
     * Отменён.
     */
    var CANCELLED = "cancelled";

    /**
     * Скоро истекает.
     */
    var EXPIRING_SOON = "expiring_soon";

    /**
     * Истёк.
     */
    var EXPIRED = "expired";
}

/**
 * Способ проверки владения доменом.
 */
enum abstract ValidationMethod(String) from String to String
{
    /**
     * Domain verification has not been initiated, or the selected verification type.
     */
    var NULL  = "null";

    /**
     * Email verification.
     */
    var EMAIL  = "EMAIL";

    /**
     * CNAME verification.
     */
    var CNAME_CSR_HASH  = "CNAME_CSR_HASH";

    /**
     * HTTP file upload.
     */
    var HTTP_CSR_HASH  = "HTTP_CSR_HASH";

    /**
     * HTTPS file upload.
     */
    var HTTPS_CSR_HASH  = "HTTPS_CSR_HASH";
}