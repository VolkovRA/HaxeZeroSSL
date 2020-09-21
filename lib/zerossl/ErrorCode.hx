package zerossl;

/**
 * Код ошибки.  
 * Однозначно идентифицирует причину ошибки.
 * @see Документация: https://zerossl.com/documentation/api/error-codes/
 */
enum abstract ErrorCode(Int) from Int to Int
{
    /////////////////
    //   GENERAL   //
    /////////////////

    /**
     * User has provided an invalid API access key.
     */
    var INVALID_ACCESS_KEY = 101;

    /**
     * User has provided an invalid API function.
     */
    var INVALID_API_FUNCTION = 103;

    /**
     * User has made a non-supported API request.
     */
    var INCORRECT_REQUEST_TYPE = 2800;

    /**
     * User does not have the permissions to access
     * this resource.
     */
    var PERMISSION_DENIED = 2801;

    /**
     * User has not provided a certificate ID (hash).
     */
    var MISSING_CERTIFICATE_HASH = 2802;

    /**
     * The given certificate ID (hash) could not be
     * found.
     */
    var CERTIFICATE_NOT_FOUND = 2803;



    ////////////////////////////
    //   CREATE CERTITICATE   //
    ////////////////////////////

    /**
     * The current certificate cannot be issued
     * due to unpaid invoices on user account.
     */
    var CANNOT_ISSUE_CERTIFICATE_UNPAID_UPGRADE_INVOICES = 2804;

    /**
     * User has provided an invalid certificate
     * type.
     */
    var INVALID_CERTIFICATE_TYPE = 2805;

    /**
     * User has not provided a valid certificate
     * type.
     */
    var MISSING_CERTIFICATE_TYPE = 2806;

    /**
     * User has not provided a valid certificate
     * validity.
     */
    var INVALID_CERTIFICATE_VALIDITY = 2807;

    /**
     * User has not provided one or more invalid
     * certificate domains.
     */
    var INVALID_CERTIFICATE_DOMAIN = 2808;

    /**
     * Wildcards cannot be included in multi-domain
     * certificates.
     */
    var WILDCARD_DOMAINS_NOT_ALLOWED_IN_MULTIDOMAIN_CERTIFICATE = 2809;

    /**
     * User has not provided one or more invalid
     * domains in multi-domain request.
     */
    var INVALID_DOMAINS_IN_MULTIDOMAIN_REQUEST = 2810;

    /**
     * User has not provided one or more duplicate
     * domains.
     */
    var DUPLICATE_DOMAINS_IN_ARRAY = 2811;

    /**
     * User has not provided any certificate
     * domains.
     */
    var MISSING_CERTIFICATE_DOMAINS = 2812;

    /**
     * Only issued certificates can be renewed
     * or replaced by a new certificate.
     */
    var CANNOT_REPLACE_CERTIFICATE_OTHER_REPLACEMENT_IN_DRAFT = 2813;

    /**
     * User does not have the permissions to
     * access certificate to renew.
     */
    var PERMISSION_DENIED_ON_ORIGINAL_CERTIFICATE = 2814;

    /**
     * Only issued certificates can be renewed
     * or replaced by a new certificate.
     */
    var ORIGINAL_CERTIFICATE_NOT_ACTIVE = 2815;

    /**
     * Certificate to renew was not found.
     */
    var CANNOT_FIND_ORIGINAL_CERTIFICATE = 2816;

    /**
     * Limit of certificates on user account
     * was reached.
     */
    var CERTIFICATE_LIMIT_REACHED = 2817;

    /**
     * User has not provided a valid CSR value.
     */
    var INVALID_CERTIFICATE_CSR = 2818;

    /**
     * User has not provided a CSR value.
     */
    var MISSING_CERTIFICATE_CSR = 2819;

    /**
     * Internal error processing CSR.  
     * Please contact support if this error occurs.
     */
    var INTERNAL_ERROR_FAILED_PROCESSING_CSR = 2820;

