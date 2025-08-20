package Modelo;

import java.math.BigDecimal;

public class Producto {

    private int codigoProducto;
    private String nombreProducto;
    private String descripcionProducto;
    private BigDecimal precioProducto;
    private int stock;

    private Proveedor proveedor;

    public Producto() {
    }

    public Producto(int codigoProducto, String nombreProducto, String descripcionProducto, BigDecimal precioProducto, int stock, Proveedor proveedor) {
        this.codigoProducto = codigoProducto;
        this.nombreProducto = nombreProducto;
        this.descripcionProducto = descripcionProducto;
        this.precioProducto = precioProducto;
        this.stock = stock;
        this.proveedor = proveedor;
    }

    public int getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }

    public BigDecimal getPrecioProducto() {
        return precioProducto;
    }

    public void setPrecioProducto(BigDecimal precioProducto) {
        this.precioProducto = precioProducto;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Proveedor getProveedor() {
        return proveedor;
    }

    public void setProveedor(Proveedor proveedor) {
        this.proveedor = proveedor;
    }

    @Override
    public String toString() {
        return "Producto{" + "codigoProducto=" + codigoProducto + ", nombreProducto=" + nombreProducto + ", descripcionProducto=" + descripcionProducto + ", precioProducto=" + precioProducto + ", stock=" + stock + ", proveedor=" + proveedor + '}';
    }
}
