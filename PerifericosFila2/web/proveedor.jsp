<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Gestión de Proveedores</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="Style/proveedor.css" />
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
            <h1 class="text-center mb-4">Gestión de Proveedores</h1>

            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title">Registrar / Editar Proveedor</h5>
                            <form action="Controlador?menu=Proveedor" method="POST">
                                <input type="text" value="${proveedor.getCodigoProveedor()}" name="txtCodigoProveedor" class="form-control mb-2" placeholder="ID" />
                                <input type="text" value="${proveedor.getNombreProveedor()}" name="txtNombreProveedor" class="form-control mb-2" placeholder="Nombre" required />
                                <input type="text" value="${proveedor.getDireccionProveedor()}" name="txtDireccionProveedor" class="form-control mb-2" placeholder="Dirección" required />
                                <input type="text" value="${proveedor.getTelefonoProveedor()}" name="txtTelefonoProveedor" class="form-control mb-2" placeholder="Celular" required />
                                <input type="email" value="${proveedor.getCorreoProveedor()}" name="txtCorreoProveedor" class="form-control mb-3" placeholder="Correo" required />

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
                            <h5 class="card-title">Listado de Proveedores</h5>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Código</th>
                                            <th>Nombre</th>
                                            <th>Dirección</th>
                                            <th>Celular</th>
                                            <th>Correo</th>
                                            <th>Actualizar</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="proveedor" items="${proveedores}">
                                            <tr>
                                                <td>${proveedor.codigoProveedor}</td>
                                                <td>${proveedor.nombreProveedor}</td>
                                                <td>${proveedor.direccionProveedor}</td>
                                                <td>${proveedor.telefonoProveedor}</td>
                                                <td>${proveedor.correoProveedor}</td>
                                                <td>
                                                    <a href="Controlador?menu=Proveedor&accion=Editar&codigoProveedor=${proveedor.getCodigoProveedor()}" class="btn btn-sm btn-primary">Editar</a>
                                                </td>
                                                <td>
                                                    <a href="Controlador?menu=Proveedor&accion=Eliminar&codigoProveedor=${proveedor.getCodigoProveedor()}" class="btn btn-sm btn-danger">Eliminar</a>
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