    /**
     * Internal error generating certificate.  
     * Please contact support if this error occurs.
     */
    var INTERNAL_ERROR_FAILED_CREATING_CERTIFICATE = 2821;

    /**
     * Domain can no longer be protected using Free
     * Plan, upgrade to Basic Plan required.
     */
    var DUPLICATE_CERTIFICATES_FOUND = 2839;



    ////////////////////////
    //   VERIFY DOMAINS   //
    ////////////////////////

    /**
     * The requested certificate could not be
     * retrieved.
     */
    var FAILED_SHOWING_CERTIFICATE = 2822;

    /**
     * Domain verification failed and must be
     * retried.
     */
    var FAILED_VALIDATING_CERTIFICATE = 2823;

    /**
     * User has not provided a validation email
     * for each domain in certificate.
     */
    var MISSING_VALIDATION_EMAILS = 2824;

    /**
     * User has not provided a validation email
     * for each domain in certificate.
     */
    var MISSING_VALIDATION_EMAIL = 2825;

    /**
     * Internal error verifying domains.  
     * Please contact support if this error occurs.
     */
    var INTERNAL_ERROR_WHILE_VALDATING_DOMAIN_CONTROL = 2826;

    /**
     * User has provided an in invalid domain
     * verification method.
     */
    var INVALID_VALIDATION_METHOD = 2827;

    /**
     * User has not provided a domain verification
     * method.
     */
    var MISSING_VALIDATION_METHOD = 2828;

    /**
     * User has provided an in invalid domain
     * verification method or value.
     */
    var INCORRECT_CERTIFICATE_VALIDATION_TYPE = 2829;

    /**
     * The given certificate is not eligible for
     * domain verification.
     */
    var CERTIFICATE_NOT_ELIGIBLE = 2830;

    /**
     * The given certificate is not ready for
     * domain verification.
     */
    var CERTIFICATE_NOT_READY_TO_VALIDATE = 2831;

    /**
     * Invalid CAA records detected for some domains.  
     * Array of affected domains can be found in `details` object.
     * [Learn more](https://help.zerossl.com/hc/en-us/articles/360015629499-Verification-error-Invalid-CAA-Records) about CAA records.
     */
    var INVALID_CAA_RECORDS_DETECTED = 2840;



    //////////////////////////////
    //   DOWNLOAD CERTITICATE   //
    //////////////////////////////

    /**
     * The given certificate has not been issued yet.
     */
    var CERTIFICATE_NOT_ISSUED = 2832;



    ////////////////////////////
    //   CANCEL CERTITICATE   //
    ////////////////////////////

    /**
     * The given certificate cannot be cancelled
     * due to its status.
     */
    var CERTIFICATE_CANNOT_BE_CANCELLED = 2833;

    /**
     * Internal error cancelling certificate.  
     * Try again or contact support.
     */
    var FAILED_CANCELLING_CERTIFICATE = 2834;



    ////////////////////////////
    //   DELETE CERTITICATE   //
    ////////////////////////////

    /**
     * The given certificate cannot be deleted
     * due to its status.
     */
    var CERTIFICATE_CANNOT_BE_DELETED = 2835;

    /**
     * Internal error deleting certificate.  
     * Try again or contact support.
     */
    var FAILED_DELETING_CERTIFICATE = 2836;



    /////////////////////////////
    //   RESEND VERIFICATION   //
    /////////////////////////////

    /**
     * Internal error resending verification email.  
     * Try again or contact support.
     */
    var FAILED_RESENDING_EMAIL = 2837;



    /////////////////////////////////
    //   GET VERIFICATION STATUS   //
    /////////////////////////////////

    /**
     * Error retrieveing domain verification status.  
     * Try again and make sure Email Verification is selected.
     */
    var FAILED_GETTING_VALIDATION_STATUS = 2838;
}