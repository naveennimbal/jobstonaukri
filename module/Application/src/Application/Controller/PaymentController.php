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


    public function getPaymentTable() {
        if (!$this->paymentTable) {
            $sm = $this->getServiceLocator();
            $this->paymentTable = $sm->get('\Application\Model\PaymentTable');
        }
        return $this->paymentTable;
    }




    public function indexAction()
    {


        return new ViewModel();
    }


    public function processAction()
    {
        $request = $this->getRequest();
        $name = $request->getPost("custname");
        $email = $request->getPost("custemail");
        $amount = $request->getPost("amount");

        return new ViewModel(array("name"=>$name,"email"=>$email,"amount"=>$amount));
    }



}