<?php

class Admin_MultaController extends Util_Controller_Action2
{	
    public function init()
    {
    	parent::init();
    	$this->MultaModel = new Model_Multa();
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();    	
    }
    
    public function listagemAction()
    {
    	$getMulta = $this->MultaModel->getMulta();	
    	
    	$result = null;
    	foreach($getMulta as $value)
    	{
    		$result[]= array(
    			'idMulta' => $value['idMulta'],
    			'nome'    => $value['nome'],
    			'data'    => $value['dataDevolucao'],
    			'valor'   => $value['valor']
    		);
    	}
    	
    	$this->view->multa = $result;
		$this->view->usuario = $this->iduser->nome; 	
    	$this->view->nmFormulario = "Multas Registradas";
    }
}

