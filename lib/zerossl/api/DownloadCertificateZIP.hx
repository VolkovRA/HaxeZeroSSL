package zerossl.api;

import loader.DataFormat;
import loader.Method;

/**
 * Download Certificate (ZIP)
 * 
 * To download a certificate as a ZIP-file using the ZeroSSL API,
 * you can use the `download` endpoint below and pass the given
 * certificate ID (hash) to the API to the URL inside the `{id}`
 * parameter, as shown below.
 * 
 * **Please Note**  
 * Please note that only issued certificates can be downloaded.
 * 
 * @see https://zerossl.com/documentation/api/download-certificate/
 */
class DownloadCertificateZIP extends MethodAPI<DownloadCertificateZIPParams, Dynamic, DownloadCertificateZIP>
{
    @:allow(zerossl.ZeroSSL)
    private function new(parent:ZeroSSL, params:DownloadCertificateZIPParams = null, priority:Int = 0) {
        super(parent, params, priority);

        req.url = parent.url + "certificates/" + params.id + "/download?access_key=" + parent.accessKey;
        req.method = Method.GET;
        ldr.dataFormat = DataFormat.BINARY;
    }
}

/**
 * Параметры запроса к API.
 */
typedef DownloadCertificateZIPParams = 
{
    /**
     * Use this parameter to specify your certificate ID / hash.
     */
    var id:String;
}