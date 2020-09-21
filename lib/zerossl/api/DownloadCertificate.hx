package zerossl.api;

import loader.DataFormat;
import loader.Method;
import zerossl.Protocol;

/**
 * Download Certificate (inline)
 * 
 * To download a certificate inline as JSON objects using the
 * ZeroSSL API, you can use the `download` endpoint below and
 * pass the given certificate ID (hash) to the API to the URL
 * inside the `{id}` parameter, as shown below.
 * 
 * **Please Note**  
 * Please note that only issued certificates can be downloaded.
 * 
 * @see https://zerossl.com/documentation/api/download-certificate-inline/
 */
class DownloadCertificate extends MethodAPI<DownloadCertificateParams, DownloadCertificateResponse, DownloadCertificate>
{
    @:allow(zerossl.ZeroSSL)
    private function new(parent:ZeroSSL, params:DownloadCertificateParams = null, priority:Int = 0) {
        super(parent, params, priority);

        req.url = parent.url + "certificates/" + params.id + "/download/return?access_key=" + parent.accessKey;
        req.method = Method.GET;
        ldr.dataFormat = DataFormat.JSON;
    }
}

/**
 * Параметры запроса к API.
 */
typedef DownloadCertificateParams = 
{
    /**
     * Use this parameter to specify your certificate ID / hash.
     */
    var id:String;
}