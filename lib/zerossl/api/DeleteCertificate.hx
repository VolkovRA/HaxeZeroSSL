package zerossl.api;

import loader.DataFormat;
import loader.Method;
import zerossl.Protocol;

/**
 * Delete Certificate
 * 
 * To delete an existing certificate using the ZeroSSL API you
 * will need to make an HTTP DELETE request to the API endpoint
 * below and specify your certificate using its ID (hash) inside
 * the URL's `{id}` parameter, as shown below.
 * 
 * **Limitations**  
 * Please note that only certificates with status `draft` or
 * `pending_validation` can be deleted.
 * 
 * @see https://zerossl.com/documentation/api/delete-certificate/
 */
class DeleteCertificate extends MethodAPI<DeleteCertificateParams, Response, DeleteCertificate>
{
    @:allow(zerossl.ZeroSSL)
    private function new(parent:ZeroSSL, params:DeleteCertificateParams = null, priority:Int = 0) {
        super(parent, params, priority);

        req.url = parent.url + "certificates/" + params.id + "?access_key=" + parent.accessKey;
        req.method = Method.DELETE;
        ldr.dataFormat = DataFormat.JSON;
    }
}

/**
 * Параметры запроса к API.
 */
typedef DeleteCertificateParams = 
{
    /**
     * Use this parameter to specify your certificate ID (hash).
     */
    var id:String;
}