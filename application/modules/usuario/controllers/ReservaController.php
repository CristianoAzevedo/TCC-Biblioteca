<?php

class Usuario_ReservaController extends Util_Controller_Action3
{	
    public function init()
    {
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();
    	$this->getHelper('layout')->disableLayout();
    	$this->Reserva = new Model_ReservaItem();
    	$this->Item = new Model_Item();
    	parent::init();
    }

    public function cadastroAction()
    {   	
    	$getItem = $this->Item->getItem();
    	
    	foreach($getItem as $value)
    	{
    		$itens[$value["idItem"]]=array(
    			'idItem'=> $value["idItem"],
    			'idAutor'=> $value["idAutor"], 
		      	'idEditora'=> $value["idEditora"],
		      	'idCategoria'=> $value["idCategoria"],
		      	'idSegmento'=> $value["idSegmento"],
		      	'cidade'=> $value["cidade"],
		      	'nmItem'=> $value["nmItem"],
		      	'ano' => $value["ano"],
		      	'ISBN'=> $value["ISBN"],
		      	'edicao'=> $value["edicao"],
		      	'dtEdicao' => $value["dtEdicao"],
		      	'nrPaginas'=> $value["nrPaginas"],
		      	'status'=> $value["status"],
		      	'idExclusao'=> $value["idExclusao"],
		      	'nomeAutor'=> $value["nomeAutor"],
		      	'nomeEditora'=> $value["nomeEditora"],
		      	'nomeCategoria'=> $value["nomeCategoria"],
		      	'nomeSegmento'=> $value["nomeSegmento"],	
    		);
    	}
    	
    
    	if($this->_request->isPost())
    	{
    		$post = $this->_request->getPost();
    		
    		$dados = array(
    			'idUsuarios'   => $this->iduser->idusuarios,
    			'idItem'       => $post['idItem'],
    			'data_reserva' => date('d/m/Y'),
    			'Hora_reserva' => date('His'),
    			'dataLimite'   => date('dmY',strtotime("+1 days")),
    			'horaLimite'   => date('His'),
    			'status'       => '1'
    		);
    		
    		$result = array('status' => '1');
	     	$insert = $this->Reserva->save($dados);
	     	$this->Item->update($result, $post['idItem']);
		    $msg = $insert != 0 ? "Registro cadastrado com sucesso!" : "Erro ao cadastrar registro";
			//die($msg);
                    echo $msg;
    	}
    	
    	$this->view->usuario = $this->iduser->nome; 
    	$this->view->item = $itens;
    }
    
    public function deletareservaAction()
    {
    	if ($this->_request->isPost())
    	{
    		$post = $this->_request->getParams();
    		foreach($post as $value){    		
    	    			
    			$result = array('status' => '0');
    			$update = $this->Reserva->update($result, $value['idReserva']);
    			$update = $this->Item->update($result, $value['idItem']);
    		}
    		
    		$this->render('mensagem');
    	}
    }
}

