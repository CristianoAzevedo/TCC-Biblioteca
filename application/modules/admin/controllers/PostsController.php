<?php

class Admin_PostsController extends Util_Controller_Action2
{
	private $chave;
	private $tabela;
	
    public function init()
    {
    	parent::init();
    	$this->Model = new Model_Posts();
    	$StatusRegistro = new Model_StatusRegistro();      	
    	$this->view->status = $StatusRegistro->getStatus();
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();
    	$this->chave = 'idposts';
    	$this->tabela = 'Posts';
    }
    
    /**
     * @abstract Insere e atualiza Paginas
     * @var idpaginas
     */
    
    public function insertAction()
    {    
    	$Categorias = new Model_Categorias();
    	$getCategorias = $Categorias->getCategorias();   

    	$this->view->categorias = $getCategorias;    	
    	$this->view->dadospagina = null;	
    	$this->view->nmFormulario = "Adicionar Novo Post";
    	
		if($this->_request->getParam('id')){
	    	$dadospagina = $this->Model->find($this->_request->getParam('id'));
	    	$this->view->dadospagina = $dadospagina[0];
	    	$this->view->nmFormulario = "Alterar Post";
		}
		
		$this->view->usuario = $this->iduser->nome; 
    	    	
		if($this->_request->isPost())
		{			
			// Alteracao
			if($this->_request->getParam('idposts')!='')
			{				
				$post = $this->_request->getPost();
				
				$dados = array(
					'status_registro_idstatus_registro' => $post['status_registro_idstatus_registro'],
					'categorias_idcategorias' => $post['categorias_idcategorias'],
					'titulo' => $post['titulo'],
					'conteudo' => $post['conteudo'],
					'dataalteracao' => date('d/m/Y'),
					'useralteracao' => $this->iduser->idusuarios,
					'ativo' => $post['status_registro_idstatus_registro'] == 4 ? 'N' : 'S' 
				);
				
				$update = $this->Model->update($dados,$post['idposts']);
	    		$msg = $update != 0 ? "Registro Atualizado com sucesso!" : "Erro ao atualizar pagina";
				$this->view->resposta = $msg;	
				$this->view->dadospagina = null;	
									
			} else {
				
				$post = $this->_request->getPost();
				
				$dados = array(
					'usuarios_idusuarios' => $this->iduser->idusuarios,
					'status_registro_idstatus_registro' => $post['status_registro_idstatus_registro'],
					'categorias_idcategorias' => $post['categorias_idcategorias'],
					'titulo' => $post['titulo'],
					'conteudo' => $post['conteudo'],
					'datainclusao' => date('d/m/Y'),
					'userinclusao' => $this->iduser->idusuarios,
					'ativo' => $post['status_registro_idstatus_registro'] == 4 ? 'N' : 'S' 
				);
				
				$insert = $this->Model->save($dados);
	    		$msg = $insert != 0 ? "Registro cadastrado com sucesso!" : "Erro ao cadastrar Item";
				$this->view->resposta = $msg;
			}
		}
		
    }   

    public function allpostsAction()
    {
    	$getEstatisticas = $this->Model->getEstatisticas();
    	$this->view->nmFormulario = "$this->tabela";
		$getPosts = $this->Model->getPosts();
    	$pagina = intval($this->_getParam('pagina', 1));
    	$paginator = Zend_Paginator::factory($getPosts);
        $paginator->setItemCountPerPage(10);
        $paginator->setPageRange(7);
        $paginator->setCurrentPageNumber($pagina);
        $this->view->paginator = $paginator;  		
		$this->view->paginas = $getPosts;
		$this->view->estatisticas = $getEstatisticas->toArray();
		$this->view->usuario = $this->iduser->nome; 
    }
    
    public function deleteAction()
    {		  
    	if($this->_request->getParam('id')!='')
    	{
    		$delete = $this->Model->delete($this->_request->getParam('id'));
    		$msg = $delete != 0 ? "Registro excluido com sucesso!" : "Erro ao cadastrar Item";
			$this->view->resposta = $msg;

			$this->_redirect('admin/posts/allposts');
       	}   	  			
    }

}