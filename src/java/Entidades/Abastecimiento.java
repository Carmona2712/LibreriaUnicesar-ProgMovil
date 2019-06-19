/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ricardo Carmona
 */
@Entity
@Table(name = "abastecimiento")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Abastecimiento.findAll", query = "SELECT a FROM Abastecimiento a"),
    @NamedQuery(name = "Abastecimiento.findById", query = "SELECT a FROM Abastecimiento a WHERE a.id = :id"),
    @NamedQuery(name = "Abastecimiento.findByFecha", query = "SELECT a FROM Abastecimiento a WHERE a.fecha = :fecha"),
    @NamedQuery(name = "Abastecimiento.findByTotal", query = "SELECT a FROM Abastecimiento a WHERE a.total = :total")})
public class Abastecimiento implements Serializable {

    @Basic(optional = false)
    @Column(name = "cantidad")
    private int cantidad;

    @JoinColumn(name = "fk_admin", referencedColumnName = "usuario")
    @ManyToOne(optional = false)
    private Administrador fkAdmin;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Basic(optional = false)
    @Column(name = "total")
    private float total;
    @JoinColumn(name = "fk_Libro", referencedColumnName = "codigo")
    @ManyToOne(optional = false)
    private Libro fkLibro;

    public Abastecimiento() {
    }

    public Abastecimiento(Integer id) {
        this.id = id;
    }

    public Abastecimiento(Integer id, Date fecha, float total) {
        this.id = id;
        this.fecha = fecha;
        this.total = total;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
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
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Abastecimiento)) {
            return false;
        }
        Abastecimiento other = (Abastecimiento) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entidades.Abastecimiento[ id=" + id + " ]";
    }

    public Administrador getFkAdmin() {
        return fkAdmin;
    }

    public void setFkAdmin(Administrador fkAdmin) {
        this.fkAdmin = fkAdmin;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
}
