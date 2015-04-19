<?php

class Admin_PaginasController extends Util_Controller_Action2
{
	private $Model_Paginas;
	private $chave;
	private $tabela;
	
    public function init()
    {
    	parent::init();
    	$this->Model = new Model_Paginas();
    	$StatusRegistro = new Model_StatusRegistro();    	
    	$this->view->status = $StatusRegistro->getStatus();
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();
    	$this->chave = 'idpaginas';
    	$this->tabela = 'Pagina';
    }
    
    /**view
     * @abstract Insere e atualiza Paginas
     * @var idpaginas
     */
    
    public function insertAction()
    {    
    	$this->view->dadospagina = null;	
    	$this->view->nmFormulario = "Adicionar Nova $this->tabela";
    	    	
		if($this->_request->getParam('id')){
	    	$dadospagina = $this->Model->find($this->_request->getParam('id'));
	    	$this->view->dadospagina = $dadospagina[0];
	    	$this->view->nmFormulario = "Alterar $this->tabela";
		}

		$this->view->usuario = $this->iduser->nome; 
		$this->view->user = $this->iduser->idusuarios;
		
		if($this->_request->isPost())
		{		
			$post = $this->_request->getPost();	
			// Alteracao
			if($this->_request->getParam('idpaginas')!='')
			{
				$dados = array(
					'status_registro_idstatus_registro' => $post['status_registro_idstatus_registro'],
					'titulo' => $post['titulo'],
					'conteudo' => $post['conteudo'],
					'dataalteracao' => date('d/m/Y'),
					'useralteracao' => $this->iduser->idusuarios,
					'ativo' => $post['status_registro_idstatus_registro'] == 4 ? 'N' : 'S' 
				);
				
				$update = $this->Model->update($dados,$this->_request->getParam('idpaginas'));
	    		$msg = $update != 0 ? "$this->tabela Atualizado com sucesso!" : "Erro ao atualizar $this->tabela";
				$this->view->resposta = $msg;	
				$this->view->dadospagina = null;	
							
			} else {
				
				$insert = $this->Model->save($post);   		
	    		$msg = $insert != 0 ? "$this->tabela cadastrada com sucesso!" : "Erro ao cadastrar $this->tabela";
				$this->view->resposta = $msg;
			}
		}
    }   

    public function allpagesAction()
    {    	
    	$this->view->nmFormulario = "$this->tabela";
		$getPaginas = $this->Model->getPaginas();
		$getEstatisticas = $this->Model->getEstatisticas();
		
    	$pagina = intval($this->_getParam('pagina', 1));
    	$paginator = Zend_Paginator::factory($getPaginas);
        $paginator->setItemCountPerPage(10);
        $paginator->setPageRange(7);
        $paginator->setCurrentPageNumber($pagina);
        $this->view->paginator = $paginator; 		
		$this->view->paginas = $getPaginas;
		$this->view->estatisticas = $getEstatisticas->toArray();
		$this->view->usuario = $this->iduser->nome;
    }
    
    public function deleteAction()
    {		  
    	if($this->_request->getParam('id')!='')
    	{
    		$delete = $this->Model->delete($this->_request->getParam('id'));
    		$msg = $delete != 0 ? "$this->tabela exclu�da com sucesso!" : "Erro ao excluir $this->tabela";
			$this->view->resposta = $msg;
			$this->_redirect('admin/paginas/allpages');
       	}   	  			
    }
    
}