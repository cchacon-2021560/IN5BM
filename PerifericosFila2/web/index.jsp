<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perifericos | Pagina Principal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="Style/login.css">
</head>
<body>

    <div id="fondoCarrusel" class="carousel slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/Imagen1.jpg" class="d-block w-100 carrusel-fondo" alt="Imagen 1">
            </div>
            <div class="carousel-item">
                <img src="img/Imagen2.jpg" class="d-block w-100 carrusel-fondo" alt="Imagen 2">
            </div>
            <div class="carousel-item">
                <img src="img/Imagen3.jpg" class="d-block w-100 carrusel-fondo" alt="Imagen 3">
            </div>
        </div>
    </div>

    <div class="overlay d-flex justify-content-center align-items-center vh-100">
        <div class="container text-center">
            <h1 class="text-white mb-4">Bienvenido a Tienda de Periféricos</h1>
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card shadow-lg">
                        <div class="card-body">
                            <h5 class="card-title">Gestión de Proveedores</h5>
                            <p class="card-text">Administra todos los proveedores.</p>
                            <a href="Controlador?menu=Proveedor&accion=Listar" class="btn btn-primary">Entrar</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-lg">
                        <div class="card-body">
                            <h5 class="card-title">Gestión de Productos</h5>
                            <p class="card-text">Controla el inventario de productos.</p>
                            <a href="Controlador?menu=Producto&accion=Listar" class="btn btn-success">Entrar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
