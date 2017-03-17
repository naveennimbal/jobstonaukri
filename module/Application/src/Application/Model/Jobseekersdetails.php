<?php
namespace Application\Model;

 // Add these import statements
 use Zend\InputFilter\InputFilter;
 use Zend\InputFilter\InputFilterAwareInterface;
 use Zend\InputFilter\InputFilterInterface;

 class Jobseekersdetails implements InputFilterAwareInterface
 {

     public $Res_Id;
     public $jsId;
     public $Res_Path;
     public $New_Res_Path;
     public $Res_Type;
     public $Res_Stat;
     public $Key_Skills;
     public $Res_Headline;
     public $Fs_Path;
     public $Yr_Of_Exp;
     public $Mth_Of_Exp;
     public $Indus_Code;
     public $Func_Code;
     public $Jobr_Code;
     public $Pref_Loc_Code;
     public $Res_Original_Name;
     public $Edu_Code1;
     public $Edu_Other1;
     public $Spec_Code1;
     public $Spec_Other1;
     public $Instit_Code1;
     public $Instit_Other1;
     public $Yr_Of_Comp1;
     public $Edu_Code2;
     public $Edu_Other2;
     public $Spec_Code2;
     public $Spec_Other2;
     public $Instit_Code2;
     public $Instit_Other2;
     public $Yr_Of_Comp2;
     public $Edu_Code3;
     public $Edu_Other3;
     public $Spec_Code3;
     public $Spec_Other3;
     public $Instit_Code3;
     public $Instit_Other3;
     public $Yr_Of_Comp3;
     public $Indus_Exp;
     public $Func_Exp;
     public $UserId;
     public $FileServer_Name;
     public $App_Def;
     public $Avail_Request;
     public $DateAdded;

     protected $inputFilter;
    
     /*
      * @Author Naveen
      * @Project BookMyBloom
      * */
     
     public function exchangeArray($data)
     {
         $this->Res_Id = (isset($data['Res_Id'])) ? $data['Res_Id'] : '';
         $this->jsId = (isset($data['jsId'])) ? $data['jsId'] : '';
         $this->Res_Path = (isset($data['Res_Path'])) ? $data['Res_Path'] : '';
         $this->New_Res_Path = (isset($data['New_Res_Path'])) ? $data['New_Res_Path'] : '';
         $this->Res_Type = (isset($data['Res_Type'])) ? $data['Res_Type'] : '';
         $this->Res_Stat = (isset($data['Res_Stat'])) ? $data['Res_Stat'] : '';
         $this->Key_Skills = (isset($data['Key_Skills'])) ? $data['Key_Skills'] : '';
         $this->Res_Headline = (isset($data['Res_Headline'])) ? $data['Res_Headline'] : '';
         $this->Fs_Path = (isset($data['Fs_Path'])) ? $data['Fs_Path'] : '';
         $this->Yr_Of_Exp = (isset($data['Yr_Of_Exp'])) ? $data['Yr_Of_Exp'] : '';
         $this->Mth_Of_Exp = (isset($data['Mth_Of_Exp'])) ? $data['Mth_Of_Exp'] : '';
         $this->Indus_Code = (isset($data['Indus_Code'])) ? $data['Indus_Code'] : '';
         $this->Func_Code = (isset($data['Func_Code'])) ? $data['Func_Code'] : '';
         $this->Jobr_Code = (isset($data['Jobr_Code'])) ? $data['Jobr_Code'] : '';
         $this->Pref_Loc_Code = (isset($data['Pref_Loc_Code'])) ? $data['Pref_Loc_Code'] : '';
         $this->Res_Original_Name = (isset($data['Res_Original_Name'])) ? $data['Res_Original_Name'] : '';
         $this->Edu_Code1 = (isset($data['Edu_Code1'])) ? $data['Edu_Code1'] : '';
         $this->Edu_Other1 = (isset($data['Edu_Other1'])) ? $data['Edu_Other1'] : '';
         $this->Spec_Code1 = (isset($data['Spec_Code1'])) ? $data['Spec_Code1'] : '';
         $this->Spec_Other1 = (isset($data['Spec_Other1'])) ? $data['Spec_Other1'] : '';
         $this->Instit_Code1 = (isset($data['Instit_Code1'])) ? $data['Instit_Code1'] : '';
         $this->Instit_Other1 = (isset($data['Instit_Other1'])) ? $data['Instit_Other1'] : '';
         $this->Yr_Of_Comp1 = (isset($data['Yr_Of_Comp1'])) ? $data['Yr_Of_Comp1'] : '';
         $this->Edu_Code2 = (isset($data['Edu_Code2'])) ? $data['Edu_Code2'] : '';
         $this->Edu_Other2 = (isset($data['Edu_Other2'])) ? $data['Edu_Other2'] : '';
         $this->Spec_Code2 = (isset($data['Spec_Code2'])) ? $data['Spec_Code2'] : '';
         $this->Spec_Other2 = (isset($data['Spec_Other2'])) ? $data['Spec_Other2'] : '';
         $this->Instit_Code2 = (isset($data['Instit_Code2'])) ? $data['Instit_Code2'] : '';
         $this->Instit_Other2 = (isset($data['Instit_Other2'])) ? $data['Instit_Other2'] : '';
         $this->Yr_Of_Comp2 = (isset($data['Yr_Of_Comp2'])) ? $data['Yr_Of_Comp2'] : '';
         $this->Edu_Code3 = (isset($data['Edu_Code3'])) ? $data['Edu_Code3'] : '';
         $this->Edu_Other3 = (isset($data['Edu_Other3'])) ? $data['Edu_Other3'] : '';
         $this->Spec_Code3 = (isset($data['Spec_Code3'])) ? $data['Spec_Code3'] : '';
         $this->Spec_Other3 = (isset($data['Spec_Other3'])) ? $data['Spec_Other3'] : '';
         $this->Instit_Code3 = (isset($data['Instit_Code3'])) ? $data['Instit_Code3'] : '';
         $this->Instit_Other3 = (isset($data['Instit_Other3'])) ? $data['Instit_Other3'] : '';
         $this->Yr_Of_Comp3 = (isset($data['Yr_Of_Comp3'])) ? $data['Yr_Of_Comp3'] : '';
         $this->Indus_Exp = (isset($data['Indus_Exp'])) ? $data['Indus_Exp'] : '';
         $this->Func_Exp = (isset($data['Func_Exp'])) ? $data['Func_Exp'] : '';
         $this->UserId = (isset($data['UserId'])) ? $data['UserId'] : '';
         $this->FileServer_Name = (isset($data['FileServer_Name'])) ? $data['FileServer_Name'] : '';
         $this->App_Def = (isset($data['App_Def'])) ? $data['App_Def'] : '';
         $this->Avail_Request = (isset($data['Avail_Request'])) ? $data['Avail_Request'] : '';
         $this->DateAdded = (isset($data['DateAdded'])) ? $data['DateAdded'] : '';


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
                 'name' => 'Res_Id',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));

            $inputFilter->add(array(
                 'name' => 'jsId',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Res_Path',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'New_Res_Path',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Res_Type',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Res_Stat',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Key_Skills',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Res_Headline',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Fs_Path',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Yr_Of_Exp',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Mth_Of_Exp',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Indus_Code',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Func_Code',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Jobr_Code',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Pref_Loc_Code',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Res_Original_Name',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Edu_Code1',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Edu_Other1',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Spec_Code1',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Spec_Other1',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Instit_Code1',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Instit_Other1',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Yr_Of_Comp1',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Edu_Code2',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Edu_Other2',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Spec_Code2',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Spec_Other2',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Instit_Code2',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Instit_Other2',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Yr_Of_Comp2',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Edu_Code3',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Edu_Other3',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Spec_Code3',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Spec_Other3',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Instit_Code3',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Instit_Other3',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Yr_Of_Comp3',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Indus_Exp',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Func_Exp',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'UserId',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'FileServer_Name',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'App_Def',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'Avail_Request',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                 ),
             ));


             $inputFilter->add(array(
                 'name' => 'DateAdded',
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
