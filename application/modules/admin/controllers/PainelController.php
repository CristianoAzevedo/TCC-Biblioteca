<?php

class Admin_PainelController extends Util_Controller_Action2
{	
	public $userInfo;
	
    public function init()
    {
    	parent::init();
    	$this->view->userInfo = Zend_Auth::getInstance()->getStorage()->read();   
    }

    public function indexAction()
    {   	   	
    }
}