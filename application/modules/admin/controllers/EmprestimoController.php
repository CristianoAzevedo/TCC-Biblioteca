<?php

class Admin_EmprestimoController extends Util_Controller_Action2
{	
    public function init()
    {
    	parent::init();
    	$this->Model = new Model_Emprestimo();
    	$this->Item = new Model_Item();
    	$this->Usuario = new Model_Usuarios();
    	$this->AutorModel = new Model_Autor();
    	$this->EditoraModel = new Model_Editora();
    	$this->CategoriaModel = new Model_Categoria();
    	$this->SegmentoModel = new Model_Segmento();
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();    	
    }
    
    public function insertAction()
    {
    	/*
		// Somente o texto a ser escrito é necessário
		$barcodeOptions = array('text' => 'RICARDO-ALEXANDRE');
		
		// Não há opções necessárias
		$rendererOptions = array();
		
		// Desenha o código de barras em uma nova imagem,
		// enviar os cabeçalhos e a imagem
		Zend_Barcode::factory(
		    'code39', 'image', $barcodeOptions, $rendererOptions
		)->render();die;
    	*/
    	$this->view->nmFormulario = "Realizar Emprestimo";
    	$this->view->usuario = $this->iduser->nome;
    	
   		if ($this->_request->isPost())
    	{
    		$post = $this->_request->getParams();
    		$dados = array(
    			'idUsuario'           => $post['idUsuarios'],
    			'idItem'              => $post['idItem'],
    			'dataEmprestimo'      => date('d/m/Y'),
    			'horaEmprestimo'      => date('His'),
    			'dataPrevistaEntrega' => date('d/m/Y',strtotime("+7 days")),
    			'horaPrevistaEntrega' => date('His')
    		);
    		
    		$result = array('status' => '2');
    		$emprestimo = $this->Model->save($dados);
    		$this->Item->update($result, $post['idItem']);
    		$msg = !empty($emprestimo) ? "Empréstimo cadastrado com sucesso!" : "Erro ao cadastrar";
			$this->view->resposta = $msg;
    	}	
    }
    
    public function allemprestimoAction()
    {
		$getEmprestimo = $this->Model->getEmprestimo();		
		$dados='';
		
		foreach($getEmprestimo as $value)
		{
			$dados[$value["idEmprestimo"]]=array(
				'idEmprestimo' => $value['idEmprestimo'],
				'idUsuario'    => $value['idUsuario'],
				'usuarios'     => $value['usuarios'],
				'idItem'       => $value['idItem'],
				'dataEmprestimo' => $value['dataEmprestimo'],
				'dataPrevistaEntrega' => ($value['dataRenovacao']==null)?$value['dataPrevistaEntrega']:$value['dataRenovacao'],
				'exemplar' => $value['exemplar'],
				'dataRenovacao' => $value['dataRenovacao'],
				'situacao' =>($value['dataRenovacao']==null)? substr($value['dataPrevistaEntrega'], 6,4).substr($value['dataPrevistaEntrega'], 3,2).substr($value['dataPrevistaEntrega'], 0,2) : 
															  substr($value['dataRenovacao'], 6,4).substr($value['dataRenovacao'], 3,2).substr($value['dataRenovacao'], 0,2),
			);
		}
		
    	$pagina = intval($this->_getParam('pagina', 1));
    	$paginator = Zend_Paginator::factory($dados);
        $paginator->setItemCountPerPage(10);
        $paginator->setPageRange(7);
        $paginator->setCurrentPageNumber($pagina);
      
        $this->view->paginator = $paginator;		
		$this->view->item = $dados;
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
    
	public function getuserbymatrAction()
    {
    	$matricula = $this->_getParam('matricula');
    	$getuserbymatr = $this->Usuario->getusuariosByid($matricula);
    	
    	$this->view->msg = json_encode($getuserbymatr[0]);	
    	$this->render('mensagem');
    }
}

