<?php

class Admin_CategoriasController extends Util_Controller_Action2
{
	private $Model;
	public $iduser;	
	
    public function init()
    {
    	parent::init();
    	$this->Model = new Model_Categorias();
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();   
    }
    
    /**
     * @abstract Insere e atualiza Categoria
     * @var idcategoria
     */
    
    public function insertAction()
    {       		 	
    	$this->view->dadospagina = null;	
    	$this->view->nmFormulario = "Adicionar Categoria";
    	
    	
		if($this->_request->getParam('id')){
	    	$dadospagina = $this->Model->find($this->_request->getParam('id'));
	    	$this->view->dadospagina = $dadospagina[0];
	    	$this->view->nmFormulario = "Alterar Categoria";
		}
		
		$this->view->usuario = $this->iduser->nome; 
    	    	
		if($this->_request->isPost())
		{			
			// Alteracao
			if($this->_request->getParam('idcategorias')!='')
			{				
				$post = $this->_request->getPost();
				
				$dados = array(
					'nome' => $post['nome'],
					'descricao' => $post['descricao']
				);
				
				$update = $this->Model->update($dados,$post['idcategorias']);
	    		$msg = $update != 0 ? "Registro Atualizado com sucesso!" : "Erro ao atualizar pagina";
				$this->view->resposta = $msg;	
				$this->view->dadospagina = null;	
									
			} else {
				$insert = $this->Model->save($this->_request->getPost());
	    		$msg = $insert != 0 ? "Categoria cadastrada com sucesso!" : "Erro ao cadastrar Categoria";
				$this->view->resposta = $msg;
			}
		}
		
    }   

    public function allcategoriasAction()
    {
		$getCategorias = $this->Model->getCategorias();
    	$pagina = intval($this->_getParam('pagina', 1));
    	$paginator = Zend_Paginator::factory($getCategorias);
        $paginator->setItemCountPerPage(10);
        $paginator->setPageRange(7);
        $paginator->setCurrentPageNumber($pagina);
        $this->view->paginator = $paginator;		
		$this->view->paginas = $getCategorias;
		$this->view->usuario = $this->iduser->nome; 
    }
    
    public function deleteAction()
    {		  
    	if($this->_request->getParam('id')!='')
    	{
    		//die($this->_request->getParam('id')); 
    		$delete = $this->Model->delete($this->_request->getParam('id'));
    		$msg = $delete != 0 ? "Registro excluído com sucesso!" : "Erro ao cadastrar Item";
			$this->view->resposta = $msg;

			//$this->insertAction();
			$this->_redirect('admin/posts/allposts');
       	}   	  			
    }
    


}

