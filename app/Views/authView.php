<?php
require_once "libs\smarty-4.2.1\libs\Smarty.class.php";

class authView{
  private $smarty;

  public function __construct(){
      $this->smarty = new Smarty();
  }

  public function showFormLogin($error = ""){
      $this->smarty->assign('titulo', 'Administrador');
      $this->smarty->assign('error', $error);
      $this->smarty->display('templates/formAdmin.tpl');      
  }
}