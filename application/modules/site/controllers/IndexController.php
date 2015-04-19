<?php
class IndexController extends Util_Controller_Action
{
    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $Model_Paginas = new Model_Paginas();
		$paginas = $Model_Paginas->getPaginasPublicadas();
		$this->view->sistema = $paginas;
		
    	$Posts = new Model_Posts();
    	$getPostsAtivos = $Posts->getPostsAtivos();
    	
    	$pagina = intval($this->_getParam('pagina', 1));
    	$paginator = Zend_Paginator::factory($getPostsAtivos);
        $paginator->setItemCountPerPage(3);
        $paginator->setPageRange(7);
        $paginator->setCurrentPageNumber($pagina);
        $this->view->paginator = $paginator;  
        $this->view->posts = $getPostsAtivos;
    }

}

