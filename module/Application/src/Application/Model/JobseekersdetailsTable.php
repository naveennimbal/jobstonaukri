<?php
namespace Application\Model;

use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;
use Zend\Db\Metadata;


class JobseekersdetailsTable
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
            'Res_Id'=>$data->Res_Id,
            'Res_Path'=>$data->Res_Path,
            'New_Res_Path'=>$data->New_Res_Path,
            'Res_Type'=>$data->Res_Type,
            'Res_Stat'=>$data->Res_Stat,
            'Key_Skills'=>$data->Key_Skills,
            'Res_Headline'=>$data->Res_Headline,
            'Fs_Path'=>$data->Fs_Path,
            'Yr_Of_Exp'=>$data->Yr_Of_Exp,
            'Mth_Of_Exp'=>$data->Mth_Of_Exp,
            'Indus_Code'=>$data->Indus_Code,
            'Func_Code'=>$data->Func_Code,
            'Jobr_Code'=>$data->Jobr_Code,
            'Pref_Loc_Code'=>$data->Pref_Loc_Code,
            'Res_Original_Name'=>$data->Res_Original_Name,
            'Edu_Code1'=>$data->Edu_Code1,
            'Edu_Other1'=>$data->Edu_Other1,
            'Spec_Code1'=>$data->Spec_Code1,
            'Spec_Other1'=>$data->Spec_Other1,
            'Instit_Code1'=>$data->Instit_Code1,
            'Instit_Other1'=>$data->Instit_Other1,
            'Yr_Of_Comp1'=>$data->Yr_Of_Comp1,
            'Edu_Code2'=>$data->Edu_Code2,
            'Edu_Other2'=>$data->Edu_Other2,
            'Spec_Code2'=>$data->Spec_Code2,
            'Spec_Other2'=>$data->Spec_Other2,
            'Instit_Code2'=>$data->Instit_Code2,
            'Instit_Other2'=>$data->Instit_Other2,
            'Yr_Of_Comp2'=>$data->Yr_Of_Comp2,
            'Edu_Code3'=>$data->Edu_Code3,
            'Edu_Other3'=>$data->Edu_Other3,
            'Spec_Code3'=>$data->Spec_Code3,
            'Spec_Other3'=>$data->Spec_Other3,
            'Instit_Code3'=>$data->Instit_Code3,
            'Instit_Other3'=>$data->Instit_Other3,
            'Yr_Of_Comp3'=>$data->Yr_Of_Comp3,
            'Indus_Exp'=>$data->Indus_Exp,
            'Func_Exp'=>$data->Func_Exp,
            'UserId'=>$data->UserId,
            'FileServer_Name'=>$data->FileServer_Name,
            'App_Def'=>$data->App_Def,
            'Avail_Request'=>$data->Avail_Request,
            'DateAdded'=>$data->DateAdded,


        );
        //var_dump($Sqldata); exit;
        return $this->tableGateway->insert($Sqldata);
    }


    public function addUser($data)
    {
        //var_dump($data); exit;
        $Sqldata = array(
            'Res_Id'=>$data->Res_Id,
            'Res_Path'=>$data->Res_Path,
            'New_Res_Path'=>$data->New_Res_Path,
            'Res_Type'=>$data->Res_Type,
            'Res_Stat'=>$data->Res_Stat,
            'Key_Skills'=>$data->Key_Skills,
            'Res_Headline'=>$data->Res_Headline,
            'Fs_Path'=>$data->Fs_Path,
            'Yr_Of_Exp'=>$data->Yr_Of_Exp,
            'Mth_Of_Exp'=>$data->Mth_Of_Exp,
            'Indus_Code'=>$data->Indus_Code,
            'Func_Code'=>$data->Func_Code,
            'Jobr_Code'=>$data->Jobr_Code,
            'Pref_Loc_Code'=>$data->Pref_Loc_Code,
            'Res_Original_Name'=>$data->Res_Original_Name,
            'Edu_Code1'=>$data->Edu_Code1,
            'Edu_Other1'=>$data->Edu_Other1,
            'Spec_Code1'=>$data->Spec_Code1,
            'Spec_Other1'=>$data->Spec_Other1,
            'Instit_Code1'=>$data->Instit_Code1,
            'Instit_Other1'=>$data->Instit_Other1,
            'Yr_Of_Comp1'=>$data->Yr_Of_Comp1,
            'Edu_Code2'=>$data->Edu_Code2,
            'Edu_Other2'=>$data->Edu_Other2,
            'Spec_Code2'=>$data->Spec_Code2,
            'Spec_Other2'=>$data->Spec_Other2,
            'Instit_Code2'=>$data->Instit_Code2,
            'Instit_Other2'=>$data->Instit_Other2,
            'Yr_Of_Comp2'=>$data->Yr_Of_Comp2,
            'Edu_Code3'=>$data->Edu_Code3,
            'Edu_Other3'=>$data->Edu_Other3,
            'Spec_Code3'=>$data->Spec_Code3,
            'Spec_Other3'=>$data->Spec_Other3,
            'Instit_Code3'=>$data->Instit_Code3,
            'Instit_Other3'=>$data->Instit_Other3,
            'Yr_Of_Comp3'=>$data->Yr_Of_Comp3,
            'Indus_Exp'=>$data->Indus_Exp,
            'Func_Exp'=>$data->Func_Exp,
            'UserId'=>$data->UserId,
            'FileServer_Name'=>$data->FileServer_Name,
            'App_Def'=>$data->App_Def,
            'Avail_Request'=>$data->Avail_Request,
            'DateAdded'=>$data->DateAdded,

        );
        return $this->tableGateway->insert($Sqldata);
    }
    
    public function update($data)
    {
    
         $Sqldata = array(
             'Res_Id'=>$data->Res_Id,
             'Res_Path'=>$data->Res_Path,
             'New_Res_Path'=>$data->New_Res_Path,
             'Res_Type'=>$data->Res_Type,
             'Res_Stat'=>$data->Res_Stat,
             'Key_Skills'=>$data->Key_Skills,
             'Res_Headline'=>$data->Res_Headline,
             'Fs_Path'=>$data->Fs_Path,
             'Yr_Of_Exp'=>$data->Yr_Of_Exp,
             'Mth_Of_Exp'=>$data->Mth_Of_Exp,
             'Indus_Code'=>$data->Indus_Code,
             'Func_Code'=>$data->Func_Code,
             'Jobr_Code'=>$data->Jobr_Code,
             'Pref_Loc_Code'=>$data->Pref_Loc_Code,
             'Res_Original_Name'=>$data->Res_Original_Name,
             'Edu_Code1'=>$data->Edu_Code1,
             'Edu_Other1'=>$data->Edu_Other1,
             'Spec_Code1'=>$data->Spec_Code1,
             'Spec_Other1'=>$data->Spec_Other1,
             'Instit_Code1'=>$data->Instit_Code1,
             'Instit_Other1'=>$data->Instit_Other1,
             'Yr_Of_Comp1'=>$data->Yr_Of_Comp1,
             'Edu_Code2'=>$data->Edu_Code2,
             'Edu_Other2'=>$data->Edu_Other2,
             'Spec_Code2'=>$data->Spec_Code2,
             'Spec_Other2'=>$data->Spec_Other2,
             'Instit_Code2'=>$data->Instit_Code2,
             'Instit_Other2'=>$data->Instit_Other2,
             'Yr_Of_Comp2'=>$data->Yr_Of_Comp2,
             'Edu_Code3'=>$data->Edu_Code3,
             'Edu_Other3'=>$data->Edu_Other3,
             'Spec_Code3'=>$data->Spec_Code3,
             'Spec_Other3'=>$data->Spec_Other3,
             'Instit_Code3'=>$data->Instit_Code3,
             'Instit_Other3'=>$data->Instit_Other3,
             'Yr_Of_Comp3'=>$data->Yr_Of_Comp3,
             'Indus_Exp'=>$data->Indus_Exp,
             'Func_Exp'=>$data->Func_Exp,
             'UserId'=>$data->UserId,
             'FileServer_Name'=>$data->FileServer_Name,
             'App_Def'=>$data->App_Def,
             'Avail_Request'=>$data->Avail_Request,
             'DateAdded'=>$data->DateAdded,

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
    
    
     public function checkProfile($profileId) {
        
        $sql = new Sql($this->tableGateway->adapter);
        $select = $sql->select();
        $select->from($this->tableGateway->getTable());
        $select->where(array("ProfileId"=>$profileId));
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
        $select->where(array("Email"=>$email));
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
        $select->where(array("Email"=>$email,"Password"=>md5($password)));
      //  echo $select->getSqlString();
        $resultSet = $this->tableGateway->selectWith($select);

        return $resultSet;
    }


    public function getUserDetails($userId){
        /*$sql = new Sql($this->tableGateway->adapter);
        $select = $sql->select();
        $select->from($this->tableGateway->getTable());
        $select->where(array("userId"=>$userId));
        $resultSet = $this->tableGateway->selectWith($select);
        return  $resultSet->current();*/
       // echo "jdshfkjds"; exit;
        
        $jobseekersCols = array(
            "UserId",  "Password",  "ProfileId",  "Xml",  "DateAdded",  "DateModified",  "Validated",  "Name",  "Email",  "BlogUrl",  "Website",  "Microblog",  "Active",  "JobPrompt",  "SiteId",  "ReferredBy",  "LastActive",  "SmsAlert",  "Email_Auth",  "Mobile_Auth",  "Res_Phone_Auth",  "KioskID",  "BranchID",  "Mobile",  "Res_Cnt",  "Mob_Cnt",  "Res_Std",  "Res_Phone",  "Cnt_Code",  "St_Code",  "St_Other",  "City_Code",  "City_Other",  "Dob",  "Gender",  "Photo_Path",  "Current_Resume",  "Block_Comp",  "Name_Flag",  "Email_Flag",  "Mailing_Address",  "Mailing_Flag",  "Contact_Flag",  "Shield_Type",  "Res_P_Status",  "Res_UP_Status",  "Res_UM_Status",  "Res_Mod_Status",  "Res_UMod_Status",  "Sms_Code",  "Email_Code",  "Interested_In",  "PhotoStatus",  "Profile_Settings",  "Profile_View",  "Delete_Status",  "Delete_Res",  "Delete_Oth_Res",  "Deleted_Date",  "Email_Verify_Date",  "Mobile_Verify_Date",  "AutoApply",  "EmailActive",  "fb_id", 
        );
        
        $detColumns = array(
            "Res_Id",
            "Res_Path", 
            "New_Res_Path",
            "Res_Type", 
            "Res_Stat", 
            "Key_Skills",
            "Res_Headline",
            "Fs_Path", 	
            "Yr_Of_Exp", 	
            "Mth_Of_Exp", 	
            "Indus_Code", 	
            "Func_Code", 	
            "Jobr_Code", 	
            "Pref_Loc_Code", 	
            "Res_Original_Name",
            "Edu_Code1", 	
            "Edu_Other1", 	
            "Spec_Code1", 	
            "Spec_Other1", 	
            "Instit_Code1", 	
            "Instit_Other1", 	
            "Yr_Of_Comp1", 	
            "Edu_Code2", 	
            "Edu_Other2", 	
            "Spec_Code2", 	
            "Spec_Other2", 	
            "Instit_Code2", 	
            "Instit_Other2", 
            "Yr_Of_Comp2", 
            "Edu_Code3", 
            "Edu_Other3",
            "Spec_Code3",
            "Spec_Other3",
            "Instit_Code3",
            "Instit_Other3",
            "Yr_Of_Comp3",
            "Indus_Exp", 
            "Func_Exp", 
            "UserId", 	
            "FileServer_Name", 
            "App_Def", 	
            "Avail_Request",
            "DateAdded",
        );
        
        
        $select = new Select('jobseekers');
       // $select->columns($jobseekersCols);

        $select->join(array("det" => "cj_ch_jobseekers_res_det"), "det.UserId = jobseekers.UserId",$detColumns )
                 ->where(array("jobseekers.UserId"=>$userId));
        //$select->columns(array('det.*'));
        //echo $select->getSqlString(); exit;
        
        //$resultSet = $this->tableGateway->selectWith($select);
        $sqlString = "SELECT jobseekers.* , cj_ch_jobseekers_res_det.*,country.Cnt_Desc,st.St_Desc,ct.City_Desc  from jobseekers join cj_ch_jobseekers_res_det on jobseekers.UserId = cj_ch_jobseekers_res_det.UserId join cj_mast_country country on country.Cnt_Code = jobseekers.Cnt_Code  join cj_mast_state st on st.St_Code=jobseekers.St_Code join cj_mast_city ct on ct.City_Code=jobseekers.City_Code where jobseekers.Userid='".$userId."' group by (jobseekers.UserId) ";
        $resultSet = $this->tableGateway->getAdapter()->driver->getConnection()->execute($sqlString);
        ///var_dump($resultSet); exit;
        $result['user_details'] =   $resultSet->current();
        
        $edu_sql = "Select * from cj_mast_education where Edu_Code = '".$result['Edu_Code1']."'";
        $edu_other_sql = "Select * from cj_mast_education where Edu_Code = '".$result['Edu_Other1']."'";

        $edu_sql_resSet = $this->tableGateway->getAdapter()->driver->getConnection()->execute($edu_sql);
        $edu_other_sql_resSet = $this->tableGateway->getAdapter()->driver->getConnection()->execute($edu_other_sql);
        $edu_res = $edu_sql_resSet->current();
        $edu_other_res = $edu_other_sql_resSet->current();
        $result['Edu_Desc'] = $edu_res['Edu_Desc'];
        $result['Edu_Other'] = $edu_other_res['Edu_Desc'];
        
        return $result;
        //var_dump($result); exit;
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


