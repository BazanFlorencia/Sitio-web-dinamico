{include file='templates/header.tpl'}

<div class="card" style="width: 18rem;">
    <img src="..." class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">{$product->nombre_producto}</h5>
            <p class="card-text">{$product->categoria}</p>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">${$product->precio}</li>
            <li class="list-group-item">Información</li>
        </ul>
        <div class="card-body">
            <a href="#" class="card-link btn btn-primary me-md-2 justify-content-md-end">Comprar</a>
        </div>
</div>

{include file='templates/footer.tpl'}