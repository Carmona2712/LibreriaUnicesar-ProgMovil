/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ricardo Carmona
 */
@Entity
@Table(name = "detalle_venta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DetalleVenta.findAll", query = "SELECT d FROM DetalleVenta d"),
    @NamedQuery(name = "DetalleVenta.findByIdDetalle", query = "SELECT d FROM DetalleVenta d WHERE d.idDetalle = :idDetalle"),
    @NamedQuery(name = "DetalleVenta.findByNombrelibro", query = "SELECT d FROM DetalleVenta d WHERE d.nombrelibro = :nombrelibro"),
    @NamedQuery(name = "DetalleVenta.findByPrecio", query = "SELECT d FROM DetalleVenta d WHERE d.precio = :precio"),
    @NamedQuery(name = "DetalleVenta.findByCantidad", query = "SELECT d FROM DetalleVenta d WHERE d.cantidad = :cantidad"),
    @NamedQuery(name = "DetalleVenta.findBySubtotal", query = "SELECT d FROM DetalleVenta d WHERE d.subtotal = :subtotal")})
public class DetalleVenta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idDetalle")
    private Integer idDetalle;
    @Basic(optional = false)
    @Column(name = "nombrelibro")
    private String nombrelibro;
    @Basic(optional = false)
    @Column(name = "precio")
    private float precio;
    @Basic(optional = false)
    @Column(name = "cantidad")
    private int cantidad;
    @Basic(optional = false)
    @Column(name = "subtotal")
    private float subtotal;
    @JoinColumn(name = "id_venta", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Venta idVenta;
    @JoinColumn(name = "fk_libro", referencedColumnName = "codigo")
    @ManyToOne(optional = false)
    private Libro fkLibro;

    public DetalleVenta() {
    }

    public DetalleVenta(Integer idDetalle) {
        this.idDetalle = idDetalle;
    }

    public DetalleVenta(Integer idDetalle, String nombrelibro, float precio, int cantidad, float subtotal) {
        this.idDetalle = idDetalle;
        this.nombrelibro = nombrelibro;
        this.precio = precio;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

    public Integer getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(Integer idDetalle) {
        this.idDetalle = idDetalle;
    }

    public String getNombrelibro() {
        return nombrelibro;
    }

    public void setNombrelibro(String nombrelibro) {
        this.nombrelibro = nombrelibro;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(float subtotal) {
        this.subtotal = subtotal;
    }

    public Venta getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(Venta idVenta) {
        this.idVenta = idVenta;
    }

    public Libro getFkLibro() {
        return fkLibro;
    }

    public void setFkLibro(Libro fkLibro) {
        this.fkLibro = fkLibro;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDetalle != null ? idDetalle.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetalleVenta)) {
            return false;
        }
        DetalleVenta other = (DetalleVenta) object;
        if ((this.idDetalle == null && other.idDetalle != null) || (this.idDetalle != null && !this.idDetalle.equals(other.idDetalle))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entidades.DetalleVenta[ idDetalle=" + idDetalle + " ]";
    }
    
}
