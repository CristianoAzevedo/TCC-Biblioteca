<?php

class Admin_DevolucaoController extends Util_Controller_Action2
{	
    public function init()
    {
    	parent::init();
    	$this->DevolucaoModel = new Model_DevolucaoItem();
    	$this->EmprestimoModel = new Model_Emprestimo();
    	$this->MultaModel = new Model_Multa();
    	$this->Item = new Model_Item();
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();    	
    }
    
    public function insertAction()
    {  	
		if($this->_request->isPost())
		{
			$idEmprestimo = $this->_getParam('idEmprestimo');			
			
			$valor = array(
				"idEmprestimo"  => $this->_getParam('idEmprestimo'),
				"dataDevolucao" => date('d/m/Y'),
				"horaDevolucao" => date('His'),
				"cdUser"        => $this->iduser->idusuarios,
				"dtUser"        => date('dmY'),
				"hmUser"        => date('His')
			);
			
			$insert = $this->DevolucaoModel->save($valor);
			$result = array('status' => '1');
			$update = $this->EmprestimoModel->update($result,$idEmprestimo);
			$diasAtraso = $this->_getParam('diasAtraso');
			if($diasAtraso > 0)
			{
				$getdevolucao = $this->DevolucaoModel->getDevolucaobyUser($idEmprestimo);
				foreach($getdevolucao as $id2=>$value2)
				{
					$devolucao = $value2['idDevolucao'];
				}
				$valorMulta = $diasAtraso*2;
				
				$resultado = array(
					"idDevolucao" => $devolucao,
					"valor"       => $valorMulta,
					"cdUser"      => $this->iduser->idusuarios,
					"dtUser"      => date('dmY'),
					"hmUser"      => date('His')
				);
			
				$insertMulta = $this->MultaModel->save($resultado);
			}

			$getItembyEmprestimo = $this->Item->getItembyEmprestimo($this->_getParam('idEmprestimo'));
			foreach($getItembyEmprestimo as $id3=>$value3)
			{
				$idItem = $value3['idItem'];
			}
			
		    $result = array('status' => '0');
    	    $update = $this->Item->update($result, $idItem);
		} 

		$getEmprestimo = $this->EmprestimoModel->getEmprestimo();
    	foreach($getEmprestimo AS $id=>$value)
		{
			$dados[$value["idEmprestimo"]]=array(
				'idEmprestimo' => $value['idEmprestimo'],
				'idUsuario'    => $value['idUsuario'],
				'usuarios'     => $value['usuarios'],
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
    	$this->view->nmFormulario = "Devolucao de Item";
		//Zend_Debug::dump($getEmprestimo);die;
    }
}

