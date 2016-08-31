<?php
/**
 * Created by PhpStorm.
 * User: naveen
 * Date: 13/01/16
 * Time: 5:16 AM
 */

namespace Application\Model;


// Add these import statements
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;



class Cart implements InputFilterAwareInterface
{

    protected $inputFilter;
    public $cartId;
    public $userId;
    //public $url;
    public $serviceId;
    public $dateAdded;
    public $status;


    public function exchangeArray($data)
    {
        $this->cartId     = (isset($data['cartId'])) ? $data['cartId'] : null;
        $this->userId     = (isset($data['userId'])) ? $data['userId'] : null;
        $this->serviceId     = (isset($data['serviceId'])) ? $data['serviceId'] : null;


        $this->dateAdded   = (isset($data['dateAdded'])) ? $data['dateAdded']  : date('Y-M-d H:i:s');
        $this->status   = (isset($data['status'])) ? $data['status']  : null;

    }

    public function getArrayCopy(){
        return get_object_vars($this);
    }


    public function setInputFilter(InputFilterInterface $inputFilter)
    {
        throw new \Exception("Not used");
    }


    public function getInputFilter()
    {
        if (!$this->inputFilter) {
            $inputFilter = new InputFilter();
            $factory = new InputFactory();

            $inputFilter->add(array(
                'name'     => 'cartId',
                //'required' => true,
                'filters'  => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(

                ),
            ));
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
                'name'     => 'serviceId',
                //'required' => true,
                'filters'  => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(

                ),
            ));


            $inputFilter->add(array(
                'name'     => 'serviceOptionId',
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
    }

}