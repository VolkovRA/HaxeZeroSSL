package zerossl.api;

import loader.DataFormat;
import loader.Method;
import zerossl.Protocol;

/**
 * Verify Domains
 * 
 * In order for your certificate to be issued, all domains included
 * in your certificate will need to be verified. There are four
 * methods that can be used to verify domains: email verification,
 * verification via DNS (CNAME), verification via HTTP file upload
 * and verification via HTTPS file upload.
 * 
 * To initiate domain verification, you will need to make a request
 * to the endpoint below carrying your API access key as well as
 * some HTTP POST request parameters. Please note that `{id}` must
 * be replaced with your certificate ID (hash).
 * 
 * @see https://zerossl.com/documentation/api/verify-domains/
 */
class VerifyDomains extends MethodAPI<VerifyDomainsParams, CertificateResponse, VerifyDomains>
{
    @:allow(zerossl.ZeroSSL)
    private function new(parent:ZeroSSL, params:VerifyDomainsParams = null, priority:Int = 0) {
        super(parent, params, priority);

        req.url = parent.url + "certificates/" + params.id + "/challenges?access_key=" + parent.accessKey;
        req.method = Method.POST;
        req.data = params;
        ldr.dataFormat = DataFormat.JSON;
    }
}

/**
 * Параметры запроса к API.
 */
typedef VerifyDomainsParams = 
{
    /**
     * Use this parameter to specify your certificate ID / hash.
     */
    var id:String;

    /**
     * Use this parameter to specify the verification method to
     * use for this certificate. Possible values: `EMAIL` (email
     * verification), `CNAME_CSR_HASH` (CNAME verification),
     * `HTTP_CSR_HASH` (HTTP file upload), `HTTPS_CSR_HASH` (HTTPS
     * file upload)
     */
    var validation_method:ValidationMethod;

    /**
     * If your selected verification method is Email Verification,
     * use this parameter to specify one or multiple verification
     * email addresses. You need to specify one verification email
     * address per domain.
     */
    @:optional var validation_email:String;
}