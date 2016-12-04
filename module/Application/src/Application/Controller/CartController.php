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
use Zend\Http\Cookies;

class CartController extends AbstractActionController{

    protected $cartTable;
    protected $serviceTable;
    protected $paymentTable;


    public function getPaymentTable() {
        if (!$this->paymentTable) {
            $sm = $this->getServiceLocator();
            $this->paymentTable = $sm->get('\Application\Model\PaymentTable');
        }
        return $this->paymentTable;
    }



    public function getCartTable() {
        if (!$this->cartTable) {
            $sm = $this->getServiceLocator();
            $this->cartTable = $sm->get('\Application\Model\CartTable');
        }
        return $this->cartTable;
    }

    public function getServiceTable() {
        if (!$this->serviceTable) {
            $sm = $this->getServiceLocator();
            $this->serviceTable = $sm->get('\Application\Model\ServicesTable');
        }
        return $this->serviceTable;
    }



    public function addAction(){

        $request = $this->getRequest();
        //var_dump($this->getRequest()->getPost()); exit;
        $return = array();
        if($this->getRequest()->isPost()){
            $return[] = "this is post";
            $cart = new Container('cart');
            $userSession = new Container('user');

            //print_r($user->userDetails); exit;
            $user = $userSession->userDetails;
            if(!empty($user->UserId)){
                $data = array();
                $data['serviceId'] = $request->getPost('serviceId');
                $data['serviceOptionId'] = $request->getPost('optionId');
                $data['price'] = $request->getPost('price');
                $data['UserId'] = $user->UserId;
                $ifExists = $this->getCartTable()->checkIfExist($data);
                //var_dump($ifExists->count()); exit;
                if($ifExists->count() >= 1){
                    $return['status']="exist";
                } else {
                    $data = (object)$data;
                    // inserting the capping in cart
                    $totalAmount = 0;
                    $totalAmount = $this->getCartTable()->getTotalCartCost($user->UserId);
                    if($totalAmount <= 20000){
                        $ret = $this->getCartTable()->save($data);
                        $return['status']="added";

                    } else {
                        $return['status']="exceed";
                    }

                }


            } else {

                $return['status'] = "notLogin";
            }

            //echo $id; exit;
        } else {
            $return[] = "this is not post";
        }
        return new JsonModel($return);

    }

    public function deleteAction(){
        $return = array();
        $request = $this->getRequest();
        if ($this->getRequest()->isPost()){
            $userDeatails = new Container('user');
            $user = $userDeatails->userDetails;
            $userId = $user->UserId;
            $data = array();
            $data['serviceId'] = $request->getPost('serviceId');
            $data['serviceOptionId'] = $request->getPost('optionId');
            $data['price'] = $request->getPost('price');
            $data['UserId'] = $user->UserId;
            $deleteReturn = $this->getCartTable()->removeCart($data);
            if($deleteReturn == true ){
                $return['status'] ="success";
            } else{
                $return["status"]="error";
            }
        } else{
             $return["status"]="error";
        }
        return new JsonModel(array("data"=>$return));
    }


    public function indexAction(){
        $userSession = new Container('user');

        //print_r($user->userDetails); exit;
        $user = $userSession->userDetails;
        $cartReturn = $this->getCartTable()->getCart($user->UserId);
        //var_dump($cartReturn->count()); exit;
        $serviceOptions = $this->getServiceTable()->getServicesByGroup();
        $serviceReturn = $this->getServiceTable()->getServices();
        return new ViewModel(array("cartDetails"=>$cartReturn,"services" =>$serviceReturn,"serviceOptions"=>$serviceOptions));
    }


    public function loginAction(){
        $request = $this->getRequest();
        $result = array();
        if($request->getPost()){
            if(!empty($request->getPost('email')) && !empty($request->getPost('password')) ){
                $res  = $this->getUsersTable()->login($request->getPost('email'),trim($request->getPost('password')));
                //echo $request->getPost('password');
               // var_dump($res->count()); exit;
                if($res->count()>0){
                    //var_dump($res->current()); exit;

                    $user = $res->current();

                    $session = new Container('user');
                    $session->user = $user;  //store username
                    $result['status'] = "success";

                } else {
                    $result['status'] = "Invalid Username or pasword";
                }

            } else{
                $result['status'] = "Email or Password is missing";
            }

        } else {
            $result['status']= "Unauthorised access";
        }

        return new JsonModel($result);



    }

