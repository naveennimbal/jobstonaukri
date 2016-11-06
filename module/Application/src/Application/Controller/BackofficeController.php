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
use Application\Model\JobseekersTable;
use Application\Model\Jobseekers;
use Application\Model\Industry;
use Application\Model\IndustryTable;

class BackofficeController extends AbstractActionController
{
     protected $jobseekersTable;
     protected $IndustryTable;
     protected $JobroleTable;


    public function getJobseekersTable() {
        if (!$this->jobseekersTable) {
            $sm = $this->getServiceLocator();
            $this->jobseekersTable = $sm->get('Application\Model\JobseekersTable');
        }
        return $this->jobseekersTable;
    }
    
    public function getIndustryTable() {
        if (!$this->IndustryTable) {
            $sm = $this->getServiceLocator();
            $this->IndustryTable = $sm->get('Application\Model\IndustryTable');
        }
        return $this->IndustryTable;
    }
    
    public function getJobroleTable() {
        if (!$this->JobroleTable) {
            $sm = $this->getServiceLocator();
            $this->JobroleTable = $sm->get('Application\Model\JobroleTable');
        }
        return $this->JobroleTable;
    }
    
    public function indexAction()
    {
       //$det = $this->getJobseekersTable()->getUserDetails("clicknav"); 
       //var_dump($det);
       $login= $this->params()->fromRoute('id');
       $ret = array();
       if($login=="0"){ 
           $ret['login']=0;
       }

       //$this->layout()->setVariable("login", $login);
        $this->layout('layout/backoffice');

       
       $industry = $this->getIndustryTable()->fetchAll();
       $jobrole = $this->getJobroleTable()->fetchAll();



        $view =  new ViewModel(array("ret"=>$ret,"industry"=>$industry,"jobrole"=>$jobrole));
        $view->setTemplate('application/backoffice/user.phtml');
        return $view;
    }
    
    
}
