<?php
require_once "libs\smarty-4.2.1\libs\Smarty.class.php";
class categoryView{
    private $smarty;

    public function __construct(){
        $this->smarty = new Smarty();
    }

    public function showProductsCategory($productsByCategory){
        $this->smarty->assign('productsByCategory', $productsByCategory);
        $this->smarty->display('templates/productsCategory.tpl');
    }
    public function showListCategories($categories){
        $this->smarty->assign('categories', $categories);
        $this->smarty->display('templates/listCategories.tpl');
    }
    public function showFormUpdateCategory($category){
        $this->smarty->assign('category', $category);
        $this->smarty->display('templates/formUpdateCategory.tpl');
    }
    
    public function locationHome(){
        header("Location:".BASE_URL. 'home');
    }
    public function errorDelete(){
        $this->smarty->assign('category', $category);
        $this->smarty->display('templates/errorDelete.tpl');
    }
    
}