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
use Zend\Mvc\View\Http\ViewManager;
use Zend\View\Model\ViewModel;

use Zend\Session\SessionManager;
use Zend\Session\Container;
//use Fui\Form\SignupForm;
use Application\Model\Users;
use Application\Model\UsersTable;

use Zend\View\Model\JsonModel;
use Zend\View\View;

class ServicesController extends AbstractActionController{

    protected $servicesTable;
    protected $serviceOptionTable;


    public function getServicesTable() {
        if (!$this->servicesTable) {
            $sm = $this->getServiceLocator();
            $this->servicesTable = $sm->get('\Application\Model\ServicesTable');
        }
        return $this->servicesTable;
    }

    public function getServiceOptionTable() {
        if (!$this->serviceOptionTable) {
            $sm = $this->getServiceLocator();
            $this->serviceOptionTable = $sm->get('\Application\Model\ServiceOptionTable');
        }
        return $this->serviceOptionTable;
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

    public function indexAction()
    {
        $serviceId = $this->params()->fromRoute('id');
        $all = $this->getServices();
        $view = new ViewModel();
        if($serviceId !="" ){
            $allService = $this->getServicesTable()->getServices($serviceId,"all");

           // var_dump($allService->count()); exit;

            if($allService->count() > 1){
                $view->setTemplate('application/services/options');
            } else {
                $view->setTemplate('application/services/index');
            }


            $view->setTemplate('application/services/index');
            $view->setVariables(array(
              //  'service' => $allService->current(),"all"=>$all
                'service' => $allService,"all"=>$all
            ));
            return $view;
        } else{
            $all = $this->getServices();

            $service = $this->getServicesTable()->getServices("","none");
            $view->setTemplate('application/services/all');
            $view->setVariables(array(
                'service' => $service,"all"=>$all
            ));
            return $view;
            //return new ViewModel(array("service"=>$allService));
        }



    }



    private function getServices(){
        $services = $this->getServicesTable()->getServices("","none");
        return $services;



    }


}