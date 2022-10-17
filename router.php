<?php
    require_once "./app/Controllers/productsController.php";
    require_once "./app/Controllers/authController.php";
    require_once "./app/Controllers/categoryController.php";
  
    define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');
   
    $action = 'home'; 
    if (!empty($_GET['action'])) {
        $action = $_GET['action'];  
    }
    $params = explode('/', $action); 
    switch ($params[0]) {
        case 'home':
            $productsController = new productsController();
            $productsController->showHome();
            break;
        case 'login':
            $authController = new authController();
            $authController -> showLogin();
            break;
        case 'verify':
            $authController = new authController();
            $authController -> validateUser();
            break;
        case 'logout':
            $authController = new authController();
            $authController -> logout();
        case 'formAdd':
            $productsController = new productsController();
            $productsController->formAdd();
            break;
        case 'add':
            $productsController = new productsController();
            $productsController->addProduct();
            break;    
        case 'delete':
            $productsController = new productsController();
            $productsController->deleteProduct($params[1]);
            break;
        case 'update':
            $productsController = new productsController();
            $productsController->updateProduct($params[1]);
            break;
        case 'formUpdate';
            $productsController = new productsController();
            $productsController->formUpdate($params[1]);
            break;
        case 'categories':
            $categoryController = new categoryController();
            $categoryController->showCategories();
            break;
        case 'category':
            $categoryController = new categoryController();
            $categoryController->showCategory($params[1]);
            break;
        case 'formUpdateCategory':
            $categoryController = new categoryController();
            $categoryController->formUpdateCategory($params[1]);
            break;
        case 'updateCategory':
            $categoryController = new categoryController();
            $categoryController->updateCategory($params[1]);
            break;
        case 'deleteCategory':
            $categoryController = new categoryController();
            $categoryController->deleteCategory($params[1]);
            break;
        case 'viewProduct':
            $productsController = new productsController();
            $productsController->showProduct($params[1]);
            break;
        case 'addCategory':
            $categoryController = new categoryController();
            $categoryController->addCategory();
            break;
        default:
            echo "404 not found";
            break;
    }