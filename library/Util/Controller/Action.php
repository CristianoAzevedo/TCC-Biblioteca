<?php

class Util_Controller_Action extends Zend_Controller_Action
{
	public function init()
	{		
		//if (Zend_Auth::getInstance()->hasIdentity()) return;
		
		$identity = NULL;
		$identity = new stdClass();
		
		$Model_Paginas = new Model_Paginas();
		$paginas = $Model_Paginas->getPaginasPublicadas();
		
		$identity->sistema = $paginas;
		
		$storage = Zend_Auth::getInstance()->getStorage();
		$storage->write($identity);		
	}
}