/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Controladores.exceptions.NonexistentEntityException;
import Entidades.Abastecimiento;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entidades.Libro;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Ricardo Carmona
 */
public class AbastecimientoJpaController implements Serializable {

    public AbastecimientoJpaController() {
        this.emf = Persistence.createEntityManagerFactory("LibreriaUnicesar-ProgMovilPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Abastecimiento abastecimiento) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Libro fkLibro = abastecimiento.getFkLibro();
            if (fkLibro != null) {
                fkLibro = em.getReference(fkLibro.getClass(), fkLibro.getCodigo());
                abastecimiento.setFkLibro(fkLibro);
            }
            em.persist(abastecimiento);
            if (fkLibro != null) {
                fkLibro.getAbastecimientoList().add(abastecimiento);
                fkLibro = em.merge(fkLibro);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Abastecimiento abastecimiento) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Abastecimiento persistentAbastecimiento = em.find(Abastecimiento.class, abastecimiento.getId());
            Libro fkLibroOld = persistentAbastecimiento.getFkLibro();
            Libro fkLibroNew = abastecimiento.getFkLibro();
            if (fkLibroNew != null) {
                fkLibroNew = em.getReference(fkLibroNew.getClass(), fkLibroNew.getCodigo());
                abastecimiento.setFkLibro(fkLibroNew);
            }
            abastecimiento = em.merge(abastecimiento);
            if (fkLibroOld != null && !fkLibroOld.equals(fkLibroNew)) {
                fkLibroOld.getAbastecimientoList().remove(abastecimiento);
                fkLibroOld = em.merge(fkLibroOld);
            }
            if (fkLibroNew != null && !fkLibroNew.equals(fkLibroOld)) {
                fkLibroNew.getAbastecimientoList().add(abastecimiento);
                fkLibroNew = em.merge(fkLibroNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = abastecimiento.getId();
                if (findAbastecimiento(id) == null) {
                    throw new NonexistentEntityException("The abastecimiento with id " + id + " no longer exists.");
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
            Abastecimiento abastecimiento;
            try {
                abastecimiento = em.getReference(Abastecimiento.class, id);
                abastecimiento.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The abastecimiento with id " + id + " no longer exists.", enfe);
            }
            Libro fkLibro = abastecimiento.getFkLibro();
            if (fkLibro != null) {
                fkLibro.getAbastecimientoList().remove(abastecimiento);
                fkLibro = em.merge(fkLibro);
            }
            em.remove(abastecimiento);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Abastecimiento> findAbastecimientoEntities() {
        return findAbastecimientoEntities(true, -1, -1);
    }

    public List<Abastecimiento> findAbastecimientoEntities(int maxResults, int firstResult) {
        return findAbastecimientoEntities(false, maxResults, firstResult);
    }

    private List<Abastecimiento> findAbastecimientoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Abastecimiento.class));
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

    public Abastecimiento findAbastecimiento(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Abastecimiento.class, id);
        } finally {
            em.close();
        }
    }

    public int getAbastecimientoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Abastecimiento> rt = cq.from(Abastecimiento.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
