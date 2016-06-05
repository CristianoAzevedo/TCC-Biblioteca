<?php

class Usuario_RenovaremprestimoController extends Util_Controller_Action3
{	
    public function init()
    {
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();
    	$this->getHelper('layout')->disableLayout();
    	$this->Model = new Model_Item();
    	$this->Reserva = new Model_ReservaItem();
    	$this->Item = new Model_Item();
    	$this->Emprestimo = new Model_Emprestimo();
    	$this->Renovar = new Model_RenovaItem();
    	parent::init();
    }

    public function cadastroAction()
    {   
    	//$teste = $this->Renovar->getReservas();
    		
    	if($this->_request->isPost())
		{
	    	$idEmprestimo = $this->_getParam('idEmprestimo'); 
	    	
	    	$result = array(
	    		"idEmprestimo" => $idEmprestimo,
	    		"dataRenovacao" => date('d/m/Y',strtotime("+7 days")),
	    		"horaRenovacao" => date('His')
	    	);
	    	
	    	$this->Renovar->save($result);    	
		}
    	
    	$usuario = $this->iduser->idusuarios;
    	$getEmprestimobyUser = $this->Emprestimo->getEmprestimobyUser($usuario);
    	$dados = null;
    	foreach($getEmprestimobyUser as $value)
		{
			$dados[$value["idEmprestimo"]]=array(
				'idEmprestimo' => $value['idEmprestimo'],
				'idUsuario'    => $value['idUsuario'],
				'idItem'       => $value['idItem'],
				'dataEmprestimo' => $value['dataEmprestimo'],
				'dataPrevistaEntrega' => ($value['dataRenovacao']==null)?$value['dataPrevistaEntrega']:$value['dataRenovacao'],
				'exemplar' => $value['exemplar'],
				'dataRenovacao' => $value['dataRenovacao'],
				'situacao' =>($value['dataRenovacao']==null)? substr($value['dataPrevistaEntrega'], 6,4).substr($value['dataPrevistaEntrega'], 3,2).substr($value['dataPrevistaEntrega'], 0,2) : 
															  substr($value['dataRenovacao'], 6,4).substr($value['dataRenovacao'], 3,2).substr($value['dataRenovacao'], 0,2),
			);
		}
		
    	$this->view->emprestimo = $dados;
    	$this->view->usuario = $this->iduser->nome;
    }
}

