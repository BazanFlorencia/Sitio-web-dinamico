<?php
class categoryModel{
    
    private $db;
    public function __construct(){
        $this->db = new PDO('mysql:host=Localhost;'.'dbname=db_productos;charset=utf8','root','');
    }

    public function getCategories(){
        $query = $this->db->prepare('SELECT `id_categoria`, `tipo_producto` FROM `categorias`');
        $query->execute();
        $categories= $query->fetchAll(PDO::FETCH_OBJ);
        return $categories;
    }
    public function getCategory($id){
        $query = $this->db->prepare('SELECT `id_categoria`, `tipo_producto` FROM `categorias` WHERE `id_categoria`= ?');
        $query->execute([$id]);
        $category = $query->fetch(PDO::FETCH_OBJ);
        return $category;
    }
    public function getProductsByCategory($id){
        $query = $this->db -> prepare('SELECT `id_producto`, `nombre_producto`, `precio`, `categorias`.`tipo_producto` as `categoria` FROM `lista_productos` INNER JOIN `categorias` ON `lista_productos`.`id_categoria`= `categorias`.`id_categoria` WHERE `categorias`.`id_categoria`=?');
        $query->execute([$id]);
        $productsByCategory = $query ->fetchAll(PDO::FETCH_OBJ);
        return $productsByCategory;
    }
    public function updateCategoryById($tipo_producto,$id){
        $query = $this->db->prepare('UPDATE `categorias` SET `tipo_producto` = ? WHERE `id_categoria` = ?');
        $query->execute([$tipo_producto, $id]);
    }
    public function insertCategory($type_product){
        $query = $this-> db -> prepare('INSERT INTO categorias (tipo_producto) VALUES (?)');
        $query -> execute([$type_product]);
    }
    public function deleteCategoryById($id){
        $query = $this -> db -> prepare('DELETE FROM `categorias` WHERE id_categoria = ?');
        $query ->execute([$id]);
    }
}