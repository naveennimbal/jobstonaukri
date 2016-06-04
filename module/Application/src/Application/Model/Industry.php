<?php
namespace Application\Model;

 // Add these import statements
 use Zend\InputFilter\InputFilter;
 use Zend\InputFilter\InputFilterAwareInterface;
 use Zend\InputFilter\InputFilterInterface;

 class Industry implements InputFilterAwareInterface
 {
    
    public $Ind_Code;
    public $Ind_Desc;
    public $Disp_Order;
    
          
     protected $inputFilter;
    
     /*
      * @Author Naveen
      * @Project BookMyBloom
      * */
     
     public function exchangeArray($data)
     {
        
        $this->Ind_Code = (isset($data['Ind_Code'])) ? $data['Ind_Code'] : "";
        $this->Ind_Desc = (isset($data['Ind_Desc'])) ? $data['Ind_Desc'] : "";
        $this->Disp_Order = (isset($data['Disp_Order'])) ? $data['Disp_Order'] : "";
        
          
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
                         'name'     => 'Ind_Desc',
                         //'required' => true,
                         'filters'  => array(
                             array('name' => 'StripTags'),
                             array('name' => 'StringTrim'),
                         ),
                         'validators' => array(

                         ),
                     ));

            $inputFilter->add(array(
                         'name'     => 'Ind_Code',
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


             $this->inputFilter = $inputFilter;
         }
        return $this->inputFilter;
        // $this->inputFilter ;
         
     }
 }
