<?php

class Util_Controller_Action2 extends Zend_Controller_Action
{
	public $userInfo;
	
	public function init()
	{			
		$this->_helper->layout()->setLayout('admin/layoutadmin');	
		
		if (!Zend_Auth::getInstance()->hasIdentity()) {
			$this->userInfo = Zend_Auth::getInstance()->getStorage()->read();
			$this->view->iduser = Zend_Auth::getInstance()->getStorage()->read();
			
		}	
	}
}