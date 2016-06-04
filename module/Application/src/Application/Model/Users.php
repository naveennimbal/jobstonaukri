<?php
namespace Application\Model;

 // Add these import statements
 use Zend\InputFilter\InputFilter;
 use Zend\InputFilter\InputFilterAwareInterface;
 use Zend\InputFilter\InputFilterInterface;

 class Users implements InputFilterAwareInterface
 {
     public $userId;
     public $email;
     public $firstName;
     public $lastName;
     public $city;
     public $state;
     public $mobile;
     public $zip;
     public $passwd;
     public $status;
     public $dateAdded;
          
     protected $inputFilter;
    
     /*
      * @Author Naveen
      * @Project BookMyBloom
      * */
     
     public function exchangeArray($data)
     {
         
         
         $this->userId = (isset($data['userId'])) ? $data['userId'] : "";
         $this->email = (isset($data['email'])) ? $data['email'] : "";
         $this->passwd = (isset($data['passwd'])) ? $data['passwd'] : "";
         $this->mobile= (isset($data['mobile'])) ? $data['mobile'] : "";
         $this->firstName = (isset($data['firstName'])) ? $data['firstName'] : "";
         $this->lastName = (isset($data['lastName'])) ? $data['lastName'] : "";
         $this->city = (isset($data['city'])) ? $data['city'] : "";
         $this->state = (isset($data['state'])) ? $data['state'] : "";
         $this->zip = (isset($data['zip'])) ? $data['zip'] : "";
         $this->country = (isset($data['country'])) ? $data['country'] : "";

         $this->status = (isset($data['status'])) ? $data['status'] : 1;
         $this->dateAdded = (isset($data['dateAdded'])) ? $data['dateAdded'] : date('Y-m-d');
          
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
                 'name'     => 'userId',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                     
                 ),
             ));

             $inputFilter->add(array(
                 'name'     => 'email',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(

                 ),
             ));

             $inputFilter->add(array(
                 'name'     => 'fname',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(

                 ),
             ));

             $inputFilter->add(array(
                 'name'     => 'lname',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(

                 ),
             ));

             $inputFilter->add(array(
                 'name'     => 'passwd',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(

                 ),
             ));
             
             $inputFilter->add(array(
                 'name'     => 'zip',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
             
                 ),
             ));
             
             
             $inputFilter->add(array(
                 'name'     => 'city',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
             
                 ),
             ));
             
             $inputFilter->add(array(
                 'name'     => 'state',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                      
                 ),
             ));
             
             $inputFilter->add(array(
                 'name'     => 'country',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
                      
                 ),
             ));
             

             
             $inputFilter->add(array(
                 'name'     => 'mobile',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
             
                 ),
             ));

             
             
             $inputFilter->add(array(
                 'name'     => 'status',
                 //'required' => true,
                 'filters'  => array(
                     array('name' => 'StripTags'),
                     array('name' => 'StringTrim'),
                 ),
                 'validators' => array(
             
                 ),
             ));
             
             $inputFilter->add(array(
                 'name'     => 'dateAdded',
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
