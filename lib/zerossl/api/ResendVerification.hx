package zerossl.api;

import loader.DataFormat;
import loader.Method;
import zerossl.Protocol;

/**
 * Resend Verification Email
 * 
 * To resend all verification emails for a specific certificate
 * using the ZeroSSL API, simply make an HTTP GET request to the
 * API endpoint below, specifying your certificate using its ID
 * (hash) inside the URL's `{id}` parameter, as shown below.
 * 
 * **Only for Email Verification**  
 * Please note that this API endpoint can only be used if Email
 * Verification is your selected domain verification method.
 * 
 * @see https://zerossl.com/documentation/api/resend-verification/
 */
class ResendVerification extends MethodAPI<ResendVerificationParams, Response, ResendVerification>
{
    @:allow(zerossl.ZeroSSL)
    private function new(parent:ZeroSSL, params:ResendVerificationParams = null, priority:Int = 0) {
        super(parent, params, priority);

        req.url = parent.url + "certificates/" + params.id + "/challenges/email?access_key=" + parent.accessKey;
        req.method = Method.POST;
        ldr.dataFormat = DataFormat.JSON;
    }
}

/**
 * Параметры запроса к API.
 */
typedef ResendVerificationParams = 
{
    /**
     * Use this parameter to specify your certificate ID / hash.
     */
    var id:String;
}