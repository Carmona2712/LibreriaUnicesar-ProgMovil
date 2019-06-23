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
import javax.persistence.Id;
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
@Table(name = "administrador")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Administrador.findAll", query = "SELECT a FROM Administrador a"),
    @NamedQuery(name = "Administrador.findByUsuario", query = "SELECT a FROM Administrador a WHERE a.usuario = :usuario"),
    @NamedQuery(name = "Administrador.findByPass", query = "SELECT a FROM Administrador a WHERE a.pass = :pass"),
    @NamedQuery(name = "Administrador.findByEmail", query = "SELECT a FROM Administrador a WHERE a.email = :email")})
public class Administrador implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkAdmin")
    private List<Venta> ventaList;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkAdmin")
    private List<Abastecimiento> abastecimientoList;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "usuario")
    private String usuario;
    @Basic(optional = false)
    @Column(name = "pass")
    private String pass;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;

    public Administrador() {
    }

    public Administrador(String usuario) {
        this.usuario = usuario;
    }

    public Administrador(String usuario, String pass, String email) {
        this.usuario = usuario;
        this.pass = pass;
        this.email = email;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (usuario != null ? usuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Administrador)) {
            return false;
        }
        Administrador other = (Administrador) object;
        if ((this.usuario == null && other.usuario != null) || (this.usuario != null && !this.usuario.equals(other.usuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entidades.Administrador[ usuario=" + usuario + " ]";
    }

    @XmlTransient
    public List<Abastecimiento> getAbastecimientoList() {
        return abastecimientoList;
    }

    public void setAbastecimientoList(List<Abastecimiento> abastecimientoList) {
        this.abastecimientoList = abastecimientoList;
    }

    @XmlTransient
    public List<Venta> getVentaList() {
        return ventaList;
    }

    public void setVentaList(List<Venta> ventaList) {
        this.ventaList = ventaList;
    }
    
}
