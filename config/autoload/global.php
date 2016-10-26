<?php
/**
 * Global Configuration Override
 *
 * You can use this file for overriding configuration values from modules, etc.
 * You would place values in here that are agnostic to the environment and not
 * sensitive to security.
 *
 * @NOTE: In practice, this file will typically be INCLUDED in your source
 * control, so do not include passwords or other sensitive information in this
 * file.
 */
 
 $dbParams = array(
    'database'  => 'clickjobsnew',
    'username'  => 'root',
    'password'  => 'root',
    'hostname'  => 'localhost'
);
 

 return array(
      /* 'db' => array(
         'driver'         => 'PDO',
         'dsn' => 'mysql:dbname=clickjobsnew;host=localhost',
         'username' => 'root',
         'password' => 'root',
         'driver_options' => array(
             PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\''
         ),
     ),
   'service_manager' => array(
         'factories' => array(
             'Zend\Db\Adapter\Adapter'
                     => 'Zend\Db\Adapter\AdapterServiceFactory',
         ),
     ),
     */
     
    'service_manager' => array(
        'factories' => array(
            'Zend\Db\Adapter\Adapter' => function ($sm) use ($dbParams) {
                $adapter = new BjyProfiler\Db\Adapter\ProfilingAdapter(array(
                    'driver'    => 'pdo',
                    'dsn'       => 'mysql:dbname='.$dbParams['database'].';host='.$dbParams['hostname'],
                    'database'  => $dbParams['database'],
                    'username'  => $dbParams['username'],
                    'password'  => $dbParams['password'],
                    'hostname'  => $dbParams['hostname'],
                ));
 
                $adapter->setProfiler(new BjyProfiler\Db\Profiler\Profiler);
                $adapter->injectProfilingStatementPrototype();
                return $adapter;
            },
        ),
    ),

     
     'module_layouts' => array(
        'Application' => 'layout/layout.phtml',
        'Admin' => 'layout/layout-admin.phtml',
        'Fui' => 'layout/fui',
        'Sales' => 'layout/sales.phtml',
     ),
     
 );

