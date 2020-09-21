package zerossl.api;

import loader.DataFormat;
import loader.Method;
import zerossl.Protocol;

/**
 * Generate ACME EAB Credentials
 * 
 * To generate a set of ACME EAB credentials using the ZeroSSL
 * API you will need to make an HTTP POST request to the API
 * endpoint below.
 * 
 * @see https://zerossl.com/documentation/api/generate-eab-credentials/
 */
class GenerateACMEEABCredentials extends MethodAPI<Dynamic, GenerateACMEEABCredentialsResponse, GenerateACMEEABCredentials>
{
    @:allow(zerossl.ZeroSSL)
    private function new(parent:ZeroSSL, params:Dynamic = null, priority:Int = 0) {
        super(parent, params, priority);

        req.url = parent.url + "acme/eab-credentials?access_key=" + parent.accessKey;
        req.method = Method.POST;
        ldr.dataFormat = DataFormat.JSON;
    }
}