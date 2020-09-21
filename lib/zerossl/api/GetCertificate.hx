package zerossl.api;

import loader.DataFormat;
import loader.Method;
import zerossl.Protocol;

/**
 * Get Certificate
 * 
 * To retrieve information about an existing certificate using
 * the ZeroSSL API you will need to make an HTTP GET request
 * to the API's `certificates` and pass the given certificate ID
 * (hash) to the URL inside the `{id}` parameter, as shown below.
 * 
 * @see https://zerossl.com/documentation/api/get-certificate/
 */
class GetCertificate extends MethodAPI<GetCertificateParams, CertificateResponse, GetCertificate>
{
    @:allow(zerossl.ZeroSSL)
    private function new(parent:ZeroSSL, params:GetCertificateParams = null, priority:Int = 0) {
        super(parent, params, priority);

        req.url = parent.url + "certificates/" + params.id + "?access_key=" + parent.accessKey;
        req.method = Method.GET;
        ldr.dataFormat = DataFormat.JSON;
    }
}

/**
 * Параметры запроса к API.
 */
typedef GetCertificateParams = 
{
    /**
     * Use this parameter to specify your certificate ID / hash.
     */
    var id:String;
}