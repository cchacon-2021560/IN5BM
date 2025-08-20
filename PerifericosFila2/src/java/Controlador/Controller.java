/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Producto;
import Modelo.ProductoDAO;
import Modelo.Proveedor;
import Modelo.ProveedorDAO;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author informatica
 */
public class Controller extends HttpServlet {

    Proveedor proveedor = new Proveedor();
    ProveedorDAO proveedorDAO = new ProveedorDAO();
    Producto producto = new Producto();
    ProductoDAO productoDao = new ProductoDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equals("Principal")) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

        if (menu != null) {
            switch (menu) {
                case "Proveedor":
                    switch (accion) {
                        case "Listar":
                            List listaProveedores = proveedorDAO.listar();
                            request.setAttribute("proveedores", listaProveedores);
                            break;
                        case "Agregar":
                            String nombreProveedor = request.getParameter("txtNombreProveedor");
                            String direccionProveedor = request.getParameter("txtDireccionProveedor");
                            String telefonoProveedor = request.getParameter("txtTelefonoProveedor");
                            String correoProveedor = request.getParameter("txtCorreoProveedor");

                            proveedor.setNombreProveedor(nombreProveedor);
                            proveedor.setDireccionProveedor(direccionProveedor);
                            proveedor.setTelefonoProveedor(telefonoProveedor);
                            proveedor.setCorreoProveedor(correoProveedor);

                            proveedorDAO.agregar(proveedor);
                            request.getRequestDispatcher("Controlador?menu?Proveedor&accion=Listar").forward(request, response);
                            break;
                        case "Editar":
                            int codPr = Integer.parseInt(request.getParameter("codigoProveedor"));
                            Proveedor prov = proveedorDAO.listarPorProveedor(codPr);
                            request.setAttribute("proveedor", prov);
                            request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);
                            break;
                        case "Actualizar":
                            String codigoProv = request.getParameter("txtCodigoProveedor");
                            String nombrePr = request.getParameter("txtNombreProveedor");
                            String direccionPr = request.getParameter("txtDireccionProveedor");
                            String telefonoPr = request.getParameter("txtTelefonoProveedor");
                            String correoPr = request.getParameter("txtCorreoProveedor");
                            
                            proveedor.setCodigoProveedor(Integer.parseInt(codigoProv));
                            proveedor.setNombreProveedor(nombrePr);
                            proveedor.setDireccionProveedor(direccionPr);
                            proveedor.setTelefonoProveedor(telefonoPr);
                            proveedor.setCorreoProveedor(correoPr);
                            
                            proveedorDAO.actualizar(proveedor);
                            request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);
                            break;
                        case "Eliminar":
                            codPr = Integer.parseInt(request.getParameter("codigoProveedor"));
                            proveedorDAO.eliminar(codPr);
                            request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);
                            break;
                        default:
                            throw new AssertionError();
                    }

                    request.getRequestDispatcher("proveedor.jsp").forward(request, response);
                    break;
                case "Producto":
                    switch (accion) {
                        case "Listar":
                            List listaProducto = productoDao.listar();
                            request.setAttribute("productos", listaProducto);
                            break;
                        case "Agregar":
                            String nombreProducto = request.getParameter("txtNombreProducto");
                            String descripcionProducto = request.getParameter("txtDescripcionProducto");
                            String precioProducto = request.getParameter("txtPrecioProducto");
                            String stock = request.getParameter("txtExistenciasProducto");
                            String idMarca = request.getParameter("txtIdMarca");

                            producto.setNombreProducto(nombreProducto);
                            producto.setDescripcionProducto(descripcionProducto);
                            producto.setPrecioProducto(BigDecimal.valueOf(Double.parseDouble(precioProducto)));
                            producto.setStock(Integer.parseInt(stock));

                            proveedor.setCodigoProveedor(Integer.parseInt(idMarca));
                            producto.setProveedor(proveedor);

                            productoDao.agregar(producto);
                            request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                            break;
                        case "Editar":
                            int codP = Integer.parseInt(request.getParameter("codigoProducto"));
                            Producto prod = productoDao.listarPorProducto(codP);
                            request.setAttribute("producto", prod);
                            request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                            break;
                        case "Actualizar":
                            String codigo = request.getParameter("txtIdProducto");
                            String nombreP = request.getParameter("txtNombreProducto");
                            String descripcionP = request.getParameter("txtDescripcionProducto");
                            String precioP = request.getParameter("txtPrecioProducto");
                            String stockP = request.getParameter("txtExistenciasProducto");
                            String codMarca = request.getParameter("txtIdMarca");

                            producto.setCodigoProducto(Integer.parseInt(codigo));
                            producto.setNombreProducto(nombreP);
                            producto.setDescripcionProducto(descripcionP);
                            producto.setPrecioProducto(BigDecimal.valueOf(Double.parseDouble(precioP)));
                            producto.setStock(Integer.parseInt(stockP));

                            proveedor.setCodigoProveedor(Integer.parseInt(codMarca));
                            producto.setProveedor(proveedor);
                            productoDao.actualizar(producto);
                            request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                            break;
                        case "Eliminar":
                            codP = Integer.parseInt(request.getParameter("codigoProducto"));
                            productoDao.eliminar(codP);
                            request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                            break;
                        default:
                            throw new AssertionError();
                    }
                    request.getRequestDispatcher("producto.jsp").forward(request, response);
                    break;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
