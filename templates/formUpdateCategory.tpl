{include file='templates/header.tpl'}

<h3>Actulizar categoría</h3>

    <div class="formEditCategory">
        <form action="updateCategory/{$category->id_categoria}" method="POST" class="row g-3">
            <div class="col-auto">
                <input type="hidden" name="id_categoria" value = "{$category->id_categoria}">
                <input type="text" name="tipo_producto" value="{$category->tipo_producto}">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-3"> Actualizar </button>
            </div>
        </form>
    </div>
{include file='templates/footer.tpl'}