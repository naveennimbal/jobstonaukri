<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */
/**
 * Created by PhpStorm.
 * User: root
 * Date: 12/1/16
 * Time: 1:19 PM
 */

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

use Zend\Session\SessionManager;
use Zend\Session\Container;
//use Fui\Form\SignupForm;
use Application\Model\Users;
use Application\Model\UsersTable;

use Zend\View\Model\JsonModel;
use Zend\View\View;

class PaymentController extends AbstractActionController{

    protected $paymentTable;
    protected $adminsTable;


    public function indexAction()
    {


        return new ViewModel();
    }

    /**
     *
     */
    public function loginAction(){
       // $this->redirect()->toRoute('route', array('action' => 'name'), array('param => 1'));
        $adminSession = new Container("admin");
        //$adminSession->admin = "";

        $request = $this->getRequest();
        if($request->isPost()){
            // complete the login process
            $user = $request->getPost('username');
            $pass = $request->getPost('password');
            $login = $this->getAdminsTable()->checkLogin($user,md5($pass));
            if($login->count()==1){
                $adminDetails = $this->getAdminsTable()->getAdminDetails($user);
                //print_r($adminDetails->current()); exit;
                $admin = $adminDetails->current();
                $adminSession->admin = $admin['Userid'];

                $this->layout('layout/backoffice');
                $view =  new ViewModel(array("nothing"=>0));

                $view->setTemplate("application/payment/confirm1.phtml");

                return $view;


            } else {
                $this->layout('layout/login');
                return new ViewModel(array("error"=>"1"));
            }

        } else {
            // load login page here
            $adminSession->admin = "";
            $this->layout('layout/login');
            return new ViewModel();
        }

        //exit;
    }

    public function getAdminsTable() {
        if (!$this->adminsTable) {
            $sm = $this->getServiceLocator();
            $this->adminsTable = $sm->get('\Application\Model\AdminsTable');
        }
        return $this->adminsTable;
    }

    public function logoutAction(){
        $user_session  = new Container('admin');
        unset($user_session->admin);
        //$this->redirect()->toRoute("application",array("controller"=>"index","action"=>"index"));
        $this->redirect()->toRoute("payment",array("action"=>"login"));
    }

