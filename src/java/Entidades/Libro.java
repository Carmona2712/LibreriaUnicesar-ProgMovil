/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ricardo Carmona
 */
@Entity
@Table(name = "libro")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Libro.findAll", query = "SELECT l FROM Libro l"),
    @NamedQuery(name = "Libro.findByCodigo", query = "SELECT l FROM Libro l WHERE l.codigo = :codigo"),
    @NamedQuery(name = "Libro.findByNombre", query = "SELECT l FROM Libro l WHERE l.nombre = :nombre"),
    @NamedQuery(name = "Libro.findByGenero", query = "SELECT l FROM Libro l WHERE l.genero = :genero"),
    @NamedQuery(name = "Libro.findByFechapublicacion", query = "SELECT l FROM Libro l WHERE l.fechapublicacion = :fechapublicacion"),
    @NamedQuery(name = "Libro.findByPrecioCompra", query = "SELECT l FROM Libro l WHERE l.precioCompra = :precioCompra"),
    @NamedQuery(name = "Libro.findByPrecioVenta", query = "SELECT l FROM Libro l WHERE l.precioVenta = :precioVenta"),
    @NamedQuery(name = "Libro.findByStock", query = "SELECT l FROM Libro l WHERE l.stock = :stock")})
public class Libro implements Serializable {

    @Basic(optional = false)
    @Lob
    @Column(name = "imagen")
    private byte[] imagen;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkLibro")
    private List<Abastecimiento> abastecimientoList;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "codigo")
    private String codigo;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @Column(name = "genero")
    private String genero;
    @Basic(optional = false)
    @Column(name = "fechapublicacion")
    @Temporal(TemporalType.DATE)
    private Date fechapublicacion;
    @Basic(optional = false)
    @Column(name = "precio_compra")
    private float precioCompra;
    @Basic(optional = false)
    @Column(name = "precio_venta")
    private float precioVenta;
    @Basic(optional = false)
    @Column(name = "stock")
    private int stock;
    @JoinColumn(name = "fk_autor", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Autor fkAutor;
    @JoinColumn(name = "fk_editorial", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Editorial fkEditorial;

    public Libro() {
    }

    public Libro(String codigo) {
        this.codigo = codigo;
    }

    public Libro(String codigo, String nombre, String genero, Date fechapublicacion, float precioCompra, float precioVenta, int stock, byte[] imagen) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.genero = genero;
        this.fechapublicacion = fechapublicacion;
        this.precioCompra = precioCompra;
        this.precioVenta = precioVenta;
        this.stock = stock;
        this.imagen = imagen;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public Date getFechapublicacion() {
        return fechapublicacion;
    }

    public void setFechapublicacion(Date fechapublicacion) {
        this.fechapublicacion = fechapublicacion;
    }

    public float getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(float precioCompra) {
        this.precioCompra = precioCompra;
    }

    public float getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(float precioVenta) {
        this.precioVenta = precioVenta;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }


    public Autor getFkAutor() {
        return fkAutor;
    }

    public void setFkAutor(Autor fkAutor) {
        this.fkAutor = fkAutor;
    }

    public Editorial getFkEditorial() {
        return fkEditorial;
    }

    public void setFkEditorial(Editorial fkEditorial) {
        this.fkEditorial = fkEditorial;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigo != null ? codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Libro)) {
            return false;
        }
        Libro other = (Libro) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entidades.Libro[ codigo=" + codigo + " ]";
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    @XmlTransient
    public List<Abastecimiento> getAbastecimientoList() {
        return abastecimientoList;
    }

    public void setAbastecimientoList(List<Abastecimiento> abastecimientoList) {
        this.abastecimientoList = abastecimientoList;
    }
    
}
