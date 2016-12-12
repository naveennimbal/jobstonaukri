<?php

namespace Sales\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class IndexController extends AbstractActionController
{

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


    public function indexAction()
    {

        return new ViewModel(array("result"=>array()));

    }

    public function confirmAction(){
        $request = $this->getRequest();
        $result = array();
        $count = 0;
        if($request->isPost()){
            $email = $request->getPost('email');
            $mobile = $request->getPost('mobile');

            $result = $this->getCartTable()->getPaymentStatus($email,$mobile);

            return new ViewModel(array("result"=>$result,"count"=>$count));
        }

        return new ViewModel(array("result"=>$result,"count"=>$count));

    }
}
