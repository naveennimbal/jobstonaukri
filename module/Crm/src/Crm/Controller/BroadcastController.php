<?php

namespace Crm\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;
use Zend\Validator\File\Size;
use Zend\Mail\Message;
use Zend\Mail\Transport\Smtp as SmtpTransport;
use Zend\Mime\Message as MimeMessage;
use Zend\Mime\Part as MimePart;
use Zend\Mail\Transport\SmtpOptions;



class BroadcastController extends AbstractActionController
{
    protected $industryTable;


    public function getIndustryTable() {
        if (!$this->industryTable) {
            $sm = $this->getServiceLocator();
            $this->industryTable = $sm->get('\Crm\Model\IndustryTable');
        }
        return $this->industryTable;
    }




    public function indexAction()
    {
       $industries = $this->getIndustries();

        return new ViewModel(array('industries'=>$industries));

    }

    public function processAction(){
        $request = $this->getRequest();
        $error = array();
        if($this->getRequest()->isPost()){
            $nonFile = $request->getPost()->toArray();
            $File    = $this->params()->fromFiles('resume');
            //print_r($File);

            $size  = new Size(array("max"=>2048000));
            $adapter = new \Zend\File\Transfer\Adapter\Http();
            $adapter->setValidators(array($size), $File['name']);
            if (!$adapter->isValid()){
                $dataError = $adapter->getMessages();

                foreach($dataError as $key=>$row)
                {
                    $error[] = $row;
                }
                //$form->setMessages(array('fileupload'=>$error ));
            } else {
                //echo RESUME_DIR_PATH; exit;
                $adapter->setDestination(RESUME_DIR_PATH);
               // var_dump($adapter->receive($File['name'])); exit;
                if (move_uploaded_file($File['tmp_name'],RESUME_DIR_PATH.$File['name'])) {
                    if($this->sendBroadcastMail()){

                        echo "mail sent"; exit;
                    }
                //if ($adapter->receive($File['name'])) {

                    //echo "Resume Uploaded"; exit;
                } else {
                    $error[] = "Something went wrong with the file upload  ";
                }
            }

            $industries = $this->getIndustries();
            return new ViewModel(array('industries'=>$industries,"error"=>$error));

        }

    }

    private function sendBroadcastMail($to=array(),$from,$fromName="",$replyTo,$replyName="",$subject,$htmlText){

        $message = new Message();
        foreach($to as $emailAdd ){
            $message->addTo($emailAdd);
        }


            //->addFrom('broadcast@jobstonaukri.com')
        $message->addReplyTo($replyTo);
        $message->setSubject($subject);
        $message->setFrom($from);

// Setup SMTP transport using LOGIN authentication
        $transport = new SmtpTransport();



        $options   = new SmtpOptions(array(
            'host'              => 'md-in-34.webhostbox.net',
            'connection_class'  => 'login',
            'connection_config' => array(
                'ssl'       => 'ssl',
                'username' => 'broadcast@jobstonaukri.com',
                'password' => 'naveen'
            ),
            'port' => 465,
        ));



        $html = new MimePart($htmlText);
        $html->type = "text/html";

        $body = new MimeMessage();
        $body->addPart($html);

        $message->setBody($body);

        $transport->setOptions($options);
        $transport->send($message);
        return;

    }




