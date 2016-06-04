<?php
/**
 * Created by PhpStorm.
 * User: naveen
 * Date: 13/01/16
 * Time: 5:01 AM
 */
namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

use Zend\Session\SessionManager;
use Zend\Session\Container;
//use Fui\Form\SignupForm;
use Application\Model\Users;
use Application\Model\UsersTable;
use Application\Model\Rservices;
use Application\Model\RservicesTable;

use Zend\View\Model\JsonModel;
use Zend\View\View;

class RservicesController extends AbstractActionController
{

    protected $usersTable;
    protected $rservicesTable;


    public function getUsersTable()
    {
        if (!$this->usersTable) {
            $sm = $this->getServiceLocator();
            $this->usersTable = $sm->get('\Application\Model\UsersTable');
        }
        return $this->usersTable;
    }

    public function getRservicesTable()
    {
        if (!$this->rservicesTable) {
            $sm = $this->getServiceLocator();
            $this->rservicesTable = $sm->get('\Application\Model\RservicesTable');
        }
        return $this->rservicesTable;
    }




    public function indexAction ()
    {
        $allServices = $this->getRservicesTable()->fetchAll();
        return new ViewModel();
    }

    public function serviceAction(){
        $id = $this->params()->fromRoute('id');
        $result  = $this->getRservicesTable()->getServiceById($id);
        $service = array();
        foreach($result as $res){
            $service[] = $res;
        }

        //var_dump($service);
        $templateName = $service[0]['template'];
        //exit;
        $view = new ViewModel(array('packages'=>$service));
        $view->setTemplate('application/rservices/'.$templateName); // path to phtml file under view folder
        return $view;


    }

    public function checkoutAction(){

        $request = $this->getRequest();
        if($request->isPost()){

            $session = new Container('user');
            $user = $session->user;

            $vals = array();

            $priceArray = explode("-",$request->getPost('price'));

            $amount=$priceArray[0];
            $servicePriceId=( !empty($priceArray[1]))?$priceArray[1]:"";
            if($amount==""){
                $amount = $request->getPost();
            }

            $amount = round($amount * 100) ;

            //$ipaddress = $_SERVER['REMOTE_ADDR'];
            $ipaddress = "182.77.57.210";

            $orderId = uniqid("jbspd");

            $secretkey = "6240dcfb11d86c735d96fa6f438763e1";

            $data['input_string'] = "TSV72944452".'|8a09527944eadca80a3154c453dfe237|'.$ipaddress.'|'.$orderId.'|INR|'.$amount.'|MD5|1';

//echo $data['input_string'];

            $checksum = hash('MD5', $secretkey.$data['input_string']);

            $mode = "LIVE";

            $vals["amount"] = $amount;
            $vals["servicePriceId"] = $amount;
            $vals["serviceId"] = $request->getPost('serviceId');
            $vals['email'] = $user->email;
            $vals['mobile'] = $user->mobile;
            $vals['firstName'] = $user->firstName;
            $vals['city'] = $user->city;
            $vals['state'] = $user->state;
            $vals['country'] = $user->country;
            $vals['zipcode'] = $user->zip;
            $vals['description'] = $request->getPost('serviceName');
            $vals['orderId'] = $orderId;
            $vals['checksum'] = $checksum;
            $vals['ip'] = $ipaddress;
            $vals['mode'] = $mode;
            $vals['returnUrl'] = "http://www.jobsspeed.com/rservices/success";

           // var_dump($vals); exit;

            return new ViewModel(array("vals"=>$vals));

        } else {

        }
        return new ViewModel();

    }



}