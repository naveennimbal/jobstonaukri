<?php
/**
 * Created by PhpStorm.
 * User: naveen
 * Date: 13/01/16
 * Time: 5:34 AM
 */

namespace Application\Model;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;



class ServicesTable
{
    protected $tableGateway;

    public function __construct(TableGateway $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }


    public function fetchAll($paginated=false) {

        $sql = new Sql($this->tableGateway->adapter);
        $select = $sql->select();
        $select->from($this->tableGateway->getTable());
       // $select->order('order_id DESC');
       // $select->join(array("p"=>"products"), 'p.product_id = orders.product_id',array("merchant_id","product_name"));
       // $select->join(array("i"=>"images"), 'i.product_id = p.product_id',array("image_name"));

        if ($paginated) {
            $dbTableGatewayAdapter = new DbSelect($select, $sql);
            //$dbTableGatewayAdapter = new DbTableGateway($this->tableGateway);
            $paginator = new Paginator($dbTableGatewayAdapter);
            return $paginator;
        } else {
            $resultSet = $this->tableGateway->selectWith($select);
        }
        //var_dump($resultSet->current());exit;
        return $resultSet;
    }



    public function getServiceById($serviceId){
        $sqlString = "SELECT * FROM services join servicePrice on services.serviceId=servicePrice.serviceId where services.serviceId = '".$serviceId."'" ;
        //var_dump($sqlString); exit;
        $resultSet = $this->tableGateway->getAdapter()->driver->getConnection()->execute($sqlString);

        return $resultSet;
    }


    public function getServices($serviceId = "" , $all = "all"){
        $sqlString = "SELECT * FROM services join service_options on services.serviceId=service_options.serviceId ";
        if($serviceId != ""){
            $sqlString .= " where services.serviceId = ".$serviceId."  ";
        }
        if($all == "none" ){
            $sqlString .= " group by services.serviceId";
        }
       // echo $sqlString; exit;
        $resultSet = $this->tableGateway->getAdapter()->driver->getConnection()->execute($sqlString);

        return $resultSet;

    }

}