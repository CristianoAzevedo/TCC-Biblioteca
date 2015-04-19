<?php

class Util_Controller_Action3 extends Zend_Controller_Action
{
	public $userInfo;
	
	public function init()
	{			
		$this->_helper->layout()->setLayout('usuario/layoutusuario');	
	}
}