<?php

class Admin_IndexController extends Util_Controller_Action2
{	
    public function init()
    {
    	$this->getHelper('layout')->disableLayout();
    	//parent::init();
        /* Initialize action controller here */
    }

    public function indexAction()
    {   	
    	/*
    	$TipoProduto = new Model_TipoProduto();
    	$getTipoProduto = $TipoProduto->getTipoProduto();
    	
    	$Produtos = new Model_Produtos();
    	$getProdutos = $Produtos->getProdutos();
    	
    	$this->view->tipoprodutos = $getTipoProduto;
    	$this->view->produtos = $getProdutos;
    	*/
    }


}

