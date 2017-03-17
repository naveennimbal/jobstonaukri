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



class JsprofileTable
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


    public function save($data)
    {

        $Sqldata = array(
            'profileId'=>$data->profileId,
            'jsId'=>$data->jsId,
            'headline'=>$data->headline,
            'curDesignation'=>$data->curDesignation,
            'curCompanyId'=>$data->curCompanyId,
            'curLocation'=>$data->curLocation,
            'prefLocation'=>$data->prefLocation,
            'functionalArea'=>$data->functionalArea,
            'curRole'=>$data->curRole,
            'industryId'=>$data->industryId,
            'totExp'=>$data->totExp,
            'salary'=>$data->salary,
            'highestEducation'=>$data->highestEducation,
            'keySkils'=>$data->keySkils,
            'dateAdded'=>$data->dateAdded,
            'dateModified'=>$data->dateModified,


        );
        //var_dump($Sqldata); exit;
        return $this->tableGateway->insert($Sqldata);
    }



}