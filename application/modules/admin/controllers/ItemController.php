<?php

class Admin_ItemController extends Util_Controller_Action2
{	
    public function init()
    {
    	parent::init();
    	$this->Model = new Model_Item();
    	$this->AutorModel = new Model_Autor();
    	$this->EditoraModel = new Model_Editora();
    	$this->CategoriaModel = new Model_Categoria();
    	$this->SegmentoModel = new Model_Segmento();
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();    	
    }
    
    public function insertAction()
    {
    	$getAutores = $this->AutorModel->getAutores();
		$getEditora = $this->EditoraModel->getEditora();
		$getCategoria = $this->CategoriaModel->getCategoria();
		$getSegmento = $this->SegmentoModel->getSegmento();
		
		$this->view->autores = $getAutores;
		$this->view->editora = $getEditora;
		$this->view->categoria = $getCategoria;
		$this->view->segmento = $getSegmento;
		$this->view->usuario = $this->iduser->nome; 
		
        $this->view->dadospagina = null;	
    	$this->view->nmFormulario = "Adicionar Item no Acervo";
    	
		if($this->_request->getParam('id')){
	    	$dadospagina = $this->Model->find($this->_request->getParam('id'));
	    	$this->view->dadospagina = $dadospagina[0];
	    	$this->view->nmFormulario = "Alterar Item do Acervo";
		}
    	    	
		if($this->_request->isPost())
		{			
			// Alteracao
			if($this->_request->getParam('idItem')!='')
			{				
				$post = $this->_request->getPost();
				$post['idExclusao'] = null;
				$post['cdUserA'] = $this->iduser->idusuarios;
				$post['dtUserA'] = date('d/m/Y');
				$post['hmUserA'] = date('His');
				$post['cdUserE'] = null;
			    $post['dtUserE'] = null;
			    $post['hmUserE'] = null;
				
				$update = $this->Model->update($post,$post['idItem']);
	    		$msg = $update != 0 ? "Registro Atualizado com sucesso!" : "Erro ao atualizar Acervo";
				$this->view->resposta = $msg;		
									
			} else {
				$post = $this->_request->getPost();
				$post['cdUser'] = $this->iduser->idusuarios;
				$post['dtUser'] = date('d/m/Y');
				$post['dtUser'] = date('His');
				$insert = $this->Model->save($post);
	    		$msg = !empty($insert) ? "Acervo cadastrado com sucesso!" : "Erro ao cadastrar";
				$this->view->resposta = $msg;
			}
		} 	
    }
    
    public function allitemAction()
    {
		$getItem = $this->Model->getItembyAdmin();
		
    	$pagina = intval($this->_getParam('pagina', 1));
    	$paginator = Zend_Paginator::factory($getItem);
        $paginator->setItemCountPerPage(10);
        $paginator->setPageRange(7);
        $paginator->setCurrentPageNumber($pagina);
               
        $this->view->paginator = $paginator;		
		$this->view->item = $getItem;
		$this->view->usuario = $this->iduser->nome;
    }
    
	public function deleteAction()
    {
    	$post = $this->_request->getParam('id');
		$dados = array(
			'idExclusao'      => 'E',
			'cdUserE'         => $this->iduser->idusuarios,
			'dtUserE'         => date('d/m/Y'),
			'hmUserE'         => date('His'),			
		);
			
		$delete = $this->Model->update($dados, $post['idItem']);
    	$msg = $delete != 0 ? "Registro excluido com sucesso!" : "Erro ao excluir registro";
		$this->view->resposta = $msg;
		$this->_redirect('admin/item/allitem');	    	  			
    }
}

