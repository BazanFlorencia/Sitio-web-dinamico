<?php
require_once "libs/smarty-4.2.1/libs/Smarty.class.php";
require_once "./app/helpers/auth.helper.php";

class productView{
    private $smarty;

    public function __construct(){
        $this->smarty = new Smarty();
        $this->authHelper = new authHelper();
    }

    public function showProducts($products){
      $this->smarty->assign('products', $products);
      $this->smarty->display('templates/productsTable.tpl');
    }

    public function showFormUpdate($product, $categories){
      $this->smarty->assign('product', $product);
      $this->smarty->assign('categories', $categories);
      $this->smarty->display('templates/formUpdateProduct.tpl');
    }

    public function showFormAdd($categories){
      $this->smarty->assign('categories', $categories);
      $this->smarty->display('templates/formAddProduct.tpl');
    }

    public function locationHome(){
        header("Location:".BASE_URL. 'home');
        
    }

    public function viewProduct($product){
      $this->smarty->assign('product', $product);
      $this->smarty->display('templates/viewProduct.tpl');
    }
}
