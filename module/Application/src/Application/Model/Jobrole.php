<?php
namespace Application\Model;

 // Add these import statements
 use Zend\InputFilter\InputFilter;
 use Zend\InputFilter\InputFilterAwareInterface;
 use Zend\InputFilter\InputFilterInterface;

 class Jobrole implements InputFilterAwareInterface
 {
    
    public $Jobr_Code;
    public $Func_Code;
    public $Jobr_Desc;
    public $Disp_Order;
    public $Search_Banner;
    
          
     protected $inputFilter;
    
     /*
      * @Author Naveen
      * @Project BookMyBloom
      * */
     
     public function exchangeArray($data)
     {
        $this->Jobr_Code = (isset($data['Jobr_Code'])) ? $data['Jobr_Code'] : "";
        $this->Func_Code = (isset($data['Func_Code'])) ? $data['Func_Code'] : "";
        $this->Jobr_Desc = (isset($data['Jobr_Desc'])) ? $data['Jobr_Desc'] : "";
        $this->Disp_Order = (isset($data['Disp_Order'])) ? $data['Disp_Order'] : "";
        $this->Search_Banner = (isset($data['Search_Banner'])) ? $data['Search_Banner'] : "";
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
                 'name'     => 'Jobr_Code',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
            $inputFilter->add(array(
                 'name'     => 'Func_Code',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
            $inputFilter->add(array(
                 'name'     => 'Jobr_Desc',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
            $inputFilter->add(array(
                 'name'     => 'Disp_Order',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));
             
             
 
            $inputFilter->add(array(
                 'name'     => 'Search_Banner',
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
