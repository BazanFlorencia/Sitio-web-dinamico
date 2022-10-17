<?php
require_once "./app/Models/productsModel.php";
require_once "./app/Views/productView.php";
require_once "./app/Models/categoryModel.php";
require_once './app/helpers/auth.helper.php';

    class ProductsController{

    private $modelProduct;
    private $viewProduct;
    private $modelCategory;

    public function __construct(){
        $this->modelProduct = new productsModel();
        $this->viewProduct = new productView();
        $this->modelCategory = new categoryModel();
       $this->authHelper = new authHelper();
       if(session_status()!=PHP_SESSION_ACTIVE){
        session_start();
    }
    }

    public function showHome(){
        $products = $this->modelProduct->getProducts();
        $this->viewProduct->showProducts($products);
    }

    public function formAdd(){
        $this->authHelper->checkloggedIn();
        $categories = $this->modelCategory->getCategories();
        $this->viewProduct->showFormAdd($categories);
    }
    public function addProduct(){
        $this->authHelper->checkloggedIn();
        if (!empty($_POST['nombre_producto'])&&!empty($_POST['precio'])&&!empty($_POST['tipo_producto'])){
          $name = $_POST['nombre_producto'];
          $price = $_POST['precio'];
          $type_product = $_POST['tipo_producto'];

          $this->modelProduct->insertProduct($name, $price, $type_product);
          $this->viewProduct->locationHome();
        }
    }

    public function deleteProduct($id){
        $this->authHelper->checkloggedIn();
        $this-> modelProduct->deleteProductById($id);
        $this->viewProduct->locationHome();
    }

    public function formUpdate($id){
        $this->authHelper->checkloggedIn();
        $categories = $this->modelCategory->getCategories();
        $product = $this->modelProduct->getProduct($id);
        $this->viewProduct->showFormUpdate($product, $categories);
    }
    
    public function updateProduct($id){
        $this->authHelper->checkloggedIn();
        if (!empty($_POST['nombre_producto'])&&!empty($_POST['precio'])&&!empty($_POST['tipo_producto'])){
            $name = $_POST['nombre_producto'];
            $price = $_POST['precio'];
            $type_product = $_POST['tipo_producto'];
            $this->modelProduct->updateProductById($name, $price, $type_product,$id);
        }
        $this->viewProduct->locationHome();
    }

    public function showProduct($id){
        $product = $this-> modelProduct->getProduct($id);
        $this->viewProduct->viewProduct($product);
    }
}
