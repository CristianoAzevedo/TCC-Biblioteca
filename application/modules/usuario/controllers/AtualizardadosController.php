<?php

class Usuario_AtualizardadosController extends Util_Controller_Action3
{	
    public function init()
    {
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();
    	$this->getHelper('layout')->disableLayout();
    	$this->Model = new Model_Usuarios();
    	$this->Reserva = new Model_ReservaItem();
    	$this->Item = new Model_Item();
    	parent::init();
    }

    public function cadastroAction()
    {   	
    	if($this->_request->isPost())
		{				
			$post = $this->_request->getPost();	
						
			$dados = array(
				'nome'            => $post["nome"],
				'endereco'        => $post["endereco"],
				'telFixo'         => $post["telFixo"],
				'celular'         => $post["celular"],
				'email'           => $post["email"],
				'senha'           => $post["senha"],
				'cdUserA'         => $this->iduser->idusuarios,
				'dtUserA'         => date('d/m/Y'),
				'hmUserA'         => date('His'),
				'idExclusao'      => null,
				'cdUserE'         => null,
				'dtUserE'         => null,
				'hmUserE'         => null,
			);
			
			$update = $this->Model->update($dados,$post['idusuarios']);
    		$msg = $update != 0 ? "Registro Atualizado com sucesso!" : "Erro ao atualizar usuario";
			$this->view->resposta = $msg;
		}
    	
    	$getusuariosByid = $this->Model->getusuariosByid($this->iduser->idusuarios);
    	//Zend_Debug::dump($getusuariosByid);die;
    	$this->view->getusuario = $getusuariosByid;
    	$this->view->usuario = $this->iduser->nome; 
    }
    
}