    private function paytm($mobile,$email,$amount,$orderId,$userid){
        /* $paramList = array(
             //"REQUEST_TYPE"=>"DEFAULT",
             "MID"=>PAYTM_MERCHANT_MID,
             "ORDER_ID"=>uniqid("ORD"),
             "CUST_ID"=>"cunav",
             "TXN_AMOUNT"=>$amount,
             "CHANNEL_ID"=>"WEB",
             "INDUSTRY_TYPE_ID"=>"Retail",
             "WEBSITE"=>PAYTM_MERCHANT_WEBSITE,
             //"CHECKSUMHASH"=>
             "MOBILE_NO"=>$mobile,
             "EMAIL"=>$email
         );
        */


        $paramList["MID"] = PAYTM_MERCHANT_MID;
        $paramList["ORDER_ID"] = $orderId;
        $paramList["CUST_ID"] = $userid;
        $paramList["INDUSTRY_TYPE_ID"] = "Retail120";
        $paramList["CHANNEL_ID"] = "WEB";
        $paramList["TXN_AMOUNT"] = $amount;
        $paramList["WEBSITE"] = PAYTM_MERCHANT_WEBSITE;
        $paramList["MOBILE_NO"] = $mobile;
        $paramList["EMAIL"] = $email;
        $paramList["CALLBACK_URL"]= PAYTM_CALLBACK_URL;

        $checkSum = $this->getChecksumFromArray($paramList,PAYTM_MERCHANT_KEY);

        $paramList["CHECKSUMHASH"]= $checkSum;
        //$paramList["URL"]= PAYTM_TXN_URL;
        return $paramList;
    }

    public function processAction()
    {
        $userSession = new Container('user');
        $userDetails = $userSession->userDetails;
        //var_dump($userDetails->Mobile); exit;

        $request = $this->getRequest();
        $name = $userDetails->Name;
        $email = $userDetails->Email;
        $amount = $request->getPost("amount");
        $mobile = $userDetails->Mobile;
        $gateway = $request->getPost("gateway");
        $orderId = uniqid("J2N");
        $userId = $userDetails->UserId;

        $this->updateOrderId($userId,$orderId);


        if($gateway=="paytm"){

            if ($mobile!="" && !empty($mobile) && $email!="" && !empty($email) && $amount!="" && !empty($amount)  ){
                $params =  $this->paytm($mobile,$email,$amount,$orderId,$userId);
            } else {
                return $this->redirect()->toRoute('payment', array(
                    'error' => "1"
                ));
            }
            //$params["name"] = $name;

        } else if ($gateway=="razorpay"){
            $params = array(
                "name"=>$name,
                "email"=>$email,
                "amount"=>$amount,
                "mobile"=>$mobile,
                // "gateway"=>$gateway
            );
        }

        return new ViewModel(array("params"=>$params,"gateway"=>$gateway));
    }

    public function responseAction()
    {
        //echo "<pre>";
       // var_dump($_POST); exit;

        $userSession = new Container('user');
        $user = $userSession->userDetails;

        if($_POST["STATUS"]=="TXN_FAILURE"){
            $status=2;
        }
        if($_POST["STATUS"]=="TXN_SUCCESS"){
            $status=1;
        }
        /*
         * 2 for fail;
         * 1 for success;
         *
         * */

        $SqlData = array();
        $SqlData['userId'] = $user->UserId;
        $SqlData['status'] = $status;
        $SqlData['response'] = $_POST["RESPMSG"];
        $SqlData['responseText'] = json_encode($_POST);

        $where = array(
            "userId"=>$user->UserId,
            "orderId"=>$_POST["ORDERID"],
            "status"=>0
        );

        $this->getCartTable()->updateResponse($SqlData,$where);

        //echo "akgkasj";
        return new ViewModel(array("res"=>$_POST));
    }

    private function updateOrderId($orderId,$userId){
       return  $this->getCartTable()->updateOrderId( $orderId,$userId ); // to update the orderId

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

    function pkcs5_pad_e($text, $blocksize) {
        $pad = $blocksize - (strlen($text) % $blocksize);
        return $text . str_repeat(chr($pad), $pad);
    }

    function pkcs5_unpad_e($text) {
        $pad = ord($text{strlen($text) - 1});
        if ($pad > strlen($text))
            return false;
        return substr($text, 0, -1 * $pad);
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

    function checkString_e($value) {
        $myvalue = ltrim($value);
        $myvalue = rtrim($myvalue);
        if ($myvalue == 'null')
            $myvalue = '';
        return $myvalue;
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



}