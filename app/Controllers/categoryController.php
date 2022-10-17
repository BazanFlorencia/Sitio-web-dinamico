<?php
require_once "./app/Views/categoryView.php";
require_once "./app/Models/categoryModel.php";
require_once './app/helpers/auth.helper.php';

class categoryController{

    private $modelCategory;
    private $viewCategory;

    public function __construct(){
        $this->modelCategory = new categoryModel();
        $this->viewCategory = new categoryView();
        $this->authHelper = new authHelper();
        if(session_status()!=PHP_SESSION_ACTIVE){
            session_start();
        }
    }
    public function showCategories(){
        $categories = $this->modelCategory->getCategories();
        $this->viewCategory->showListCategories($categories);
    }
    public function showCategory($id){
        $productsByCategory = $this->modelCategory->getProductsByCategory($id);
        $this->viewCategory->showProductsCategory($productsByCategory);
    }
    public function formUpdateCategory($id){
        $this->authHelper->checkloggedIn();
        $category = $this->modelCategory->getCategory($id);
        $this->viewCategory->showFormUpdateCategory($category);
    }
    public function updateCategory($id){
        $this->authHelper->checkloggedIn();
        if (!empty($_POST['tipo_producto'])){
            $tipo_producto = $_POST['tipo_producto'];
            $this->modelCategory->updateCategoryById($tipo_producto,$id);
            header("Location: ".BASE_URL. 'categories');
        }
    }
    public function deleteCategory($id){
        $this->authHelper->checkloggedIn();
        $products = $this->modelCategory->getProductsByCategory($id);
        count($products);
        if(count($products)>0){
            $this->viewCategory->errorDelete();
        }
        else{
            $this->modelCategory->deleteCategoryById($id);
            header("Location: ".BASE_URL. "categories");
        }
    }
    public function addCategory(){
        $this->authHelper->checkloggedIn();
        if (!empty($_POST['tipo_producto'])){
            $type_product = $_POST['tipo_producto'];
            $this->modelCategory->insertCategory($type_product);
        }
        
        header("Location: ".BASE_URL.'categories');
    }
}
