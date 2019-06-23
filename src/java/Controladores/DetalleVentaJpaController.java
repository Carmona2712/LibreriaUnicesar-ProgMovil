/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Controladores.exceptions.NonexistentEntityException;
import Entidades.DetalleVenta;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entidades.Venta;
import Entidades.Libro;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Ricardo Carmona
 */
public class DetalleVentaJpaController implements Serializable {

    public DetalleVentaJpaController() {
        this.emf = Persistence.createEntityManagerFactory("LibreriaUnicesar-ProgMovilPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(DetalleVenta detalleVenta) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Venta idVenta = detalleVenta.getIdVenta();
            if (idVenta != null) {
                idVenta = em.getReference(idVenta.getClass(), idVenta.getId());
                detalleVenta.setIdVenta(idVenta);
            }
            Libro fkLibro = detalleVenta.getFkLibro();
            if (fkLibro != null) {
                fkLibro = em.getReference(fkLibro.getClass(), fkLibro.getCodigo());
                detalleVenta.setFkLibro(fkLibro);
            }
            em.persist(detalleVenta);
            if (idVenta != null) {
                idVenta.getDetalleVentaList().add(detalleVenta);
                idVenta = em.merge(idVenta);
            }
            if (fkLibro != null) {
                fkLibro.getDetalleVentaList().add(detalleVenta);
                fkLibro = em.merge(fkLibro);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(DetalleVenta detalleVenta) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            DetalleVenta persistentDetalleVenta = em.find(DetalleVenta.class, detalleVenta.getIdDetalle());
            Venta idVentaOld = persistentDetalleVenta.getIdVenta();
            Venta idVentaNew = detalleVenta.getIdVenta();
            Libro fkLibroOld = persistentDetalleVenta.getFkLibro();
            Libro fkLibroNew = detalleVenta.getFkLibro();
            if (idVentaNew != null) {
                idVentaNew = em.getReference(idVentaNew.getClass(), idVentaNew.getId());
                detalleVenta.setIdVenta(idVentaNew);
            }
            if (fkLibroNew != null) {
                fkLibroNew = em.getReference(fkLibroNew.getClass(), fkLibroNew.getCodigo());
                detalleVenta.setFkLibro(fkLibroNew);
            }
            detalleVenta = em.merge(detalleVenta);
            if (idVentaOld != null && !idVentaOld.equals(idVentaNew)) {
                idVentaOld.getDetalleVentaList().remove(detalleVenta);
                idVentaOld = em.merge(idVentaOld);
            }
            if (idVentaNew != null && !idVentaNew.equals(idVentaOld)) {
                idVentaNew.getDetalleVentaList().add(detalleVenta);
                idVentaNew = em.merge(idVentaNew);
            }
            if (fkLibroOld != null && !fkLibroOld.equals(fkLibroNew)) {
                fkLibroOld.getDetalleVentaList().remove(detalleVenta);
                fkLibroOld = em.merge(fkLibroOld);
            }
            if (fkLibroNew != null && !fkLibroNew.equals(fkLibroOld)) {
                fkLibroNew.getDetalleVentaList().add(detalleVenta);
                fkLibroNew = em.merge(fkLibroNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = detalleVenta.getIdDetalle();
                if (findDetalleVenta(id) == null) {
                    throw new NonexistentEntityException("The detalleVenta with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            DetalleVenta detalleVenta;
            try {
                detalleVenta = em.getReference(DetalleVenta.class, id);
                detalleVenta.getIdDetalle();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The detalleVenta with id " + id + " no longer exists.", enfe);
            }
            Venta idVenta = detalleVenta.getIdVenta();
            if (idVenta != null) {
                idVenta.getDetalleVentaList().remove(detalleVenta);
                idVenta = em.merge(idVenta);
            }
            Libro fkLibro = detalleVenta.getFkLibro();
            if (fkLibro != null) {
                fkLibro.getDetalleVentaList().remove(detalleVenta);
                fkLibro = em.merge(fkLibro);
            }
            em.remove(detalleVenta);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<DetalleVenta> findDetalleVentaEntities() {
        return findDetalleVentaEntities(true, -1, -1);
    }

    public List<DetalleVenta> findDetalleVentaEntities(int maxResults, int firstResult) {
        return findDetalleVentaEntities(false, maxResults, firstResult);
    }

    private List<DetalleVenta> findDetalleVentaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(DetalleVenta.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public DetalleVenta findDetalleVenta(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(DetalleVenta.class, id);
        } finally {
            em.close();
        }
    }

    public int getDetalleVentaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<DetalleVenta> rt = cq.from(DetalleVenta.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
