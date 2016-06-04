<?php
namespace Application\Model;

 // Add these import statements
 use Zend\InputFilter\InputFilter;
 use Zend\InputFilter\InputFilterAwareInterface;
 use Zend\InputFilter\InputFilterInterface;

 class Jobseekers implements InputFilterAwareInterface
 {
    
    public $UserId;
    public $Password;
    public $ProfileId;
    public $Xml;
    public $DateAdded;
    public $DateModified;
    public $Validated;
    public $Name;
    public $Email;
    public $BlogUrl;
    public $Website;
    public $Microblog;
    public $Active;
    public $JobPrompt;
    public $SiteId;
    public $ReferredBy;
    public $LastActive;
    public $SmsAlert;
    public $Email_Auth;
    public $Mobile_Auth;
    public $Res_Phone_Auth;
    public $KioskID;
    public $BranchID;
    public $Mobile;
    public $Res_Cnt;
    public $Mob_Cnt;
    public $Res_Std;
    public $Res_Phone;
    public $Cnt_Code;
    public $St_Code;
    public $St_Other;
    public $City_Code;
    public $City_Other;
    public $Dob;
    public $Gender;
    public $Photo_Path;
    public $Current_Resume;
    public $Block_Comp;
    public $Name_Flag;
    public $Email_Flag;
    public $Mailing_Address;
    public $Mailing_Flag;
    public $Contact_Flag;
    public $Shield_Type;
    public $Res_P_Status;
    public $Res_UP_Status;
    public $Res_UM_Status;
    public $Res_Mod_Status;
    public $Res_UMod_Status;
    public $Sms_Code;
    public $Email_Code;
    public $Interested_In;
    public $PhotoStatus;
    public $Profile_Settings;
    public $Profile_View;
    public $Delete_Status;
    public $Delete_Res;
    public $Delete_Oth_Res;
    public $Deleted_Date;
    public $Email_Verify_Date;
    public $Mobile_Verify_Date;
    public $AutoApply;
    public $EmailActive;
    public $fb_id;
          
     protected $inputFilter;
    
     /*
      * @Author Naveen
      * @Project BookMyBloom
      * */
     
     public function exchangeArray($data)
     {
        
        $this->UserId = (isset($data['UserId'])) ? $data['UserId'] : "";
        $this->Password = (isset($data['Password'])) ? $data['Password'] : "";
        $this->ProfileId = (isset($data['ProfileId'])) ? $data['ProfileId'] : "";
        $this->Xml = (isset($data['Xml'])) ? $data['Xml'] : "";
        $this->DateAdded = (isset($data['DateAdded'])) ? $data['DateAdded'] : "";
        $this->DateModified = (isset($data['DateModified'])) ? $data['DateModified'] : "";
        $this->Validated = (isset($data['Validated'])) ? $data['Validated'] : "";
        $this->Name = (isset($data['Name'])) ? $data['Name'] : "";
        $this->Email = (isset($data['Email'])) ? $data['Email'] : "";
        $this->BlogUrl = (isset($data['BlogUrl'])) ? $data['BlogUrl'] : "";
        $this->Website = (isset($data['Website'])) ? $data['Website'] : "";
        $this->Microblog = (isset($data['Microblog'])) ? $data['Microblog'] : "";
        $this->Active = (isset($data['Active'])) ? $data['Active'] : "";
        $this->JobPrompt = (isset($data['JobPrompt'])) ? $data['JobPrompt'] : "";
        $this->SiteId = (isset($data['SiteId'])) ? $data['SiteId'] : "";
        $this->ReferredBy = (isset($data['ReferredBy'])) ? $data['ReferredBy'] : "";
        $this->LastActive = (isset($data['LastActive'])) ? $data['LastActive'] : "";
        $this->SmsAlert = (isset($data['SmsAlert'])) ? $data['SmsAlert'] : "";
        $this->Email_Auth = (isset($data['Email_Auth'])) ? $data['Email_Auth'] : "";
        $this->Mobile_Auth = (isset($data['Mobile_Auth'])) ? $data['Mobile_Auth'] : "";
        $this->Res_Phone_Auth = (isset($data['Res_Phone_Auth'])) ? $data['Res_Phone_Auth'] : "";
        $this->KioskID = (isset($data['KioskID'])) ? $data['KioskID'] : "";
        $this->BranchID = (isset($data['BranchID'])) ? $data['BranchID'] : "";
        $this->Mobile = (isset($data['Mobile'])) ? $data['Mobile'] : "";
        $this->Res_Cnt = (isset($data['Res_Cnt'])) ? $data['Res_Cnt'] : "";
        $this->Mob_Cnt = (isset($data['Mob_Cnt'])) ? $data['Mob_Cnt'] : "";
        $this->Res_Std = (isset($data['Res_Std'])) ? $data['Res_Std'] : "";
        $this->Res_Phone = (isset($data['Res_Phone'])) ? $data['Res_Phone'] : "";
        $this->Cnt_Code = (isset($data['Cnt_Code'])) ? $data['Cnt_Code'] : "";
        $this->St_Code = (isset($data['St_Code'])) ? $data['St_Code'] : "";
        $this->St_Other = (isset($data['St_Other'])) ? $data['St_Other'] : "";
        $this->City_Code = (isset($data['City_Code'])) ? $data['City_Code'] : "";
        $this->City_Other = (isset($data['City_Other'])) ? $data['City_Other'] : "";
        $this->Dob = (isset($data['Dob'])) ? $data['Dob'] : "";
        $this->Gender = (isset($data['Gender'])) ? $data['Gender'] : "";
        $this->Photo_Path = (isset($data['Photo_Path'])) ? $data['Photo_Path'] : "";
        $this->Current_Resume = (isset($data['Current_Resume'])) ? $data['Current_Resume'] : "";
        $this->Block_Comp = (isset($data['Block_Comp'])) ? $data['Block_Comp'] : "";
        $this->Name_Flag = (isset($data['Name_Flag'])) ? $data['Name_Flag'] : "";
        $this->Email_Flag = (isset($data['Email_Flag'])) ? $data['Email_Flag'] : "";
        $this->Mailing_Address = (isset($data['Mailing_Address'])) ? $data['Mailing_Address'] : "";
        $this->Mailing_Flag = (isset($data['Mailing_Flag'])) ? $data['Mailing_Flag'] : "";
        $this->Contact_Flag = (isset($data['Contact_Flag'])) ? $data['Contact_Flag'] : "";
        $this->Shield_Type = (isset($data['Shield_Type'])) ? $data['Shield_Type'] : "";
        $this->Res_P_Status = (isset($data['Res_P_Status'])) ? $data['Res_P_Status'] : "";
        $this->Res_UP_Status = (isset($data['Res_UP_Status'])) ? $data['Res_UP_Status'] : "";
        $this->Res_UM_Status = (isset($data['Res_UM_Status'])) ? $data['Res_UM_Status'] : "";
        $this->Res_Mod_Status = (isset($data['Res_Mod_Status'])) ? $data['Res_Mod_Status'] : "";
        $this->Res_UMod_Status = (isset($data['Res_UMod_Status'])) ? $data['Res_UMod_Status'] : "";
        $this->Sms_Code = (isset($data['Sms_Code'])) ? $data['Sms_Code'] : "";
        $this->Email_Code = (isset($data['Email_Code'])) ? $data['Email_Code'] : "";
        $this->Interested_In = (isset($data['Interested_In'])) ? $data['Interested_In'] : "";
        $this->PhotoStatus = (isset($data['PhotoStatus'])) ? $data['PhotoStatus'] : "";
        $this->Profile_Settings = (isset($data['Profile_Settings'])) ? $data['Profile_Settings'] : "";
        $this->Profile_View = (isset($data['Profile_View'])) ? $data['Profile_View'] : "";
        $this->Delete_Status = (isset($data['Delete_Status'])) ? $data['Delete_Status'] : "";
        $this->Delete_Res = (isset($data['Delete_Res'])) ? $data['Delete_Res'] : "";
        $this->Delete_Oth_Res = (isset($data['Delete_Oth_Res'])) ? $data['Delete_Oth_Res'] : "";
        $this->Deleted_Date = (isset($data['Deleted_Date'])) ? $data['Deleted_Date'] : "";
        $this->Email_Verify_Date = (isset($data['Email_Verify_Date'])) ? $data['Email_Verify_Date'] : "";
        $this->Mobile_Verify_Date = (isset($data['Mobile_Verify_Date'])) ? $data['Mobile_Verify_Date'] : "";
        $this->AutoApply = (isset($data['AutoApply'])) ? $data['AutoApply'] : "";
        $this->EmailActive = (isset($data['EmailActive'])) ? $data['EmailActive'] : "";
        $this->fb_id = (isset($data['fb_id'])) ? $data['fb_id'] : "";

          
     }

     public function setInputFilter(InputFilterInterface $inputFilter)
     {
         throw new \Exception("Not used");
     }

     public function getInputFilter()
     {
         if (!$this->inputFilter) {
             $inputFilter = new InputFilter();
             
           

 $inputFilter->add(array(
                 'name'     => 'UserId',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Password',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'ProfileId',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Xml',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'DateAdded',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'DateModified',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Validated',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Name',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Email',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'BlogUrl',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Website',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Microblog',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Active',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'JobPrompt',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'SiteId',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'ReferredBy',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'LastActive',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'SmsAlert',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Email_Auth',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Mobile_Auth',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Res_Phone_Auth',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'KioskID',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'BranchID',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Mobile',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Res_Cnt',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Mob_Cnt',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Res_Std',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Res_Phone',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Cnt_Code',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'St_Code',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'St_Other',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'City_Code',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'City_Other',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Dob',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Gender',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Photo_Path',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Current_Resume',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Block_Comp',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Name_Flag',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Email_Flag',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Mailing_Address',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Mailing_Flag',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Contact_Flag',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Shield_Type',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Res_P_Status',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Res_UP_Status',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Res_UM_Status',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Res_Mod_Status',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Res_UMod_Status',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Sms_Code',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Email_Code',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Interested_In',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'PhotoStatus',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Profile_Settings',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Profile_View',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Delete_Status',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Delete_Res',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Delete_Oth_Res',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Deleted_Date',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Email_Verify_Date',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'Mobile_Verify_Date',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'AutoApply',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'EmailActive',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
 $inputFilter->add(array(
                 'name'     => 'fb_id',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
             


             $this->inputFilter = $inputFilter;
         }
        return $this->inputFilter;
        // $this->inputFilter ;
         
     }
 }
