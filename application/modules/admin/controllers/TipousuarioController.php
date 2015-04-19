<?php

class Admin_TipousuarioController extends Util_Controller_Action2
{
	public function init()
    {
    	parent::init();
    	$this->Model = new Model_Tipousuario();
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();    	
    }

 	public function insertAction() 
    {    	
        $this->view->dadospagina = null;	
    	$this->view->nmFormulario = "Adicionar Tipo de Usuario";
    	
		if($this->_request->getParam('id')){
	    	$dadospagina = $this->Model->find($this->_request->getParam('id'));
	    	$this->view->dadospagina = $dadospagina[0];
	    	$this->view->nmFormulario = "Alterar Tipo de Usuario";
		}
		
		$this->view->usuario = $this->iduser->nome;
		$this->view->user = $this->iduser->idusuarios;
		
		if($this->_request->isPost())
		{	
			$post = $this->_request->getPost();		
			// Alteracao
			if($this->_request->getParam('idtipo_usuario')!='')
			{						
				$dados = array(
					'tipo_usuario'  => $post["tipo_usuario"],
					'idExclusao' => null,
					'cdUserA'    => $this->iduser->idusuarios,
					'dtUserA'    => date('d/m/Y'),
					'hmUserA'    => date('His'),
					'cdUserE'    => null,
				    'dtUserE'    => null,
				    'hmUserE'    => null,
				);
				
				$update = $this->Model->update($dados,$post['idtipo_usuario']);
	    		$msg = $update != 0 ? "Registro Atualizado com sucesso!" : "Erro ao atualizar registro";
				$this->view->resposta = $msg;		
									
			} else {
				//Zend_Debug::dump($post);die;
				$insert = $this->Model->save($post);
	    		$msg = $insert != 0 ? "Registro cadastrado com sucesso!" : "Erro ao cadastrar registro";
				$this->view->resposta = $msg;
			}
		}  	
    }
    
    public function alltipousuarioAction()
    {
		$getTipoUsuario = $this->Model->getTipoUsuario();
		
    	$pagina = intval($this->_getParam('pagina', 1));
    	$paginator = Zend_Paginator::factory($getTipoUsuario);
        $paginator->setItemCountPerPage(10);
        $paginator->setPageRange(7);
        $paginator->setCurrentPageNumber($pagina);
       
        $this->view->paginator = $paginator;		
		$this->view->tipousuario = $getTipoUsuario;
		$this->view->usuario = $this->iduser->nome;
    }
    
	public function deleteAction()
    {
    	$post = $this->_request->getParam('id');
			
		$dados = array(
			'idExclusao' => 'E',
			'cdUserE'    => $this->iduser->idusuarios,
			'dtUserE'    => date('d/m/Y'),
			'hmUserE'    => date('His'),
		);
		
		$delete = $this->Model->update($dados, $post['idtipo_usuario']);
    	$msg = $delete != 0 ? "Registro excluido com sucesso!" : "Erro ao excluir registro";
		$this->view->resposta = $msg;
		$this->_redirect('admin/tipousuario/alltipousuario');	    	  			
    }
}