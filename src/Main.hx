package;

import zerossl.Protocol;
import zerossl.ZeroSSL;

/**
 * Пример.
 */
class Main 
{
    static function main() {
        /**
         * Тестовый CSR для:
         * - **Common name:** funnycarrot.ru
         * - **Organization:** Sebirykov Ivan Genadievich
         * - **Organizational unit:** Finance
         * - **City/locality:** Moscow
         * - **State/province:** Moscows state
         * - **Country:** RU
         * - **Signature algorithm:** SHA256
         * - **Key algorithm:** RSA
         * - **Key size:** 2048
         * 
         * Разное:
         * - Проверка валидности CSR: https://ssltools.digicert.com/checker/views/csrCheck.jsp
         * - Генератор CSR: https://csrgenerator.com/
         */
        var csr = 
            "-----BEGIN CERTIFICATE REQUEST-----\n" +
            "MIICzDCCAbQCAQAwgYYxCzAJBgNVBAYTAlJVMRcwFQYDVQQDDA5mdW5ueWNhcnJv\n" +
            "dC5ydTEPMA0GA1UEBwwGTW9zY293MSMwIQYDVQQKDBpTZWJpcnlrb3YgSXZhbiBH\n" +
            "ZW5hZGlldmljaDEWMBQGA1UECAwNTW9zY293cyBzdGF0ZTEQMA4GA1UECwwHRmlu\n" +
            "YW5jZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALK0vlkMR/gegxxy\n" +
            "eedQSWRdMLzc380fydOjOh2lSSZOS7LVrfbB+9UObab/IIlojgft0NmJHSYb8Mic\n" +
            "/YFNBna+6V3eKe6uhQjI3T5ahsSuFbxmjHke/8bX5bYC3KCz1sxUx+CUflI/hM2N\n" +
            "4vGnWQJSyCVbMof3lZpkEvJWJpLa3kMjRBbKLa1zeTait5FlGxDKttMassd5uX+O\n" +
            "U9NmHruZYvHMrzRTczIyYZwNsF+mQwwu352dWWVDm1+zDgu8bVA5O+dwatMB+ivQ\n" +
            "dWgvYk0M/ag6pOIns81zVSU7Gf9Llv7KgqttVNVUcv/FwEh0k2wNszXlXy3H+5jY\n" +
            "jDYnSxMCAwEAAaAAMA0GCSqGSIb3DQEBCwUAA4IBAQCt9tK3ZkUS68BP8+Sj9zK/\n" +
            "2pnUeIE3dmlubMoqPBerIYMrf4dEaVUdNuU9gPNHISaYrrBSyCzCGnFOL4+Rj5Wj\n" +
            "9JctEVsuUYfyg/N1b0EdVD9cPJQsezBPOXYo6WrtJ6FH/ziRb1QSEl7bpqQYyP9n\n" +
            "4lXxph4ZgVNRvMubpR3MtbTZDG3S40e13kxhmns2mz2VXZOjFSFluk/lU/0njxou\n" +
            "ODeks+66hd8n9AphXwo7tUDeKJqLC+iQ+u6/feQ6J9zrvKMr0G/R9L2eRbikXIDC\n" +
            "xUIV1TlCn/eR2r7mt19CKNYdi3X8ma+XxOl+RjptnL+PxvnflgqK+If9YRSAeUvx\n" +
            "-----END CERTIFICATE REQUEST-----\n";

        var api = new ZeroSSL();
        api.accessKey = "********************************";

        /*
        // Создать сертификат:
        api.createCertificate({
            certificate_domains: "mydomain.ru",
            certificate_validity_days: "90",
            certificate_csr: csr,
        },
        function(item) {
            trace(item.error);
            trace(item.data);
        });
        */

        /*
        // Информация по сертификату:
        api.getCertificate({
            id: "61c938bc93de08c4e68f3b833540b42e"
        },
        function(item) {
            trace(item.error);
            trace(item.data);
        });
        */

        /*
        // Информация по сертификатам:
        api.getCertificates({
        },
        function(item) {
            trace(item.error);
            trace(item.data);
        });
        */

        /*
        // Отмена сертификата:
        api.cancelCertificate({
            //id: "61c938bc93de08c4e68f3b833540b42e"
            //id: "81098e4b81b29369cd5f9d8383c5f157"
        },
        function(item) {
            trace(item.error);
            trace(item.data);
        });
        */

        /*
        // Удаление сертификата:
        api.deleteCertificate({
            id: "61c938bc93de08c4e68f3b833540b42e"
            //id: "81098e4b81b29369cd5f9d8383c5f157"
        },
        function(item) {
            trace(item.error);
            trace(item.data);
        });
        */

        /*
        // Получение учётных данных ACME EAB:
        api.generateACMEEABCredentials({
        },
        function(item) {
            trace(item.error);
            trace(item.data);
        });
        */

        /*
        // Получение статуса проверки сертификата:
        api.verificationStatus({
            id: "81098e4b81b29369cd5f9d8383c5f157"
        },
        function(item) {
            trace(item.error);
            trace(item.data);
        });
        */

        /*
        // Повторная отправка проверки на email:
        api.resendVerification({
            id: "81098e4b81b29369cd5f9d8383c5f157"
        },
        function(item) {
            trace(item.error);
            trace(item.data);
        });
        */

        /*
        // Запуск проверки домена:
        api.verifyDomains({
            id: "81098e4b81b29369cd5f9d8383c5f157",
            validation_method: ValidationMethod.CNAME_CSR_HASH,
        },
        function(item) {
            trace(item.error);
            trace(item.data);
        });
        */


        // Скачивание сертификата:
        api.downloadCertificate({
            id: "81098e4b81b29369cd5f9d8383c5f157",
        },
        function(item) {
            trace(item.error);
            trace(item.data);
        });
        

        /*
        // Скачивание сертификата в ZIP:
        api.downloadCertificateZIP({
            id: "81098e4b81b29369cd5f9d8383c5f157",
        },
        function(item) {
            trace(item.error);
            trace(item.data);
        });
        */
    }
}