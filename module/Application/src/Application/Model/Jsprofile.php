<?php
namespace Application\Model;


// Add these import statements

use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;


class Jsprofile implements InputFilterAwareInterface
{
    protected $inputFilter;
    public $profileId;
	public $jsId;
	public $headline;
	public $curDesignation;
	public $curCompanyId;
	public $curLocation;
	public $prefLocation;
	public $functionalArea;
	public $curRole;
	public $industryId;
	public $totExp;
	public $salary;
	public $highestEducation;
	public $keySkils;
	public $dateAdded;
	public $dateModified;

	public function exchangeArray($data)
    {
        $this->profileId = (isset($data['profileId'])) ? $data['profileId'] : null;
		$this->jsId = (isset($data['jsId'])) ? $data['jsId'] : null;
		$this->headline = (isset($data['headline'])) ? $data['headline'] : null;
		$this->curDesignation = (isset($data['curDesignation'])) ? $data['curDesignation'] : null;
		$this->curCompanyId = (isset($data['curCompanyId'])) ? $data['curCompanyId'] : null;
		$this->curLocation = (isset($data['curLocation'])) ? $data['curLocation'] : null;
		$this->prefLocation = (isset($data['prefLocation'])) ? $data['prefLocation'] : null;
		$this->functionalArea = (isset($data['functionalArea'])) ? $data['functionalArea'] : null;
		$this->curRole = (isset($data['curRole'])) ? $data['curRole'] : null;
		$this->industryId = (isset($data['industryId'])) ? $data['industryId'] : null;
		$this->totExp = (isset($data['totExp'])) ? $data['totExp'] : null;
		$this->salary = (isset($data['salary'])) ? $data['salary'] : null;
		$this->highestEducation = (isset($data['highestEducation'])) ? $data['highestEducation'] : null;
		$this->keySkils = (isset($data['keySkils'])) ? $data['keySkils'] : null;
		$this->dateAdded = (isset($data['dateAdded'])) ? $data['dateAdded'] : date('Y-M-d H:i:s');
		$this->dateModified = (isset($data['dateModified'])) ? $data['dateModified'] : date('Y-M-d H:i:s');
	}
	 public function getArrayCopy()
     {
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
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $inputFilter->add(array(
                'name' => 'active',
                //'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(),
            ));
            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }
}