    public function confirmAction(){
        $request = $this->getRequest();
        $result = array();
        $count = 0;
        if($request->isPost()){
            $email = $request->getPost('email');
            $mobile = $request->getPost('mobile');

            $result = $this->getCartTable()->getPaymentStatus($email,$mobile);

            return new ViewModel(array("result"=>$result,"count"=>$count));
        }

        return new ViewModel(array("result"=>$result,"count"=>$count));

    }
    public function getIndustries(){
        $cj_mast_industry = array(
            array('Ind_Code' => '2','Ind_Desc' => 'Accounting / Audit / Tax Services','Disp_Order' => '1'),
            array('Ind_Code' => '3','Ind_Desc' => 'Advertising / Event Management / PR / MR','Disp_Order' => '2'),
            array('Ind_Code' => '4','Ind_Desc' => 'Agriculture / Dairy / Fishing','Disp_Order' => '3'),
            array('Ind_Code' => '6','Ind_Desc' => 'Architecture / Interior Design','Disp_Order' => '4'),
            array('Ind_Code' => '7','Ind_Desc' => 'Automotive / Ancillaries','Disp_Order' => '5'),
            array('Ind_Code' => '8','Ind_Desc' => 'Banking & Financial Services','Disp_Order' => '6'),
            array('Ind_Code' => '16','Ind_Desc' => 'BPO / KPO / ITES / CRM / Transcription / E Learning','Disp_Order' => '7'),
            array('Ind_Code' => '10','Ind_Desc' => 'Chemicals / Polymer / Plastic / Rubber','Disp_Order' => '8'),
            array('Ind_Code' => '11','Ind_Desc' => 'Computer Hardware','Disp_Order' => '9'),
            array('Ind_Code' => '12','Ind_Desc' => 'Construction / Cement / Metals','Disp_Order' => '10'),
            array('Ind_Code' => '14','Ind_Desc' => 'Consulting / Market Research','Disp_Order' => '11'),
            array('Ind_Code' => '15','Ind_Desc' => 'Courier / Freight / Transportation','Disp_Order' => '12'),
            array('Ind_Code' => '17','Ind_Desc' => 'Data Processing Services','Disp_Order' => '13'),
            array('Ind_Code' => '18','Ind_Desc' => 'Education / Training','Disp_Order' => '14'),
            array('Ind_Code' => '21','Ind_Desc' => 'Employment Services / Recruitment Services','Disp_Order' => '15'),
            array('Ind_Code' => '22','Ind_Desc' => 'Engineering Services','Disp_Order' => '16'),
            array('Ind_Code' => '23','Ind_Desc' => 'Entertainment / Media / Publishing','Disp_Order' => '17'),
            array('Ind_Code' => '24','Ind_Desc' => 'Fashion / Beauty / Fitness / Accessories','Disp_Order' => '18'),
            array('Ind_Code' => '49','Ind_Desc' => 'Fertilizer/ Pesticides','Disp_Order' => '19'),
            array('Ind_Code' => '13','Ind_Desc' => 'FMCG / Consumer Durables','Disp_Order' => '20'),
            array('Ind_Code' => '25','Ind_Desc' => 'Food & Beverages','Disp_Order' => '21'),
            array('Ind_Code' => '1','Ind_Desc' => 'Fresh Graduate/ No Industry Experience','Disp_Order' => '22'),
            array('Ind_Code' => '50','Ind_Desc' => 'Gems & Jewellery','Disp_Order' => '23'),
            array('Ind_Code' => '51','Ind_Desc' => 'Government/ PSU/ Defence','Disp_Order' => '24'),
            array('Ind_Code' => '26','Ind_Desc' => 'Health Care / Medical Services / Hospitals','Disp_Order' => '25'),
            array('Ind_Code' => '27','Ind_Desc' => 'Hospitality / Airlines / Travel / Tourism','Disp_Order' => '26'),
            array('Ind_Code' => '52','Ind_Desc' => 'Import / Export','Disp_Order' => '27'),
            array('Ind_Code' => '28','Ind_Desc' => 'Information Technology','Disp_Order' => '28'),
            array('Ind_Code' => '29','Ind_Desc' => 'Insurance','Disp_Order' => '29'),
            array('Ind_Code' => '30','Ind_Desc' => 'Internet / Dotcom','Disp_Order' => '30'),
            array('Ind_Code' => '31','Ind_Desc' => 'Leather','Disp_Order' => '31'),
            array('Ind_Code' => '32','Ind_Desc' => 'Legal / Law','Disp_Order' => '32'),
            array('Ind_Code' => '33','Ind_Desc' => 'Logistics / Supply Chain','Disp_Order' => '33'),
            array('Ind_Code' => '34','Ind_Desc' => 'Manufacturing / Industrial / Production/ Machinery','Disp_Order' => '34'),
            array('Ind_Code' => '36','Ind_Desc' => 'NGO / Social Services','Disp_Order' => '35'),
            array('Ind_Code' => '37','Ind_Desc' => 'Office Supplies / Office Maintenance','Disp_Order' => '36'),
            array('Ind_Code' => '48','Ind_Desc' => 'Others','Disp_Order' => '37'),
            array('Ind_Code' => '53','Ind_Desc' => 'Paints','Disp_Order' => '38'),
            array('Ind_Code' => '38','Ind_Desc' => 'Paper','Disp_Order' => '39'),
            array('Ind_Code' => '39','Ind_Desc' => 'Petroleum / Oil & Gases / Energy & Utilities','Disp_Order' => '40'),
            array('Ind_Code' => '40','Ind_Desc' => 'Pharmaceuticals / Biotechnology / Clinical Research','Disp_Order' => '41'),
            array('Ind_Code' => '54','Ind_Desc' => 'Printing / Packaging','Disp_Order' => '42'),
            array('Ind_Code' => '41','Ind_Desc' => 'Real Estate / Property','Disp_Order' => '43'),
            array('Ind_Code' => '42','Ind_Desc' => 'Retail / Wholesale','Disp_Order' => '44'),
            array('Ind_Code' => '43','Ind_Desc' => 'Security / Protection Services','Disp_Order' => '45'),
            array('Ind_Code' => '20','Ind_Desc' => 'Semiconductors & Electrical','Disp_Order' => '46'),
            array('Ind_Code' => '44','Ind_Desc' => 'Shipping / Marine','Disp_Order' => '47'),
            array('Ind_Code' => '45','Ind_Desc' => 'Telecom / ISP','Disp_Order' => '48'),
            array('Ind_Code' => '55','Ind_Desc' => 'Textile / Garments','Disp_Order' => '49'),
            array('Ind_Code' => '47','Ind_Desc' => 'Warehousing','Disp_Order' => '50'),
            array('Ind_Code' => '56','Ind_Desc' => 'Wood and Fibre','Disp_Order' => '51')
        );
        return $cj_mast_industry;

    }
}
