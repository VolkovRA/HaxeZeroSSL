package zerossl.api;

import loader.DataFormat;
import loader.Method;
import zerossl.Protocol;

/**
 * Get Domain Verification Status
 * 
 * To retrieve information about the domain verification status for
 * a specific certificate using the ZeroSSL API, simply make an HTTP
 * GET request to the API endpoint below, specifying your certificate
 * using its ID (hash) inside the URL's `{id}` parameter, as shown below.
 * 
 * **Only for Email Verification**  
 * Please note that the verification status endpoint is only useful if
 * Email Verification is your selected domain verification method. Other
 * verification methods (CNAME and File Upload) usually provide instant
 * verification results using the [Verify Domains](https://zerossl.com/documentation/api/verify-domains/)
 * endpoint.
 * 
 * @see https://zerossl.com/documentation/api/verification-status/
 */
class VerificationStatus extends MethodAPI<VerificationStatusParams, VerificationStatusResponse, VerificationStatus>
{
    @:allow(zerossl.ZeroSSL)
    private function new(parent:ZeroSSL, params:VerificationStatusParams = null, priority:Int = 0) {
        super(parent, params, priority);

        req.url = parent.url + "certificates/" + params.id + "/status?access_key=" + parent.accessKey;
        req.method = Method.GET;
        ldr.dataFormat = DataFormat.JSON;
    }
}

/**
 * Параметры запроса к API.
 */
typedef VerificationStatusParams = 
{
    /**
     * Use this parameter to specify your certificate ID (hash).
     */
    var id:String;
}