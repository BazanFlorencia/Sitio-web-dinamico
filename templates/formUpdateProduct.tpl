{include file='templates/header.tpl'}
<h3>Actualizar datos</h3> 
    <form action="update/{$product->id_producto }" method="POST" enctype="multipart/form-data">
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
            <select name="tipo_producto" class="selectUpdate" value ="{$categories->id_categoria}"> 
                {foreach from=$categories item=$category}
                    <option value="{$category->id_categoria}">{$category->tipo_producto}</option>
                {/foreach}
            </select>
        </div>
        <div class="form_add">
            <input type="file" name="imagen">
        </div>
        <div class="formulario1">
            <button type="submit" class="buttonUpdate"> Actualizar </button>
        </div>
    </form>
{include file='templates/footer.tpl'}