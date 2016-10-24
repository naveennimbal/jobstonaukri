<?php

namespace Sales;




use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;
use Zend\Session\Config\SessionConfig;
use Zend\Session\Container;
use Zend\Session\SessionManager;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;

class Module
{
    public function onBootstrap($e)
    {
        $e->getApplication()->getServiceManager()->get('translator');
        $eventManager        = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);

        $eventManager = $e->getApplication()->getEventManager();
        $eventManager->attach('dispatch', array($this, 'loadConfiguration' ));
        $eventManager->getSharedManager()->attach('Zend\Mvc\Controller\AbstractActionController', 'dispatch', function($e) {
            $controller = $e->getTarget();
            $controllerClass = get_class($controller);
            $moduleNamespace = substr($controllerClass, 0, strpos($controllerClass, '\\'));
            //var_dump($moduleNamespace); exit;
            $config = $e->getApplication()->getServiceManager()->get('config');
            //echo '<pre>';var_dump($config['module_layouts'][$moduleNamespace]);die;
            if (isset($config['module_layouts'][$moduleNamespace])) {
                $controller->layout($config['module_layouts'][$moduleNamespace]);
            }
        }, 100);
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);
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


    public function loadConfiguration(MvcEvent $e)
    {
        $user_session = new Container('user');
        $username = $user_session->name;
        $controller = $e->getTarget();
        $controller->layout()->name = $username;
    }






    public function getServiceConfig()
    {
        return array(
            'factories' => array(
                '\Application\Model\PaymentTable' =>  function($sm) {
                    $tableGateway = $sm->get('PaymentTableGateway');
                    $table = new PaymentTable($tableGateway);
                    return $table;
                },
                'PaymentTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Payment());
                    return new TableGateway('payment', $dbAdapter, null, $resultSetPrototype);
                },
            )
        );
    }

}
