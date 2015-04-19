<?php

class NewslettersController extends Util_Controller_Action
{

    public function init()
    {
    	parent::init();
    }
    
    public function insertAction()
    {    	
    	$this->getHelper('layout')->disableLayout();
    	
    	if ($this->_request->isPost())
    	{    		
    		$Newsletters = new Model_Newsletters();
    		$find = $Newsletters->getnewsByemail($_POST['email']);

    		if (count($find)>0) {
    			$response = 'Email existente!';
    		} else {
    			$insert = $Newsletters->save($this->_request->getPost());
    			$response = $insert ? "Email cadastrado!" : "error";    			
    		}
    		
    		$this->view->response = $response;
    	}
    }

}

