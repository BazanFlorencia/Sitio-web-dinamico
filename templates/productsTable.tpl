{include file='templates/header.tpl'}

<table class="table">
    <thead>
      <tr>
          <th scope="col"></th>
          <th scope="col">Producto</th>
          <th scope="col">Precio</th>
          <th scope="col">Tipo de Producto</th>
          {if isset($smarty.session.IS_LOGGED)}
          <th scope="col"><a href='formAdd' type='hidden'> Agregar producto </a></th>
          {/if}
      </tr>
    </thead>
    <tbody>
      {foreach from=$products item=$product}
      <tr>
        <td><img class="rounded mx-auto d-block imagenProductos" src="{$product->imagen}"></td>
        <td><a href='viewProduct/{$product->id_producto}'type='button'>{$product->nombre_producto}</a></td>
        <td>{$product->precio} </td>
        <td>{$product->categoria}</td>
        {if isset($smarty.session.IS_LOGGED)}
        <td><a href='formUpdate/{$product->id_producto}' type='button'> Editar </a></td>
        <td><a href='delete/{$product->id_producto}' type='button'> X </a></td>
        {/if}
        </tr>
      {/foreach}
    </tbody>
</table>


{include file='templates/footer.tpl'}