<%-- 
    Document   : admin
    Created on : 22/07/2025, 16:43:15
    Author     : Francisco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Venta de perifericos | Ventana de Administrador</title>
        <link rel="stylesheet" href="Style/admin.css"
    <body>
        <nav>
            <ul>
                <li><a href="Controlador?menu=Proveedor&accion=Listar" target="contenido">Proveedores</a></li>
                <li><a href="Controlador?menu=Producto&accion=Listar" target="contenido">Productos</a></li>
                        <li>${correo.correoProveedor}</li>
                        <li><a href="Controlador?menu=cambiarCuenta">Cambiar Cuenta</a></li>
                        <li><a href="Controlador?menu=cerrarSesion">Cerrar sesión</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <div class="panel">
            <h2>Bienvenido</h2>
        </div>

        <div class="contenido">
            <iframe name="contenido" width="100%" height="1000" style="border:0;"></iframe>
        </div>

    </body>
</html>