<?php

class PostsController extends Util_Controller_Action
{

    public function init()
    {
    	parent::init();
    }
    
    /*
     * Posts por categoria
     */
    
    public function categoriasAction()
    {    
    	$Posts = new Model_Posts();
    	$getPostsAtivos = $Posts->getPostsAtivosByCategoria($this->_request->getParam('uid'));
    	
    	$pagina = intval($this->_getParam('pagina', 1));
    	$paginator = Zend_Paginator::factory($getPostsAtivos);
        $paginator->setItemCountPerPage(5);
        $paginator->setPageRange(7);
        $paginator->setCurrentPageNumber($pagina);
        $this->view->paginator = $paginator;      	
    	$this->view->posts = $getPostsAtivos->toArray();
    }

    /*
     * Post completo
     */
    
    public function completoAction()
    {    
    	$Posts = new Model_Posts();
    	$getPostsAtivos = $Posts->getPostsAtivosById($this->_request->getParam('uid'));
    	
    	$this->view->posts = $getPostsAtivos->toArray();
    }    
}

