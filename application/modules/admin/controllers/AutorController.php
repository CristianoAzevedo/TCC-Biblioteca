<?php

class Admin_AutorController extends Util_Controller_Action2
{	
    public function init()
    {
    	parent::init();
    	$this->Model = new Model_Autor();
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();    	
    }
    
    public function insertAction() 
    {    	
        $this->view->dadospagina = null;	
    	$this->view->nmFormulario = "Adicionar Autor";
    	
		if($this->_request->getParam('id')){
	    	$dadospagina = $this->Model->find($this->_request->getParam('id'));
	    	$this->view->dadospagina = $dadospagina[0];
	    	$this->view->nmFormulario = "Alterar Autor";
		}
		
		$this->view->usuario = $this->iduser->nome; 
    	    	
		if($this->_request->isPost())
		{			
			// Alteracao
			if($this->_request->getParam('idAutor')!='')
			{				
				$post = $this->_request->getPost();			
				$dados = array(
					'nomeAutor'  => $post["nomeAutor"],
					'idExclusao' => null,
					'cdUserA'    => $this->iduser->idusuarios,
					'dtUserA'    => date('d/m/Y'),
					'hmUserA'    => date('His'),
					'cdUserE'    => null,
				    'dtUserE'    => null,
				    'hmUserE'    => null,
				);
				
				$update = $this->Model->update($dados,$post['idAutor']);
	    		$msg = $update != 0 ? "Registro Atualizado com sucesso!" : "Erro ao atualizar registro";
				$this->view->resposta = $msg;		
									
			} else {
				
				$post = $this->_request->getPost();
				$dados = array(
					'nomeAutor'=> $post["nomeAutor"],
					'cdUser'   => $this->iduser->idusuarios,
					'dtUser'   => date('d/m/Y'),
					'hmUser'   => date('His'),
				);
				
				$insert = $this->Model->save($dados);
	    		$msg = $insert != 0 ? "Registro cadastrado com sucesso!" : "Erro ao cadastrar registro";
				$this->view->resposta = $msg;
			}
		}  	
    }
    
    public function allautoresAction()
    {
		$getAutores = $this->Model->getAutores();
				
    	$pagina = intval($this->_getParam('pagina', 1));
    	$paginator = Zend_Paginator::factory($getAutores);
        $paginator->setItemCountPerPage(10);
        $paginator->setPageRange(7);
        $paginator->setCurrentPageNumber($pagina);
       
        $this->view->paginator = $paginator;		
		$this->view->autor = $getAutores;
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
		
		$delete = $this->Model->update($dados, $post['idAutor']);
    	$msg = $delete != 0 ? "Registro excluido com sucesso!" : "Erro ao excluir registro";
		$this->view->resposta = $msg;
		$this->_redirect('admin/autor/allautores');	    	  			
    }
}

