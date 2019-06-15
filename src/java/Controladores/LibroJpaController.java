/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Controladores.exceptions.NonexistentEntityException;
import Controladores.exceptions.PreexistingEntityException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entidades.Autor;
import Entidades.Editorial;
import Entidades.Libro;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Ricardo Carmona
 */
public class LibroJpaController implements Serializable {

    public LibroJpaController() {
        this.emf = Persistence.createEntityManagerFactory("LibreriaUnicesar-ProgMovilPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Libro libro) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Autor fkAutor = libro.getFkAutor();
            if (fkAutor != null) {
                fkAutor = em.getReference(fkAutor.getClass(), fkAutor.getId());
                libro.setFkAutor(fkAutor);
            }
            Editorial fkEditorial = libro.getFkEditorial();
            if (fkEditorial != null) {
                fkEditorial = em.getReference(fkEditorial.getClass(), fkEditorial.getId());
                libro.setFkEditorial(fkEditorial);
            }
            em.persist(libro);
            if (fkAutor != null) {
                fkAutor.getLibroList().add(libro);
                fkAutor = em.merge(fkAutor);
            }
            if (fkEditorial != null) {
                fkEditorial.getLibroList().add(libro);
                fkEditorial = em.merge(fkEditorial);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findLibro(libro.getCodigo()) != null) {
                throw new PreexistingEntityException("Libro " + libro + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Libro libro) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Libro persistentLibro = em.find(Libro.class, libro.getCodigo());
            Autor fkAutorOld = persistentLibro.getFkAutor();
            Autor fkAutorNew = libro.getFkAutor();
            Editorial fkEditorialOld = persistentLibro.getFkEditorial();
            Editorial fkEditorialNew = libro.getFkEditorial();
            if (fkAutorNew != null) {
                fkAutorNew = em.getReference(fkAutorNew.getClass(), fkAutorNew.getId());
                libro.setFkAutor(fkAutorNew);
            }
            if (fkEditorialNew != null) {
                fkEditorialNew = em.getReference(fkEditorialNew.getClass(), fkEditorialNew.getId());
                libro.setFkEditorial(fkEditorialNew);
            }
            libro = em.merge(libro);
            if (fkAutorOld != null && !fkAutorOld.equals(fkAutorNew)) {
                fkAutorOld.getLibroList().remove(libro);
                fkAutorOld = em.merge(fkAutorOld);
            }
            if (fkAutorNew != null && !fkAutorNew.equals(fkAutorOld)) {
                fkAutorNew.getLibroList().add(libro);
                fkAutorNew = em.merge(fkAutorNew);
            }
            if (fkEditorialOld != null && !fkEditorialOld.equals(fkEditorialNew)) {
                fkEditorialOld.getLibroList().remove(libro);
                fkEditorialOld = em.merge(fkEditorialOld);
            }
            if (fkEditorialNew != null && !fkEditorialNew.equals(fkEditorialOld)) {
                fkEditorialNew.getLibroList().add(libro);
                fkEditorialNew = em.merge(fkEditorialNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = libro.getCodigo();
                if (findLibro(id) == null) {
                    throw new NonexistentEntityException("The libro with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Libro libro;
            try {
                libro = em.getReference(Libro.class, id);
                libro.getCodigo();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The libro with id " + id + " no longer exists.", enfe);
            }
            Autor fkAutor = libro.getFkAutor();
            if (fkAutor != null) {
                fkAutor.getLibroList().remove(libro);
                fkAutor = em.merge(fkAutor);
            }
            Editorial fkEditorial = libro.getFkEditorial();
            if (fkEditorial != null) {
                fkEditorial.getLibroList().remove(libro);
                fkEditorial = em.merge(fkEditorial);
            }
            em.remove(libro);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Libro> findLibroEntities() {
        return findLibroEntities(true, -1, -1);
    }

    public List<Libro> findLibroEntities(int maxResults, int firstResult) {
        return findLibroEntities(false, maxResults, firstResult);
    }

    private List<Libro> findLibroEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Libro.class));
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

    public Libro findLibro(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Libro.class, id);
        } finally {
            em.close();
        }
    }

    public int getLibroCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Libro> rt = cq.from(Libro.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
