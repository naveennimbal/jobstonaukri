<?php
namespace Application\Model;

use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;


class JobroleTable
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
        //$select->order('Disp_Order DESC');
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
        'Jobr_Code'=>$data->Jobr_Code,
        'Func_Code'=>$data->Func_Code,
        'Jobr_Desc'=>$data->Jobr_Desc,
        'Disp_Order'=>$data->Disp_Order,
        'Search_Banner'=>$data->Search_Banner,
        );
        //var_dump($Sqldata); exit;
        return $this->tableGateway->insert($Sqldata);
    }
    
    
    public function update($data)
    {
         $Sqldata = array(
        'Jobr_Code'=>$data->Jobr_Code,
        'Func_Code'=>$data->Func_Code,
        'Jobr_Desc'=>$data->Jobr_Desc,
        'Disp_Order'=>$data->Disp_Order,
        'Search_Banner'=>$data->Search_Banner,
          );
        return $this->tableGateway->update($Sqldata,array('user_id'=>$data->user_id));
        //var_dump($product); exit;
    }
    
   
    public function getUserDetails($userId){
        /*$sql = new Sql($this->tableGateway->adapter);
        $select = $sql->select();
        $select->from($this->tableGateway->getTable());
        $select->where(array("userId"=>$userId));
        $resultSet = $this->tableGateway->selectWith($select);
        return  $resultSet->current();*/
       // echo "jdshfkjds"; exit;
        $select = new Select('jobseekers');

        $select->join(array("det" => "cj_ch_jobseekers_res_det"), "det.UserId = jobseekers.UserId",  Select::SQL_STAR)
                 ->where(array("jobseekers.UserId"=>$userId));
        $resultSet = $this->tableGateway->selectWith($select);
        return  $resultSet->current();
      }


}


