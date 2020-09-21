package zerossl.api;

import loader.DataFormat;
import loader.Method;
import zerossl.Protocol;

/**
 * Cancel Certificate
 * 
 * To cancel an existing certificate using the ZeroSSL API
 * you will need to make an HTTP POST request to the API
 * endpoint below and specify your certificate using its
 * ID (hash) inside the URL's `{id}` parameter, as shown below.
 * 
 * **Limitations**  
 * Please note that only certificates with status `draft` or
 * `pending_validation` can be cancelled.
 * 
 * @see https://zerossl.com/documentation/api/cancel-certificate/
 */
class CancelCertificate extends MethodAPI<CancelCertificateParams, Response, CancelCertificate>
{
    @:allow(zerossl.ZeroSSL)
    private function new(parent:ZeroSSL, params:CancelCertificateParams = null, priority:Int = 0) {
        super(parent, params, priority);

        req.url = parent.url + "certificates/" + params.id + "/cancel?access_key=" + parent.accessKey;
        req.method = Method.POST;
        ldr.dataFormat = DataFormat.JSON;
    }
}

/**
 * Параметры запроса к API.
 */
typedef CancelCertificateParams = 
{
    /**
     * Use this parameter to specify your certificate ID (hash).
     */
    var id:String;
}