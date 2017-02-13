<?php
namespace Application\Model;

use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;


class PaymentTable
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
        $select->order('image_id DESC');
        //$select->join('role', 'user.role_id = role.id', array('role' => 'name'));
        //$select->join('group', 'user.group_id = group.id', array('group' => 'name'));
    
        if ($paginated) {
            $dbTableGatewayAdapter = new DbSelect($select, $sql);
            //$dbTableGatewayAdapter = new DbTableGateway($this->tableGateway);
            $paginator = new Paginator($dbTableGatewayAdapter);
            return $paginator;
        }
    
        $resultSet = $this->tableGateway->selectWith($select);
    
        return $resultSet;
    }



    

    public function save($data)
    {
        
        $Sqldata = array(
            'userId'=>$data->userId,
            'email'=>$data->email,
            'firstName'=>$data->firstName,
            'lastName'=>$data->lastName,
            'passwd'=>md5($data->passwd),
            //'passwd'=>$data->passwd,
            'zip'=>$data->zip,
            'city'=>$data->city,
            'state'=>$data->state,
            'country'=>$data->country,
            'mobile'=>$data->mobile,
            'status'=>$data->status,
            'dateAdded'=>$data->dateAdded,
        );
        //var_dump($Sqldata); exit;
        return $this->tableGateway->insert($Sqldata);
    }


    public function addUser($data)
    {
        //var_dump($data); exit;
        $Sqldata = array(
            'name'=>$data->name,
            'email'=>$data->email,
            'mobile'=>$data->mobile,
            'amount'=>$data->amount,
            'package'=>$data->package,
            'gateway'=>$data->gateway,
            'status'=>$data->status,
            'orderId'=>$data->orderId,
            'asm'=>$data->asm,
            'tlName'=>$data->tlName,
            'agentName'=>$data->agentName,
        );
        //var_dump($Sqldata); exit;
        return $this->tableGateway->insert($Sqldata);
    }


    public function updateStatus($orderId,$status,$response,$responseText,$amount,$txnId){
        $where = array("orderId"=>$orderId);
        $data = array(
            "status"=>$status,
            "response"=>$response,
            "responseText"=>$responseText,
            "paytmAmount"=>$amount,
            "txnId"=>$txnId
        );
        return $this->tableGateway->update($data,$where);

    }

    public function captureUpdate($orderId,$tlName){
        $where = array("orderId"=>$orderId);
        $data = array(
            "capture"=>"1",
            "tlName"=>$tlName,

        );
       // var_dump($data);
       // var_dump($where);
        return $this->tableGateway->update($data,$where);

    }

    public function getPaymentStatus($orderId = "" ,$email="",$mobile=""){
        $sql = new Sql($this->tableGateway->adapter);
        $select = $sql->select();
        $select->from($this->tableGateway->getTable());
        $where = array();
       // $where['tlName'] = $admin;
        if($orderId!=""){
            $where['orderId'] = $orderId;
        }
        if($email!=""){
            $where['email'] = $email;
        }
        if($mobile!=""){
            $where['mobile'] = $mobile;
        }

        $select->where($where);
        $select->order('dateAdded DESC');
        //$select->join('role', 'user.role_id = role.id', array('role' => 'name'));
        //$select->join('group', 'user.group_id = group.id', array('group' => 'name'));
        //echo $select->getSqlString(); exit;
        return  $resultSet = $this->tableGateway->selectWith($select);

    }
    public function capturePayment($mobile=""){
        $sql = new Sql($this->tableGateway->adapter);
        $select = $sql->select();
        $select->from($this->tableGateway->getTable());
        $where = array();
        $where['status'] = 1;
        $where['capture'] = 0;
        $where['mobile'] = $mobile;
        $where['tlName'] = "tlName";



        $select->where($where);
        //$select->join('role', 'user.role_id = role.id', array('role' => 'name'));
        //$select->join('group', 'user.group_id = group.id', array('group' => 'name'));
        //echo $select->getSqlString(); exit;
        return  $resultSet = $this->tableGateway->selectWith($select);

    }


    public function getLastPaymentId(){
        $sqlString = "Select paymentId from payment ORDER BY paymentId desc limit 1" ;
        //var_dump($sqlString); exit;
        $resultSet = $this->tableGateway->getAdapter()->driver->getConnection()->execute($sqlString);

        //var_dump($resultSet->current()); exit;

        return $resultSet->current();

    }



    public function update($data)
    {
    
         $Sqldata = array(
            'user_id'=>$data->user_id,
            'address'=>$data->address,
            'pincode'=>$data->pincode,
            'city'=>$data->city,
            'state'=>$data->state,
            'email'=>$data->email,
            'dob'=>$data->dob,
            'phone'=>$data->phone,
            'status'=>$data->status,
            'date_added'=>$data->date_added,
        );
        return $this->tableGateway->update($Sqldata,array('user_id'=>$data->user_id));
        //var_dump($product); exit;
    }
    
    public function checkEmail($email) {
        
        $sql = new Sql($this->tableGateway->adapter);
        $select = $sql->select();
        $select->from($this->tableGateway->getTable());
        $select->where(array("email"=>$email));
        //$select->join('role', 'user.role_id = role.id', array('role' => 'name'));
        //$select->join('group', 'user.group_id = group.id', array('group' => 'name'));
        
        $resultSet = $this->tableGateway->selectWith($select);


        $res = "";
        if($resultSet->count()>0){
            $res =  "false";
        } else {
            $res = "true";
        }
        return $res;
        
    }

    public function getDetailsByEmail($email) {

        $sql = new Sql($this->tableGateway->adapter);
        $select = $sql->select();
        $select->from($this->tableGateway->getTable());
        $select->where(array("email"=>$email));
        $resultSet = $this->tableGateway->selectWith($select);
        return $resultSet->current();

    }



    
    public function checkPhone($phone) {
    
        $sql = new Sql($this->tableGateway->adapter);
        $select = $sql->select();
        $select->from($this->tableGateway->getTable());
        $select->where(array("phone"=>$phone));
        //$select->join('role', 'user.role_id = role.id', array('role' => 'name'));
        //$select->join('group', 'user.group_id = group.id', array('group' => 'name'));
        
        //echo $select; exit;
        $resultSet = $this->tableGateway->selectWith($select);
    
        $res = "";
        if($resultSet->count()==0){
            $res =  "true";
        } else {
            $res = "false";
        }
        return $res;
    
    }

    public function login($email,$password){
       // echo $email."-----".$password;
        $sql = new Sql($this->tableGateway->adapter);
        $select = $sql->select();
        $select->from($this->tableGateway->getTable());
        $select->where(array("email"=>$email,"passwd"=>md5($password)));
      //  echo $select->getSqlString();
        $resultSet = $this->tableGateway->selectWith($select);

        return $resultSet;
    }


    public function getUserDetails($userId){
        $sql = new Sql($this->tableGateway->adapter);
        $select = $sql->select();
        $select->from($this->tableGateway->getTable());
        $select->where(array("userId"=>$userId));
        $resultSet = $this->tableGateway->selectWith($select);
        return  $resultSet->current();
    }



    public function getEventImages($event_id){
        $sqlString = "Select ev.*,ei.image from events ev join event_images ei on ev.event_id = ei.event_id where ev.event_id = ".$event_id;
        $resultSet = $this->tableGateway->getAdapter()->driver->getConnection()->execute($sqlString);
        //var_dump($resultSet->count()); exit;
        return $resultSet;
    }

    public function insertPasswd($data){
        $user_id = $data['user_id'];
        $code = $data['code'];
        $expiry_date = $data['expiry_date'];
        $sqlString = "INSERT INTO passwd SET user_id ='".$user_id."',code='".$code."',expiry_date = '".$expiry_date."' " ;
        //var_dump($sqlString); exit;
        $resultSet = $this->tableGateway->getAdapter()->driver->getConnection()->execute($sqlString);

        return $resultSet;

    }


    public function getUserbyCode($code){
        $sqlString = "Select * from passwd where code = '".$code."' " ;
        //var_dump($sqlString); exit;
        $resultSet = $this->tableGateway->getAdapter()->driver->getConnection()->execute($sqlString);

        return $resultSet->current();
    }

    public function updatePassword($user_id,$password){
        $sqlString = "Update users set password = md5('".$password."') where user_id = '".$user_id."'" ;
        //var_dump($sqlString); exit;
        $resultSet = $this->tableGateway->getAdapter()->driver->getConnection()->execute($sqlString);

        return $resultSet;
    }


    
    
    



}


