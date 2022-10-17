{include file='templates/header.tpl'}

<table class="table">
    <thead>
    <tr>
        <th scope="col"></th>
        <th scope="col">Producto</th>
        <th scope="col">Precio</th>
        <th scope="col">Tipo de Producto</th>
    </tr>
    </thead>
    <tbody>
        {foreach from=$productsByCategory item=$productByCategory}
            <tr>
                <td><img class="rounded mx-auto d-block imagenProductos" src="{$productByCategory->imagen}"></td>
                <td><a href='viewProduct/{$productByCategory->id_producto}' type='button'>{$productByCategory->nombre_producto}</a></td>
                <td>{$productByCategory->precio}</td>
                <td>{$productByCategory->categoria}</td>
                {if isset($smarty.session.IS_LOGGED)}
                <td><a class='btn btn-primary me-md-2' href='formUpdate/{$productByCategory->id_producto}' type='button'> Editar </a></td>
                <td><a class='btn btn-primary me-md-2' href='delete/{$productByCategory->id_producto}' type='button'> X </a></td>
                {/if}
            </tr>
        {/foreach}
    </tbody>
</table>
{include file='templates/footer.tpl'}