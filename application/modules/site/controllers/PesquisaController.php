<?php

class PesquisaController extends Util_Controller_Action
{

    public function init()
    {
    	parent::init();
    	$this->Model = new Model_Item();
    }
       
    public function categoriasAction()
    {    
    	$getItem = $this->Model->getItem();
    	//Zend_Debug::dump($getItem);die;
    	$this->view->item = $getItem;
    }
}

