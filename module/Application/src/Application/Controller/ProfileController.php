<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
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

class ProfileController extends AbstractActionController
{
    
    
    protected $usersTable;
    protected $jobseekersTable;


    public function getUsersTable() {
        if (!$this->usersTable) {
            $sm = $this->getServiceLocator();
            $this->usersTable = $sm->get('\Application\Model\UsersTable');
        }
        return $this->usersTable;
    }
    
    public function getJobseekersTable() {
        if (!$this->jobseekersTable) {
            $sm = $this->getServiceLocator();
            $this->jobseekersTable = $sm->get('\Application\Model\JobseekersTable');
        }
        return $this->jobseekersTable;
    }
    
    public function __construct() {
       // $this->loginCheck();
    }




    public function indexAction()
    {
        $user_session =  new Container('user');
        $userDetail = $user_session->userDetails;
        if(empty($userDetail)){ return $this->redirect()->toRoute("index",array("action"=>"index","id"=>"0")); }
        $userDetails = $this->getJobseekersTable()->getUserDetails($userDetail->UserId);
        $cols = $this->getJobseekersTable()->getColumns();
        //echo "<pre>";
        //var_dump($cols); exit;
      // print_r($userDetails); exit;

        $view = new ViewModel();
        //$view->la
        $view->setTemplate('application/profile/down.phtml');  // module/Test/view/test/test/

        return $view;
        //return new ViewModel(array("user"=>$userDetails));
    }
    
    
    private function loginCheck(){
        $user_session =  new Container('user');
        $userDetail = $user_session->userDetails;
        if(empty($userDetail)){
           
    
            return $this->redirect()->toRoute("application",array("controller"=>"index","action"=>"index","login"=>"0")); 
            //return $this->redirect()->toUrl(BASEURL."/index/"); 
            //return $this->forward()->dispatch('Application/Controller/Index',array('action' => 'index'));
        }
        return;
        
    }
}
