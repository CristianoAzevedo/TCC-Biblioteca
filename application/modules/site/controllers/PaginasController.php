<?php

class PaginasController extends Util_Controller_Action
{

    public function init()
    {
    	parent::init();
    }
    
    public function linkAction()
    {    	
    	if ($this->_request->getParams())
    	{
    		$Paginas = new Model_Paginas();
    		$pagina = $Paginas->find($this->_getParam('pg'));
    		 		
    		$this->view->pagina = $pagina[0];
    	}
    }

}

