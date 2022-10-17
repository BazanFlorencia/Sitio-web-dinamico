<?php
require_once "./app/helpers/auth.helper.php";

class productsModel{

    private $db;
    private $authHelper;
    public function __construct(){
        $this->db = new PDO('mysql:host=Localhost;'.'dbname=db_productos;charset=utf8','root','');
        $this->authHelper = new authHelper();
    }

    public function getProducts(){
        $query = $this -> db -> prepare('SELECT lista_productos.*, categorias.tipo_producto as categoria FROM lista_productos INNER JOIN categorias ON lista_productos.id_categoria=categorias.id_categoria');
        $query -> execute();
        $products = $query -> fetchAll(PDO::FETCH_OBJ);

        return $products;
    }

    public function getProduct($id){
        $query = $this->db -> prepare('SELECT lista_productos.*, categorias.tipo_producto as categoria FROM lista_productos INNER JOIN categorias ON lista_productos.id_categoria=categorias.id_categoria WHERE id_producto=?');
        $query->execute([$id]);
        $product = $query ->fetch(PDO::FETCH_OBJ);
        return $product;
    }

    public function insertProduct($name, $price, $type_product, $imagen = null){
        $this->authHelper->checkloggedIn();
        $pathImg = null;
        if ($imagen){
            $pathImg = $this->uploadImage($imagen);
        }
        $query = $this-> db -> prepare("INSERT INTO lista_productos (nombre_producto, precio, id_categoria, imagen) VALUES (?,?,?,?)");
        $query->execute([$name, $price, $type_product, $pathImg]);
    }

    public function deleteProductById($id){
        $this->authHelper->checkloggedIn();
        $query = $this -> db -> prepare('DELETE FROM lista_productos WHERE id_producto = ?');
        $query ->execute([$id]);
    }

    public function updateProductById($name, $price, $type_product, $id, $imagen = null){
        $this->authHelper->checkloggedIn();
        $pathImg = null;
        if ($imagen){
            $pathImg = $this->uploadImage($imagen);            
        }
            $query = $this->db->prepare('UPDATE lista_productos SET nombre_producto = ?, precio = ?, id_categoria = ?, imagen = ? WHERE id_producto = ?');
            $query->execute([$name, $price, $type_product, $pathImg, $id]);
    }

    private function uploadImage($imagen){
        $target = 'img/productos/' . uniqid() . '.jpg';
        move_uploaded_file($imagen, $target);
        return $target;
    }

}