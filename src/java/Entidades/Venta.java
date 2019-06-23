/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ricardo Carmona
 */
@Entity
@Table(name = "venta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Venta.findAll", query = "SELECT v FROM Venta v"),
    @NamedQuery(name = "Venta.findById", query = "SELECT v FROM Venta v WHERE v.id = :id"),
    @NamedQuery(name = "Venta.findByFechaventa", query = "SELECT v FROM Venta v WHERE v.fechaventa = :fechaventa"),
    @NamedQuery(name = "Venta.findByTotalventa", query = "SELECT v FROM Venta v WHERE v.totalventa = :totalventa")})
public class Venta implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idVenta")
    private List<DetalleVenta> detalleVentaList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "fechaventa")
    private String fechaventa;
    @Basic(optional = false)
    @Column(name = "totalventa")
    private float totalventa;
    @JoinColumn(name = "fk_admin", referencedColumnName = "usuario")
    @ManyToOne(optional = false)
    private Administrador fkAdmin;
    @JoinColumn(name = "fk_cliente", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Cliente fkCliente;

    public Venta() {
    }

    public Venta(Integer id) {
        this.id = id;
    }

    public Venta(Integer id, String fechaventa, float totalventa) {
        this.id = id;
        this.fechaventa = fechaventa;
        this.totalventa = totalventa;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFechaventa() {
        return fechaventa;
    }

    public void setFechaventa(String fechaventa) {
        this.fechaventa = fechaventa;
    }

    public float getTotalventa() {
        return totalventa;
    }

    public void setTotalventa(float totalventa) {
        this.totalventa = totalventa;
    }

    public Administrador getFkAdmin() {
        return fkAdmin;
    }

    public void setFkAdmin(Administrador fkAdmin) {
        this.fkAdmin = fkAdmin;
    }

    public Cliente getFkCliente() {
        return fkCliente;
    }

    public void setFkCliente(Cliente fkCliente) {
        this.fkCliente = fkCliente;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Venta)) {
            return false;
        }
        Venta other = (Venta) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entidades.Venta[ id=" + id + " ]";
    }

    @XmlTransient
    public List<DetalleVenta> getDetalleVentaList() {
        return detalleVentaList;
    }

    public void setDetalleVentaList(List<DetalleVenta> detalleVentaList) {
        this.detalleVentaList = detalleVentaList;
    }
    
}
