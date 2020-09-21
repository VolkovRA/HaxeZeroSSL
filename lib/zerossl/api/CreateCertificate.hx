package zerossl.api;

import loader.DataFormat;
import loader.Method;
import zerossl.Protocol;

/**
 * Create Certificate
 * 
 * To create a new SSL certificate using the ZeroSSL API you
 * will need to make an HTTP POST request to the API's
 * `certificates` endpoint. Below you will find the API request
 * URL you will need to make your request to as well as all
 * required and optional request parameters.
 * 
 * @see https://zerossl.com/documentation/api/create-certificate/
 */
class CreateCertificate extends MethodAPI<CreateCertificateParams, CertificateResponse, CreateCertificate>
{
    @:allow(zerossl.ZeroSSL)
    private function new(parent:ZeroSSL, params:CreateCertificateParams = null, priority:Int = 0) {
        super(parent, params, priority);

        req.url = parent.url + "certificates?access_key=" + parent.accessKey;
        req.method = Method.POST;
        req.data = params;
        ldr.dataFormat = DataFormat.JSON;
    }
}

/**
 * Параметры запроса к API.
 */
typedef CreateCertificateParams = 
{
    /**
     * Use this parameter to specify one or multiple comma-separated
     * domains to include in your certificate.  
     * Пример: `www.funnycarrot.ru,funnycarrot.ru`
     */
    var certificate_domains:String;

    /**
     * Use this parameter to specify either `90` for a 90-day
     * certificate or `365` for a 1-year certificate.
     */
    var certificate_validity_days:String;

    /**
     * Use this parameter to specify a CSR value for your certificate.  
     * Your CSR value will need to be 2048-bit encrypted.
     * 
     * Please note that in order for your certificate to be created you
     * will be required to specify an existing CSR using the certificate_csr
     * parameter. [Here's a tool](https://csrgenerator.com/ "Generate a Certificate Signing Request")
     * you can use to generate a new CSR.
     */
    var certificate_csr:String;
}