<?php
define("BASEURL", "http://".$_SERVER['SERVER_NAME']);

define('PAYTM_ENVIRONMENT', 'PROD'); // PROD



$PAYTM_DOMAIN = "pguat.paytm.com";
if (PAYTM_ENVIRONMENT == 'PROD') {
    $PAYTM_DOMAIN = 'secure.paytm.in';
}

if (PAYTM_ENVIRONMENT == 'PROD') {
    $PAYTM_DOMAIN = 'secure.paytm.in';
    define('PAYTM_MERCHANT_KEY', '7pcha8fMr1uCKRcK'); //Change this constant's value with Merchant key downloaded from portal
    define('PAYTM_MERCHANT_MID', 'FOXIES52706480784220'); //Change this constant's value with MID (Merchant ID) received from Paytm
    define('PAYTM_MERCHANT_WEBSITE', '3foxiesweb'); //Change this constant's value with Website name received from Paytm

} else {
    // for Testing Purposes
    define('PAYTM_MERCHANT_KEY', 'miGmIS6dIloyT26I'); //Change this constant's value with Merchant key downloaded from portal
    define('PAYTM_MERCHANT_MID', '3FOXIE03444669624368'); //Change this constant's value with MID (Merchant ID) received from Paytm
    define('PAYTM_MERCHANT_WEBSITE', '3foxies'); //Change this constant's value with Website name received from Paytm

}
define('PAYTM_CALLBACK_URL',"http://".$_SERVER['SERVER_NAME']."/payment/paytmres");

define('PAYTM_REFUND_URL', 'https://'.$PAYTM_DOMAIN.'/oltp/HANDLER_INTERNAL/REFUND');
define('PAYTM_STATUS_QUERY_URL', 'https://'.$PAYTM_DOMAIN.'/oltp/HANDLER_INTERNAL/TXNSTATUS');
define('PAYTM_TXN_URL', 'https://'.$PAYTM_DOMAIN.'/oltp-web/processTransaction');
/**
 * This makes our life easier when dealing with paths. Everything is relative
 * to the application root now.
 */
chdir(dirname(__DIR__));

// Decline static file requests back to the PHP built-in webserver
if (php_sapi_name() === 'cli-server') {
    $path = realpath(__DIR__ . parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
    if (__FILE__ !== $path && is_file($path)) {
        return false;
    }
    unset($path);
}

// Setup autoloading
require 'init_autoloader.php';

// Run the application!
Zend\Mvc\Application::init(require 'config/application.config.php')->run();
