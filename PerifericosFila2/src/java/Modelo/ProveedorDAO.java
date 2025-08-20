package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProveedorDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public List listar() {
        String sql = "call sp_ListarProveedores()";
        List<Proveedor> listaProveedor = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Proveedor prov = new Proveedor();

                prov.setCodigoProveedor(rs.getInt(1));
                prov.setNombreProveedor(rs.getString(2));
                prov.setDireccionProveedor(rs.getString(3));
                prov.setTelefonoProveedor(rs.getString(4));
                prov.setCorreoProveedor(rs.getString(5));
                listaProveedor.add(prov);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaProveedor;
    }

    public int agregar(Proveedor prov) {
        String sql = "call sp_AgregarProveedores(?,?,?,?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, prov.getNombreProveedor());
            ps.setString(2, prov.getDireccionProveedor());
            ps.setString(3, prov.getTelefonoProveedor());
            ps.setString(4, prov.getCorreoProveedor());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    public Proveedor listarPorProveedor(int id) {
        Proveedor prov = new Proveedor();
        String sql = "Select * from Proveedores where codigoProveedor =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                prov.setCodigoProveedor(rs.getInt(1));
                prov.setNombreProveedor(rs.getString(2));
                prov.setDireccionProveedor(rs.getString(3));
                prov.setTelefonoProveedor(rs.getString(4));
                prov.setCorreoProveedor(rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return prov;

    }

    public int actualizar(Proveedor prov) {
        String sql = "call sp_EditarProveedor(?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, prov.getCodigoProveedor());
            ps.setString(2, prov.getNombreProveedor());
            ps.setString(3, prov.getDireccionProveedor());
            ps.setString(4, prov.getTelefonoProveedor());
            ps.setString(5, prov.getCorreoProveedor());

            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    public void eliminar(int codPr) {
        String sql = "call sp_EliminarProveedor(?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codPr);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
