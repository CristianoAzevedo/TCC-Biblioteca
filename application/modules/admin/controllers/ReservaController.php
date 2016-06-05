<?php

class Admin_ReservaController extends Util_Controller_Action2
{	
    public function init()
    {
    	parent::init();
    	$this->Reserva = new Model_ReservaItem();
    	$this->Emprestimo = new Model_Emprestimo();
    	$this->Item = new Model_Item();
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();    	
    }
    
    public function listagemAction()
    {    	
    	if ($this->_request->isPost())
    	{
    		$post = $this->_request->getParams();
    		$dados = array(
    			'idUsuario'           => $post['idUsuarios'],
    			'idItem'              => $post['idItem'],
    			'dataEmprestimo'      => date('d/m/Y'),
    			'horaEmprestimo'      => date('His'),
    			'dataPrevistaEntrega' => date('d/m/Y',strtotime("+7 days")),
    			'horaPrevistaEntrega' => date('His')
    		);
    		
    		$result = array('status' => '0');
    		$result2 = array('status' => '2');
    		$this->Emprestimo->save($dados);
    		$this->Reserva->update($result, $post['idReserva']);
    		$this->Item->update($result2, $post['idItem']);
    	}
    	
    	$getAllReservas = $this->Reserva->getAllReservas();
    	
    	foreach($getAllReservas as $value)
    	{
    		$this->view->status = $value['status'];	
    	}
    	
    	$this->view->reserva = $getAllReservas;
    	$this->view->usuario = $this->iduser->nome;
    }
}