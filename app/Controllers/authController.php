<?php
require_once "./app/Models/userModel.php";
require_once "./app/Views/authView.php";
require_once './app/helpers/auth.helper.php';

class authController{

    private $userModel;
    private $authView;
    private $authHelper;

    public function __construct(){
        $this->userModel = new userModel();
        $this->authView = new authView();
        $this->authHelper = new authHelper();
        if(session_status()!=PHP_SESSION_ACTIVE){
            session_start();
        }
    }

    public function showLogin(){
        $this->authView->showFormLogin();
    }

    public function validateUser() {
            if(!empty($_POST['email'])&&!empty($_POST['password'])){

           
            $email = $_POST['email'];
            $password = $_POST['password'];
            
            $user = $this->userModel->getUserByEmail($email);
            
            var_dump($user);
            
            
            var_dump($user->name);
            var_dump($user->password);
           
            if ($user && password_verify($password, $user->password)) {

                session_start();
                $_SESSION['USER_ID'] = $user->id;
                $_SESSION['USER_EMAIL'] = $user->email;
                $_SESSION['IS_LOGGED'] = true;
                
                header("Location: ".BASE_URL. 'home');
                
                
            
        
            } else {
    
            $this->authView->showFormLogin("El usuario o la contraseña no existe.");
            }
        }
        }
     
    

    public function logout() {
        session_start();
        session_destroy();
        header("Location: " .BASE_URL. 'home');
    }

}