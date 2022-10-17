{include file='templates/header.tpl'}

<div>
    <form action="add" method="POST" class="formulario" >
        <div class="form_add">
        <label for="nombre_producto">Producto</label>
        <input type="text" name="nombre_producto">
        </div>
        <div class="form_add">
        <label for="precio">Precio</label>
        <input type="text" name="precio">
        </div>
        <div class="form_add">
        <select name="tipo_producto">
            {foreach from=$categories item=$category}
                <option value="{$category->id_categoria}">{$category->tipo_producto}</option>
            {/foreach}
        </select>
        </div>
        <button type="submit" class="btn btn-primary me-md-2 justify-content-md-end buttonAdd"> Agregar </button>
    </form>
</div>


{include file='templates/footer.tpl'}