    public function processAction()
    {
        $request = $this->getRequest();
        $name = $request->getPost("custname");
        $email = $request->getPost("custemail");
        $amount = $request->getPost("amount");
        $mobile = $request->getPost("mobile");
        $gateway = $request->getPost("gateway");
        $orderId=$this->genrateOrderId();
        $package = "j2n";
        $asm = "asm";
        $tlName = "tlName";
        $agentName = "agent";
        (float)$amount = floatval(2.00);

        if($gateway=="paytm"){

            if ($mobile!="" && !empty($mobile) && $email!="" && !empty($email) && $amount!="" && !empty($amount)  ){
                //$orderId=uniqid("J2N");

                $data =  array(
                'name'=>$name,
                'email'=>$email,
                'mobile'=>$mobile,
                'amount'=>$amount,
                'package'=>$package,
                'gateway'=>$gateway,
                'status'=>0,
                'orderId'=>$orderId,
                'asm'=>$asm,
                'tlName'=>$tlName,
                'agentName'=>$agentName,
                );
                $data = (object) $data;
                $this->getPaymentTable()->addUser($data);
                $params =  $this->paytm($mobile,$email,$amount,$orderId);
            } else {
                return $this->redirect()->toRoute('payment', array(
                    'error' => "1"
                ));
            }
           //$params["name"] = $name;

        } else if ($gateway=="paynear"){
            $params = array(
                "merchantId"=>PAYNEAR_MERCHANT_ID,
                "referenceNo"=>$this->genrateOrderId(),
                "apiVersion"=>"2.0.1",
                "description"=>"J2N Subscription",
                "outletId"=>0,
                "currencyCode"=>"INR",
                "locale"=>"EN-US",
                "amount"=>2.11,
                "responseURL"=>"http://www.jobstonaukri.loc/payment/pnresponse",
                "billingContactName"=>$name,
                "billingAddress"=>"12555",
                "billingCity"=>"hyderabad",
                "billingState"=>"telangana",
                "billingPostalCode"=>'500014',
                "billingCountry"=>"IND",
                "billingEmail"=>$email,
                "billingPhone"=>$mobile,
                "shippingContactName"=>$name,
                "shippingAddress"=>"125 55",
                "shippingCity"=>"hyderabad",
                "shippingState"=>"telangana",
                "shippingPostalCode"=>500014,
                "shippingCountry"=>"IND",
                "shippingEmail"=>$email,
                "shippingPhone"=>$mobile,
                //"secureHash"=>$this->get,
                "channel"=>"3"
               // "gateway"=>$gateway
            );

            $data =  array(
                'name'=>$name,
                'email'=>$email,
                'mobile'=>$mobile,
                'amount'=>$amount,
                'package'=>$package,
                'gateway'=>$gateway,
                'status'=>0,
                'orderId'=>$orderId,
                'asm'=>$asm,
                'tlName'=>$tlName,
                'agentName'=>$agentName,
            );
            $data = (object) $data;
            $this->getPaymentTable()->addUser($data);

            $params['secureHash'] =  $this->getPaynearSecureHash($params);

            echo "<pre>";
            print_r($params);

            $data = json_encode($params);
            $headers = array(
                'Accept: application/json',
                'Content-Type: application/json',
            );
            $handle = curl_init();
            curl_setopt($handle, CURLOPT_URL, PAYNEAR_REQUEST_URL);
            curl_setopt($handle, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($handle, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($handle, CURLOPT_POST, true);
            curl_setopt($handle, CURLOPT_POSTFIELDS, $data);
            curl_setopt($handle, CURLOPT_TIMEOUT_MS, 1000);
            $response = curl_exec($handle);
            $httpCode = curl_getinfo($handle, CURLINFO_HTTP_CODE);
            $curl_errno = curl_errno($handle);
            $curl_error = curl_error($handle);
            curl_close($handle);

            if (FALSE === $response)
                throw new \Exception("fails to connect Server");
            else if ($curl_errno > 0)
                throw new \Exception("cURL Error ($curl_errno): $curl_error\n");
            else if ($httpCode != 200)
                throw new \Exception("Server Error: {$httpCode} \n ");
            else {

                $result = json_decode($response, true);
                var_dump($result); //exit;

                if($this->_isValidResponse($result)){
                    return $result;
                } else {
                    throw new \Exception("Invalid response");
                }
            }

        }

        return new ViewModel(array("params"=>$params,"gateway"=>$gateway));
    }


    private function _isValidResponse($params)
    {

        if(!is_array($params) || empty($params) || !isset($params['secureHash']))
            return false;

        $receivedSecureHash = $params['secureHash'];
        $generatedSecureHash = $this->getPaynearSecureHash($params);

        return $receivedSecureHash == $generatedSecureHash;
    }

    public function getPaymentTable() {
        if (!$this->paymentTable) {
            $sm = $this->getServiceLocator();
            $this->paymentTable = $sm->get('\Application\Model\PaymentTable');
        }
        return $this->paymentTable;
    }

    private function paytm($mobile,$email,$amount,$orderId){

        $paramList["MID"] = PAYTM_MERCHANT_MID;
        $paramList["ORDER_ID"] = $orderId;
        $paramList["CUST_ID"] = uniqid("Cust_");
        $paramList["INDUSTRY_TYPE_ID"] = "Retail120";
        $paramList["CHANNEL_ID"] = "WEB";
        $paramList["TXN_AMOUNT"] = $amount;
        $paramList["WEBSITE"] = PAYTM_MERCHANT_WEBSITE;
        $paramList["MOBILE_NO"] = $mobile;
        $paramList["EMAIL"] = $email;
        $paramList["CALLBACK_URL"]= "http://www.jobstonaukri.loc/payment/response";

        $checkSum = $this->getChecksumFromArray($paramList,PAYTM_MERCHANT_KEY);

        $paramList["CHECKSUMHASH"]= $checkSum;


        //$paramList["URL"]= PAYTM_TXN_URL;

        return $paramList;

    }

    function getChecksumFromArray($arrayList, $key, $sort=1) {
        if ($sort != 0) {
            ksort($arrayList);
        }
        $str = $this->getArray2Str($arrayList);
        $salt = $this->generateSalt_e(4);
        $finalString = $str . "|" . $salt;
        //echo $finalString; exit;
        $hash = hash("sha256", $finalString);
        $hashString = $hash . $salt;
        $checksum = $this->encrypt_e($hashString, $key);
        return $checksum;
    }

    function getArray2Str($arrayList) {
        $paramStr = "";
        $flag = 1;
        foreach ($arrayList as $key => $value) {
            if ($flag) {
                $paramStr .= $this->checkString_e($value);
                $flag = 0;
            } else {
                $paramStr .= "|" . $this->checkString_e($value);
            }
        }
        return $paramStr;
    }

    function checkString_e($value) {
        $myvalue = ltrim($value);
        $myvalue = rtrim($myvalue);
        if ($myvalue == 'null')
            $myvalue = '';
        return $myvalue;
    }

    function generateSalt_e($length) {
        $random = "";
        srand((double) microtime() * 1000000);

        $data = "AbcDE123IJKLMN67QRSTUVWXYZ";
        $data .= "aBCdefghijklmn123opq45rs67tuv89wxyz";
        $data .= "0FGH45OP89";

        for ($i = 0; $i < $length; $i++) {
            $random .= substr($data, (rand() % (strlen($data))), 1);
        }

        return $random;
    }

    function encrypt_e($input, $ky) {
        $key = $ky;
        $size = mcrypt_get_block_size(MCRYPT_RIJNDAEL_128, 'cbc');
        $input = $this->pkcs5_pad_e($input, $size);
        $td = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', 'cbc', '');
        $iv = "@@@@&&&&####$$$$";
        mcrypt_generic_init($td, $key, $iv);
        $data = mcrypt_generic($td, $input);
        mcrypt_generic_deinit($td);
        mcrypt_module_close($td);
        $data = base64_encode($data);
        return $data;
    }

    function pkcs5_pad_e($text, $blocksize) {
        $pad = $blocksize - (strlen($text) % $blocksize);
        return $text . str_repeat(chr($pad), $pad);
    }

    public function responseAction()
    {
        //var_dump($_POST); exit;
        //echo "akgkasj";
        $status = 0;
        if($_POST['STATUS']=="TXN_SUCCESS"){
            $status = 1;
            $response = $_POST['RESPMSG'];
            $responseText = json_encode($_POST);
        }else if($_POST['STATUS']=="TXN_FAILURE"){
            $status = 2;
            $response = $_POST['RESPMSG'];
            $responseText = json_encode($_POST);
        }
        $paytmAmount = $_POST['TXNAMOUNT'];
        $txnId = $_POST['TXNID'];

        $orderId = $_POST['ORDERID'];
        $this->getPaymentTable()->updateStatus($orderId,$status,$response,$responseText,$paytmAmount,$txnId);
        return new ViewModel(array("res"=>$_POST));
    }

    public function confirm1Action(){
       // echo "here" ; exit;
        $request = $this->getRequest();
        $return = array();
        $return['post']="0";
        $count = 0;
        $nothing = 0;

        $adminSession = new Container('admin');
        //var_dump($adminSession->admin); exit;
        if($adminSession->admin!="") {


            if ($request->isPost()) {
                $return['post'] = "1";
                $orderId = $request->getPost('orderId');
                $mobile = $request->getPost('mobile');
                $email = $request->getPost('email');

                //var_dump($this->getRequest()->getPost('email')); exit;
                if ($orderId != "" || $mobile != "" || $email != "") {
                    $return = $this->getPaymentTable()->getPaymentStatus($orderId, $email, $mobile);
                    //$return = $this->getPaymentTable()->getPaymentStatus($adminSession->admin,$orderId, $email, $mobile);
                    $count = $return->count();
                    $nothing = 1;
                }
            }

            $this->layout('layout/backoffice');
            return new ViewModel(array("result" => $return, "count" => $count, "nothing" => $nothing));
        } else {
            $this->redirect()->toRoute("payment",array("action"=>"login"));
        }

    }

    public function captureAction(){

        $adminSession = new Container('admin');
        $adminName = $adminSession->admin ;
        //var_dump($adminName); exit;
        $return = array();
        $return['noAdmin']=0;
        if($this->getRequest()->isPost()) {
                if ($adminSession->admin != "") {
                    $orderId = $this->getRequest()->getPost('orderId');
                    $captured = $this->getPaymentTable()->captureUpdate($orderId,$adminName);
                    $return['noAdmin']=1;
                    $return['admin']=ucwords($adminName);

            }
        } else {
            // 2 means no post
            $return['noAdmin']=2;
        }

        return new JsonModel($return);
    }

    public function capturepaymentAction(){

        $adminSession = new Container('admin');
        $adminName = $adminSession->admin ;
        //var_dump($adminName); exit;
        $noAdmin=0;
        $admin = "";
        $results="";
        if($this->getRequest()->isPost()) {
                $mobile = $this->getRequest()->getPost('capturemobile');
                $results = $this->getPaymentTable()->capturePayment($mobile);

                $noAdmin=1;
                $admin=ucwords($adminName);


        }
        $this->layout('layout/backoffice');
        $view =  new ViewModel(array("noAdmin"=>$noAdmin,"admin"=>$admin,"results"=>$results));

        $view->setTemplate("application/payment/confirm1.phtml");

        return $view;
    }

    function decrypt_e($crypt, $ky) {

        $crypt = base64_decode($crypt);
        $key = $ky;
        $td = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', 'cbc', '');
        $iv = "@@@@&&&&####$$$$";
        mcrypt_generic_init($td, $key, $iv);
        $decrypted_data = mdecrypt_generic($td, $crypt);
        mcrypt_generic_deinit($td);
        mcrypt_module_close($td);
        $decrypted_data = pkcs5_unpad_e($decrypted_data);
        $decrypted_data = rtrim($decrypted_data);
        return $decrypted_data;
    }

    function pkcs5_unpad_e($text) {
        $pad = ord($text{strlen($text) - 1});
        if ($pad > strlen($text))
            return false;
        return substr($text, 0, -1 * $pad);
    }

    function verifychecksum_e($arrayList, $key, $checksumvalue) {
        $arrayList = removeCheckSumParam($arrayList);
        ksort($arrayList);
        $str = getArray2Str($arrayList);
        $paytm_hash = decrypt_e($checksumvalue, $key);
        $salt = substr($paytm_hash, -4);

        $finalString = $str . "|" . $salt;

        $website_hash = hash("sha256", $finalString);
        $website_hash .= $salt;

        $validFlag = "FALSE";
        if ($website_hash == $paytm_hash) {
            $validFlag = "TRUE";
        } else {
            $validFlag = "FALSE";
        }
        return $validFlag;
    }

    function redirect2PG($paramList, $key) {
        $hashString = getchecksumFromArray($paramList);
        $checksum = encrypt_e($hashString, $key);
    }

    function removeCheckSumParam($arrayList) {
        if (isset($arrayList["CHECKSUMHASH"])) {
            unset($arrayList["CHECKSUMHASH"]);
        }
        return $arrayList;
    }

    function getTxnStatus($requestParamList) {
        return callAPI(PAYTM_STATUS_QUERY_URL, $requestParamList);
    }

    function initiateTxnRefund($requestParamList) {
        $CHECKSUM = getChecksumFromArray($requestParamList,PAYTM_MERCHANT_KEY,0);
        $requestParamList["CHECKSUM"] = $CHECKSUM;
        return callAPI(PAYTM_REFUND_URL, $requestParamList);
    }

    function callAPI($apiURL, $requestParamList) {
        $jsonResponse = "";
        $responseParamList = array();
        $JsonData =json_encode($requestParamList);
        $postData = 'JsonData='.urlencode($JsonData);
        $ch = curl_init($apiURL);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json',
                'Content-Length: ' . strlen($postData))
        );
        $jsonResponse = curl_exec($ch);
        $responseParamList = json_decode($jsonResponse,true);
        return $responseParamList;
    }

    private function checkSession(){
        $session = false ;
        if(!$session){
            $this->redirect()->toRoute('route', array('action' => 'login'));
        }


    }

    private function genrateOrderId(){
        $paymentId = $this->getPaymentTable()->getLastPaymentId();
        //var_dump($paymentId['paymentId']); exit;
        $orderId = "J2N";
        $orderId .= "-".date('dmY');
        $orderId .= "-".$paymentId['paymentId'];

        //
        return $orderId;

    }

    private function getPaynearSecureHash($params)
    {
        if(!is_array($params) || empty($params))
            return false;

        if(isset($params['secureHash']))
            unset($params['secureHash']);

        $checkSumString = PAYNEAR_MERCHANT_KEY;
        ksort($params);

        foreach($params as $key => $value){
            $checkSumString .= '|' . $value;
        }

        $hash = hash('SHA512', $checkSumString);

        return strtoupper($hash);
    }

    private function paymentMail(){
            



    }

    private function addpaytm(){



    }



}