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
use Application\Model\Pages;
use Application\Model\PagesTable;

use Zend\View\Model\JsonModel;
use Zend\View\View;

class PagesController extends AbstractActionController{

    protected $pagesTable;


    public function getPagesTable() {
        if (!$this->pagesTable) {
            $sm = $this->getServiceLocator();
            $this->pagesTable = $sm->get('\Application\Model\PagesTable');
        }
        return $this->pagesTable;
    }


    public function indexAction(){
        $pageId = $this->params()->fromRoute('id');
        $request = $this->getRequest();
        $result = array();
        $page = $this->getPagesTable()->getPageById($pageId);
        $menu = $this->getSideMenu();
        return new ViewModel(array("page"=>$page,"menu"=>$menu));
       // var_dump($pageId); exit;

    }


    public function getSideMenu(){
        $menu = $this->getPagesTable()->getMenuLink();
        return $menu;

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


}