<?php

class Admin_UsuariosController extends Util_Controller_Action2
{	
    public function init()
    {
    	parent::init();
    	$this->Model = new Model_Usuarios();
    	$this->PerfilModel = new Model_Perfis();
    	$this->TipoUsuarioModel = new Model_Tipousuario();
    	$this->iduser = Zend_Auth::getInstance()->getStorage()->read();    	
    }

	public function logarAction()
    {
        if ($this->getRequest()->isPost()) {
        
            $login = $this->_getParam('username');
            $senha = $this->_getParam('senha');
                       
        	if ($login==null or $senha==null){
        		$this->_redirect('admin/index?errornegate=0');        		
        	}            

            $authAdapter = new Zend_Auth_Adapter_DbTable(null, 'usuarios', 'username', 'senha', null);
            $authAdapter->setCredential($senha)
                        ->setIdentity($login);
            
			if ($authAdapter->authenticate()->isValid()) {
                $row = $authAdapter->getResultRowObject(null, array('senha'));              
                $zendAuth = Zend_Auth::getInstance();
                $storage = $zendAuth->getStorage();
                $Perfis = new Model_Perfis();
                $dadosPerfil = $Perfis->find($row->perfis_idperfis);
                $session = new Zend_Session_Namespace('sistema');
                $session->nmperfil = $dadosPerfil[0]['nome'];
                $storage->write($row);
                $session->dados = $row;
              // Zend_Debug::dump($session->nmperfil);die;
				if($session->nmperfil == Administrador){
					$this->_redirect('admin/painel');
				}else{
               		 $this->_redirect('usuario/index');
				}
            } else {
            	$this->_redirect('admin/index?errornegate=1');
            }
        }
    }
    
    public function insertAction()
    {
    	$getPerfis = $this->PerfilModel->getPerfis();
    	$getTipoUsuario= $this->TipoUsuarioModel->getTipoUsuario();
    	
    	$this->view->perfil = $getPerfis;
    	$this->view->tipousuario = $getTipoUsuario;
    	
    	$this->view->dadospagina = null;	
    	$this->view->nmFormulario = "Adicionar Novo Usuario";
    	
		if($this->_request->getParam('id')){
	    	$dadospagina = $this->Model->find($this->_request->getParam('id'));
	    	$this->view->dadospagina = $dadospagina[0];
	    	$this->view->nmFormulario = "Alterar Usuario";
		}
		
    	$this->view->usuario = $this->iduser->nome; 
    	   	
		if($this->_request->isPost())
		{			
			// Alteracao
			if($this->_request->getParam('idusuarios')!='')
			{				
				$post = $this->_request->getPost();
				
				$dados = array(
					'perfis_idperfis' => $post["perfis_idperfis"],
					'tipo_usuario'    => $post["tipo_usuario"],
					'nome'            => $post["nome"],
					'endereco'        => $post["endereco"],
					'telFixo'         => $post["telFixo"],
					'celular'         => $post["celular"],
					'email'           => $post["email"],
					'matricula'       => $post["matricula"],
					'username'        => $post["username"],
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
									
			} else {
				$post = $this->_request->getPost();
				$post['cdUser'] = $this->iduser->idusuarios;
				$post['dtUser'] = date('d/m/Y');
				$post['dtUser'] = date('His');
				$insert = $this->Model->save($post);
	    		$msg = !empty($insert) ? "Usuário cadastrado com sucesso!" : "Erro ao cadastrar";
				$this->view->resposta = $msg;
			}
		} 	
    }
    
    public function allusuariosAction()
    {    	
		$getUsuarios = $this->Model->getUsuarios();
	
    	$pagina = intval($this->_getParam('pagina', 1));
    	$paginator = Zend_Paginator::factory($getUsuarios);
        $paginator->setItemCountPerPage(10);
        $paginator->setPageRange(7);
        $paginator->setCurrentPageNumber($pagina);
       
        $this->view->paginator = $paginator;		
		$this->view->usuario = $getUsuarios;
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
			
		$delete = $this->Model->update($dados, $post['idusuarios']);
    	$msg = $delete != 0 ? "Registro excluido com sucesso!" : "Erro ao excluir registro";
		$this->view->resposta = $msg;
		$this->_redirect('admin/usuarios/allusuarios');	    	  			
    }

    public function sairAction()
    {
        Zend_Auth::getInstance()->clearIdentity();
        Zend_Session::destroy();
        $this->_redirect('site/index');
    }
}