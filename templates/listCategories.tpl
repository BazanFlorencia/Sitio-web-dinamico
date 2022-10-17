{include file='templates/header.tpl'}
<table class="table">
    <h2>Categorias</h2>
    <thead>
    {if isset($smarty.session.IS_LOGGED)}
        <tr>
            <th scope="col"> <form action="addCategory" method="POST"><input class="inputCategoria" type="text" name="tipo_producto"></input></th>
            
            <th scope="col"><button class="btn btn-primary me-md-2 justify-content-md-end" type="submit"> Agregar categoria </button></form></th>
            
        </tr>
    {/if}
    </thead>
    <tbody>
    {foreach from=$categories item=$category}
        <tr>
            <td><a href="category/{$category->id_categoria}" value='{$category->tipo_producto}'>{$category->tipo_producto}</td>
            {if isset($smarty.session.IS_LOGGED)}
            <td><a class="btn btn-primary me-md-2 justify-content-md-end" href="formUpdateCategory/{$category->id_categoria}" type="button"> Editar </a>
            <a class="btn btn-primary me-md-2 justify-content-md-end" href="deleteCategory/{$category->id_categoria}" type="button"> X </a></td>
            {/if}
        </tr>
    {/foreach}
    </tbody>
</table>
{include file='templates/footer.tpl'}