package zerossl.api;

import loader.DataFormat;
import loader.Method;
import zerossl.Protocol;

/**
 * List Certificates
 * 
 * To retrieve information about an existing certificate using
 * the ZeroSSL API you will need to make an HTTP GET request to
 * the API's `certificates`. You can use a series of GET parameters
 * to specify certificate status, search and configure pagination.
 * 
 * @see https://zerossl.com/documentation/api/list-certificates/
 */
class ListCertificates extends MethodAPI<ListCertificatesParams, ListCertificateResponse, ListCertificates>
{
    @:allow(zerossl.ZeroSSL)
    private function new(parent:ZeroSSL, params:ListCertificatesParams = null, priority:Int = 0) {
        super(parent, params, priority);

        req.url = parent.url + "certificates/?access_key=" + parent.accessKey;
        req.method = Method.GET;
        req.data = params;
        ldr.dataFormat = DataFormat.JSON;
    }
}

/**
 * Параметры запроса к API.
 */
typedef ListCertificatesParams = 
{
    /**
     * Use this parameter to specify one or multiple comma-separated
     * certificate status values.
     */
    @:optional var certificate_status:CertificateStatus;

    /**
     * Use this parameter to search for specific certificates using
     * full-text search.
     */
    @:optional var search:String;

    /**
     * Use this parameter to specify a pagination limit.  
     * Default: `100`
     */
    @:optional var limit:Int;

    /**
     * Use this parameter to specify a pagination page.  
     * Default: `1`
     */
    @:optional var page:Int;
}