<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Gestión de Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="Style/producto.css" />
        <link rel="stylesheet" href="fonts.css" />
    </head>

    <body class="bg-light">

        <div id="fondoCarrusel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="2000">
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


        <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">Periféricos</a>
            </div>
        </nav>

        <div class="container">
            <h1 class="text-center mb-4">Gestión de Productos</h1>

            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title">Registrar / Editar Producto</h5>
                            <form action="Controlador?menu=Producto" method="POST">
                                <input type="text" value="${producto.getCodigoProducto()}" name="txtIdProducto" class="form-control mb-2" placeholder="ID del producto" />
                                <input type="text" value="${producto.getNombreProducto()}" name="txtNombreProducto" class="form-control mb-2" placeholder="Nombre del Producto" required />
                                <input type="text" value="${producto.getDescripcionProducto()}" name="txtDescripcionProducto" class="form-control mb-2" placeholder="Descripción del Producto" required />
                                <input type="text" value="${producto.getPrecioProducto()}" name="txtPrecioProducto" class="form-control mb-2" placeholder="Precio" required />
                                <input type="text" value="${producto.getStock()}" name="txtExistenciasProducto" class="form-control mb-2" placeholder="Existencias" required />
                                <input type="text" value="${producto.proveedor.codigoProveedor}" name="txtIdMarca" class="form-control mb-3" placeholder="ID Marca" required />

                                <div class="d-flex justify-content-between">
                                    <button type="submit" name="accion" value="Agregar" class="btn btn-success">Agregar</button>
                                    <button type="submit" name="accion" value="Actualizar" class="btn btn-warning">Actualizar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title">Listado de Productos</h5>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>ID</th>
                                            <th>Nombre</th>
                                            <th>Descripción</th>
                                            <th>Precio</th>
                                            <th>Existencias</th>
                                            <th>ID Marca</th>
                                            <th>Eliminar</th>
                                            <th>Editar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="producto" items="${productos}">
                                            <tr>
                                                <td>${producto.codigoProducto}</td>
                                                <td>${producto.nombreProducto}</td>
                                                <td>${producto.descripcionProducto}</td>
                                                <td>${producto.precioProducto}</td>
                                                <td>${producto.stock}</td>
                                                <td>${producto.proveedor.codigoProveedor}</td>
                                                <td>
                                                    <a href="Controlador?menu=Producto&accion=Eliminar&codigoProducto=${producto.getCodigoProducto()}" class="btn btn-sm btn-danger">Eliminar</a>
                                                </td>
                                                <td>
                                                    <a href="Controlador?menu=Producto&accion=Editar&codigoProducto=${producto.getCodigoProducto()}" class="btn btn-sm btn-primary">Editar</a>
                                                    
                                                </td>
                                                
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
