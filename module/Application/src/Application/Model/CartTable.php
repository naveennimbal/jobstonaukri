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



class CartTable
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



    public function getCart($userId){
        $sqlString = "SELECT * FROM resume_cart ";
        $sqlString .= " join services on services.serviceId=resume_cart.serviceId";
        $sqlString .= " join service_options on service_options.serviceOptionId=resume_cart.serviceOptionId";
        $sqlString .= " where resume_cart.UserId = '".$userId."' and resume_cart.status != 1" ;
        //var_dump($sqlString); exit;
        $resultSet = $this->tableGateway->getAdapter()->driver->getConnection()->execute($sqlString);

        return $resultSet;

    }

    public function getTotalCartCost($userId){
        /*$where['UserId'] = $userId;
        $where['status'] = 0;
        //print_r($where);

        $sql = new Sql($this->tableGateway->adapter);
        $select = $sql->select();
        $select->from($this->tableGateway->getTable());
        $select->where($where);
        //echo  $select->getSqlString(); exit;
        $resultSet = $this->tableGateway->selectWith($select);
        */

        $sqlString = "SELECT so.price FROM service_options so ";
        $sqlString .= " JOIN services s on s.serviceId = so.serviceId";
        $sqlString .= " JOIN resume_cart rc on so.serviceOptionid = rc.serviceOptionId";
        $sqlString .= " where rc.userId = '".$userId."' and rc.status = 0" ;
        //var_dump($sqlString); exit;
        $resultSet = $this->tableGateway->getAdapter()->driver->getConnection()->execute($sqlString);

       // return $resultSet;

        $totalAmount = 0;
        foreach($resultSet as $res){
            //var_dump($res);
            $totalAmount= $totalAmount +  $res['price'];
            //echo $res->price;
        }
        //exit;

        return $totalAmount;

    }

    public function checkIfExist($data){
        $where['UserId'] = $data['UserId'];
        $where['serviceId'] = $data['serviceId'] ;
        $where['serviceOptionId'] =$data['serviceOptionId'] ;
        $where['status'] = 0;
        //print_r($where);

        $sql = new Sql($this->tableGateway->adapter);
        $select = $sql->select();
        $select->from($this->tableGateway->getTable());
        $select->where($where);
       //echo  $select->getSqlString(); exit;
        $resultSet = $this->tableGateway->selectWith($select);

        //return $resultSet->current();
        return $resultSet;
    }
//
    public function updateOrderId($userId, $orderId ){
        $set = array(
            'orderId' => $orderId,
            //'status'=>"0"
        );
        //echo $userId."---------".$orderId."<br>";
        $return =  $this->tableGateway->update($set,array("userId"=>$userId,"status"=>"0"));
        //var_dump($return); exit;
        //$sqlString = "UPDATE resume_cart SET orderId = '".$orderId."' WHERE userId ='".$userId."' AND status='0'";
        //echo $sqlString; exit;
       // $resultSet = $this->tableGateway->getAdapter()->driver->getConnection()->execute($sqlString);

        return $return;
    }

    public function updateResponse($data,$where){
        /*$sqlData = array(
            'userId'=>$userId,
            'orderId' => $orderId,
            'status'=>"1"
        );*/
        return $this->tableGateway->update($data,$where);

    }


    public function save($data){
        $Sqldata = array(
            'cartId'=>$data->cartId,
            'userId'=>$data->UserId,
            'serviceId'=>$data->serviceId,
            'serviceOptionId'=>$data->serviceOptionId,

        );
        return $this->tableGateway->insert($Sqldata);
    }


    public function removeCart($data){
        //$where['UserId'] = $data['UserId'];
        //$where['serviceId'] = $data['serviceId'] ;
        //$where['serviceOptionId'] =$data['serviceOptionId'] ;
        //$where['status'] = 0;

        $sqlString = "DELETE FROM resume_cart where userId='".$data['UserId']."' AND serviceId='".$data['serviceId'] ."' AND serviceOptionId='".$data['serviceOptionId']."' AND status !='1'" ;
        //var_dump($sqlString); exit;

        //echo  $select->getSqlString(); exit;
        try{
            $resultSet = $this->tableGateway->getAdapter()->driver->getConnection()->execute($sqlString);
        } catch(\Exception $e){
            echo $e->getMessage();
        }

        //return $resultSet->current();
        if($resultSet){
            return true;
        } else {
            return false;
        }
    }


    /*public function getServiceById($serviceId){
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

    }*/

}