<?php

class Admin_NewslettersController extends Util_Controller_Action2
{
	private $Model;
	public $iduser;	
	
    public function init()
    {
    	parent::init();
    	$this->Model = new Model_Newsletters();
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();   
    }
    
    /**
     * @abstract Insere e atualiza Categoria
     * @var idcategoria
     */
    
    public function insertAction()
    {       	   	
    	$this->view->dadospagina = null;	
    	$this->view->nmFormulario = "Adicionar Newsletter";
    	
    	
		if($this->_request->getParam('id')){
	    	$dadospagina = $this->Model->find($this->_request->getParam('id'));
	    	$this->view->dadospagina = $dadospagina[0];
	    	$this->view->nmFormulario = "Alterar Newsletter";
		}
		
		$this->view->usuario = $this->iduser->nome; 
    	    	
		if($this->_request->isPost())
		{			
			// Alteracao
			if($this->_request->getParam('idnewsletters')!='')
			{				
				$post = $this->_request->getPost();
				
				$dados = array(
					'nome' => $post['nome'],
					'email' => $post['email']
				);
				
				$update = $this->Model->update($dados,$post['idnewsletters']);
	    		$msg = $update != 0 ? "Registro Atualizado com sucesso!" : "Erro ao atualizar newsletter";
				$this->view->resposta = $msg;	
				$this->view->dadospagina = null;	
									
			} else {
				$insert = $this->Model->save($this->_request->getPost());
	    		$msg = $insert != 0 ? "Newsletter cadastrada com sucesso!" : "Erro ao cadastrar Newsletter";
				$this->view->resposta = $msg;
			}
		}
		
    }   

    public function allnewslettersAction()
    {
		$getNewsletters = $this->Model->getNewsletters();
    	$pagina = intval($this->_getParam('pagina', 1));
    	$paginator = Zend_Paginator::factory($getNewsletters);
        $paginator->setItemCountPerPage(10);
        $paginator->setPageRange(7);
        $paginator->setCurrentPageNumber($pagina);
        $this->view->paginator = $paginator;		
		$this->view->newsletters = $getNewsletters;
		$this->view->usuario = $this->iduser->nome;
    }
    
    public function deleteAction()
    {		  
    	if($this->_request->getParam('id')!='')
    	{
    		//die($this->_request->getParam('id')); 
    		$delete = $this->Model->delete($this->_request->getParam('id'));
    		$msg = $delete != 0 ? "Registro exclu�do com sucesso!" : "Erro ao cadastrar Item";
			$this->view->resposta = $msg;

			//$this->insertAction();
			$this->_redirect('admin/newsletters/allnewsletters');
       	}   	  			
    }
    


}

