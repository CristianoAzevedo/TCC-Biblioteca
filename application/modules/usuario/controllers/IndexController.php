<?php

class Usuario_IndexController extends Util_Controller_Action3
{	
    public function init()
    {
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();
    	$this->getHelper('layout')->disableLayout();
    	$this->Reserva = new Model_ReservaItem();
    	$this->Item = new Model_Item();
    	$this->Emprestimo = new Model_Emprestimo();
    	$this->Multa = new Model_Multa();
    	parent::init();
    }

    public function indexAction()
    {   
    	$getreserva = $this->Reserva->getReservas();
    
    	foreach($getreserva as $id=>$value)
    	{    		
    		if($value['dataLimite'].' '.$value['horaLimite'] <= date('dmY His')&& $value['status']!=0)
    		{    			
    			$result = array('status' => '0');
    			$update = $this->Reserva->update($result, $value['idReserva']);
    			$update = $this->Item->update($result, $value['idItem']);
    		}
    		
    		$this->view->status = $value['status'];
    	}
    	
    	$usuario = $this->iduser->idusuarios;
    	$getReservaById = $this->Reserva->getReservaById($usuario);
    	
    	$getEmprestimobyUser = $this->Emprestimo->getEmprestimobyUser($usuario);
    	$dados = null;
    	foreach($getEmprestimobyUser AS $id=>$value)
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
		
		$result = null;
		$getMultas = $this->Multa->getMultabyUser($usuario);
		foreach ($getMultas as $value2)
		{
			$result[] = array(
				'idMulta' => $value2['idMulta'],
				'valor'   => $value2['valor'],
				'dataDevolucao' => $value2['dataDevolucao'],
			);
		}
		
    	$this->view->multa = $result;
    	$this->view->usuario = $this->iduser->nome; 
    	$this->view->reserva = $getReservaById;
    	$this->view->emprestimo = $dados;
    }    
}