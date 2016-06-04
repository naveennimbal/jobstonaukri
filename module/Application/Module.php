<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application;

use Application\Model\Services;
use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;
use Zend\Session\Config\SessionConfig;
use Zend\Session\Container;
use Zend\Session\SessionManager;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;
use Application\Model\Users;
use Application\Model\UsersTable;
use Application\Model\Jobseekers;
use Application\Model\JobseekersTable;
use Application\Model\Rservices;
use Application\Model\RservicesTable;
use Application\Model\Industry;
use Application\Model\IndustryTable;
use Application\Model\Jobrole;
use Application\Model\JobroleTable;
use Application\Model\Pages;
use Application\Model\PagesTable;



class Module 
{
    public function onBootstrap(MvcEvent $e)
    {
       /* $eventManager        = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);
     */

        $eventManager        = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);
        $e->getApplication()->getEventManager()->getSharedManager()->attach('Zend\Mvc\Controller\AbstractController', 'dispatch', function($e) {
            $controller      = $e->getTarget();
            //var_dump($controller); exit;
            $controllerClass = get_class($controller);
            $moduleNamespace = substr($controllerClass, 0, strpos($controllerClass, '\\'));
            $config          = $e->getApplication()->getServiceManager()->get('config');
            //echo "<pre>";
            //print_r($config);
            // echo $config['module_layouts'][$moduleNamespace];
            // exit;
            if (isset($config['module_layouts'][$moduleNamespace])) {
                $controller->layout($config['module_layouts'][$moduleNamespace]);
            }
        }, 100);
        $eventManager->attach('dispatch', array($this, 'setLayoutVars'));
        $eventManager->attach('dispatch', array($this, 'sessionVars'));


        $this->initSession(array(
            'remember_me_seconds' => 60*60*24*30 ,
            'use_cookies' => true,
            'cookie_httponly' => true,
        ));

    }

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }


    public function getServiceConfig()
    {
        return array(
            'factories' => array(
                '\Application\Model\UsersTable' =>  function($sm) {
                    $tableGateway = $sm->get('UsersTableGateway');
                    $table = new UsersTable($tableGateway);
                    return $table;
                },
                'UsersTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Users());
                    return new TableGateway('users', $dbAdapter, null, $resultSetPrototype);
                },
                
                 '\Application\Model\JobseekersTable' =>  function($sm) {
                    $tableGateway = $sm->get('JobseekersTableGateway');
                    $table = new JobseekersTable($tableGateway);
                    return $table;
                },
                'JobseekersTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Jobseekers());
                    return new TableGateway('jobseekers', $dbAdapter, null, $resultSetPrototype);
                },
                        
                '\Application\Model\RservicesTable' =>  function($sm) {
                    $tableGateway = $sm->get('RservicesTableGateway');
                    $table = new RservicesTable($tableGateway);
                    return $table;
                },
                'RservicesTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Rservices());
                    return new TableGateway('services', $dbAdapter, null, $resultSetPrototype);
                },

                '\Application\Model\IndustryTable' =>  function($sm) {
                    $tableGateway = $sm->get('IndustryTableGateway');
                    $table = new IndustryTable($tableGateway);
                    return $table;
                },
                'IndustryTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Industry());
                    return new TableGateway('cj_mast_industry', $dbAdapter, null, $resultSetPrototype);
                },
                '\Application\Model\JobroleTable' =>  function($sm) {
                    $tableGateway = $sm->get('JobroleTableGateway');
                    $table = new JobroleTable($tableGateway);
                    return $table;
                },
                'JobroleTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Jobrole());
                    return new TableGateway('cj_mast_jobrole', $dbAdapter, null, $resultSetPrototype);
                },
                '\Application\Model\PagesTable' =>  function($sm) {
                    $tableGateway = $sm->get('PagesTableGateway');
                    $table = new PagesTable($tableGateway);
                    return $table;
                },
                'PagesTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Pages());
                    return new TableGateway('pages', $dbAdapter, null, $resultSetPrototype);
                },

            ),

        );
    }

    public function setLayoutVars($e){
        //$target->layout()->setVariable('name', $admin_session->name);
        $controller      = $e->getTarget();
        $controllerClass = get_class($controller);
        $moduleNamespace = substr($controllerClass, 0, strpos($controllerClass, '\\'));
        $actionArray = explode('\\', $controllerClass);
        $action = end($actionArray);
        // var_dump($action); exit;
        $action = $e->getRouteMatch()->getMatchedRouteName();
        $target = $e->getTarget();
        //var_dump($target); exit;
        $target->layout()->setVariable('routeName', ucfirst($action));
        return;

    }


    public function sessionVars(MvcEvent $e){
        $session = new Container('user');
        //$session->user = 'Foo'; //store username
        //echo "jshdsjkdh" ; var_dump($session->user);  exit;
        $controller = $e->getTarget();
        $controller->layout()->setVariable('user' , $session->userDetails);
        $cart_session = new Container('cart');
        $controller->layout()->setVariable('cart_count' , $cart_session->cart_count);

        return;
    }

    public function initSession($config)
    {
        $sessionConfig = new SessionConfig();
        $sessionConfig->setOptions($config);
        $sessionManager = new SessionManager($sessionConfig);
        $sessionManager->start();
        Container::setDefaultManager($sessionManager);
    }



}
