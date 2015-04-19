<?php

class Admin_PerfilController extends Util_Controller_Action2
{	
    public function init()
    {
    	parent::init();
    	$this->Model = new Model_Perfis();
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();    	
    }

 	public function insertAction() 
    {    
    		
        $this->view->dadospagina = null;	
    	$this->view->nmFormulario = "Adicionar Perfil de Usuario";
    	
		if($this->_request->getParam('id')){
	    	$dadospagina = $this->Model->find($this->_request->getParam('id'));
	    	$this->view->dadospagina = $dadospagina[0];
	    	$this->view->nmFormulario = "Alterar Perfil de Usuario";
		}
    	    	
		$this->view->usuario = $this->iduser->nome; 
		
		if($this->_request->isPost())
		{			
			// Alteracao
			if($this->_request->getParam('idperfis')!='')
			{				
				$post = $this->_request->getPost();			
				$dados = array(
					'nome'      => $post["nome"],
					'descricao' => $post["descricao"],
					'ativo'     => "S",
				);
				
				$update = $this->Model->update($dados,$post['idperfis']);
	    		$msg = $update != 0 ? "Registro Atualizado com sucesso!" : "Erro ao atualizar registro";
				$this->view->resposta = $msg;		
									
			} else {
				
				$post = $this->_request->getPost();
				$dados = array(
					'nome'      => $post["nome"],
					'descricao' => $post["descricao"],
					'ativo'     => "S",
				);
				
				$insert = $this->Model->save($dados);
	    		$msg = $insert != 0 ? "Registro cadastrado com sucesso!" : "Erro ao cadastrar registro";
				$this->view->resposta = $msg;
			}
		}  	
    }
    
    public function allperfilAction()
    {
		$getPerfis = $this->Model->getPerfis();

    	$pagina = intval($this->_getParam('pagina', 1));
    	$paginator = Zend_Paginator::factory($getPerfis);
        $paginator->setItemCountPerPage(10);
        $paginator->setPageRange(7);
        $paginator->setCurrentPageNumber($pagina);
       
        $this->view->paginator = $paginator;		
		$this->view->perfil = $getPerfis;
		$this->view->usuario = $this->iduser->nome;
    }
    
	public function deleteAction()
    {
    	$post = $this->_request->getParam('id');
			
		$dados = array(
			'ativo' => 'N',
			
		);
		
		$delete = $this->Model->update($dados, $post['idperfis']);
    	$msg = $delete != 0 ? "Registro excluido com sucesso!" : "Erro ao excluir registro";
		$this->view->resposta = $msg;
		$this->_redirect('admin/perfil/allperfil');	    	  			
    }
}