<?php
namespace Application\Model;

 // Add these import statements
 use Zend\InputFilter\InputFilter;
 use Zend\InputFilter\InputFilterAwareInterface;
 use Zend\InputFilter\InputFilterInterface;

 class Pages implements InputFilterAwareInterface
 {
    
    public $page_id ;
    public $pageTitle ;
    public $content;
    public $status;
    
          
     protected $inputFilter;
    
     /*
      * @Author Naveen
      * @Project BookMyBloom
      * */
     
     public function exchangeArray($data)
     {
        
        $this->page_id = (isset($data['page_id'])) ? $data['page_id'] : "";
        $this->pageTitle = (isset($data['pageTitle'])) ? $data['pageTitle'] : "";
        $this->content = (isset($data['content'])) ? $data['content'] : "";
        $this->status = (isset($data['status'])) ? $data['status'] : "";
        
          
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
                         'name'     => 'page_id',
                         //'required' => true,
                         'filters'  => array(
                             array('name' => 'StripTags'),
                             array('name' => 'StringTrim'),
                         ),
                         'validators' => array(

                         ),
                     ));

             $inputFilter->add(array(
                         'name'     => 'pageTitle',
                         //'required' => true,
                         'filters'  => array(
                             array('name' => 'StripTags'),
                             array('name' => 'StringTrim'),
                         ),
                         'validators' => array(

                         ),
                     ));



            $inputFilter->add(array(
                         'name'     => 'content',
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


             $this->inputFilter = $inputFilter;
         }
        return $this->inputFilter;
        // $this->inputFilter ;
         
     }
 }
