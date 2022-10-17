{include file='templates/header.tpl'}
<h3>Actualizar datos</h3> 
    <form action="update/{$product->id_producto }" method="POST">
        <div class="formulario1">
        <input type="hidden" name="id_producto" value = "{$product->id_producto}">
        <label for="nombre_producto">Producto</label>
        <input type="text" name="nombre_producto" value="{$product->nombre_producto}">
        </div>
        <div class="formulario1">
        <label for="precio">Precio</label>
        <input type="text" name="precio" value="{$product->precio}">
        </div>
        <div class="formulario1">
        <select name="tipo_producto" class="selectUpdate" value ="{$product->categoria}"> 
            <option value="4">Cereal</option>
            <option value="2">Condimento</option>
            <option value="1">Frutos secos</option>
            <option value="3">Harina</option>
            <option value="7">Semillas</option>
            <option value="6">Legumbres</option>
        </select>
        </div>
        <div class="formulario1">
        <button type="submit" class="buttonUpdate"> Actualizar </button>
        </div>
    </form>
{include file='templates/footer.tpl'}