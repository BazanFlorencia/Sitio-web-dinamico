{include file='templates/header.tpl'}

<div class="mt-5 w-25 mx-auto">
    <h1> {$titulo} </h1>
    <form method="POST" action="verify">
        <div class="form-group">
            <label for="">Usuario</label>
            <input type="email" required class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="email">
        </div>
        <div class="form-group">
            <label for="password">Contraseña</label>
            <input type="password" required class="form-control" id="password" name="password" placeholder="Ingrese su contraseña">
        </div>
        <button type="submit" class="btn btn-primary mt-3">Entrar</button>
    </form>
    <h4>{$error}</h4>
</div>

{include file='templates/footer.tpl'}
  
  