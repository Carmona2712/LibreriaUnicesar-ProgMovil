/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Controladores.exceptions.IllegalOrphanException;
import Controladores.exceptions.NonexistentEntityException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entidades.Administrador;
import Entidades.Cliente;
import Entidades.DetalleVenta;
import Entidades.Venta;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Ricardo Carmona
 */
public class VentaJpaController implements Serializable {

    public VentaJpaController() {
        this.emf = Persistence.createEntityManagerFactory("LibreriaUnicesar-ProgMovilPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Venta venta) {
        if (venta.getDetalleVentaList() == null) {
            venta.setDetalleVentaList(new ArrayList<DetalleVenta>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Administrador fkAdmin = venta.getFkAdmin();
            if (fkAdmin != null) {
                fkAdmin = em.getReference(fkAdmin.getClass(), fkAdmin.getUsuario());
                venta.setFkAdmin(fkAdmin);
            }
            Cliente fkCliente = venta.getFkCliente();
            if (fkCliente != null) {
                fkCliente = em.getReference(fkCliente.getClass(), fkCliente.getId());
                venta.setFkCliente(fkCliente);
            }
            List<DetalleVenta> attachedDetalleVentaList = new ArrayList<DetalleVenta>();
            for (DetalleVenta detalleVentaListDetalleVentaToAttach : venta.getDetalleVentaList()) {
                detalleVentaListDetalleVentaToAttach = em.getReference(detalleVentaListDetalleVentaToAttach.getClass(), detalleVentaListDetalleVentaToAttach.getIdDetalle());
                attachedDetalleVentaList.add(detalleVentaListDetalleVentaToAttach);
            }
            venta.setDetalleVentaList(attachedDetalleVentaList);
            em.persist(venta);
            if (fkAdmin != null) {
                fkAdmin.getVentaList().add(venta);
                fkAdmin = em.merge(fkAdmin);
            }
            if (fkCliente != null) {
                fkCliente.getVentaList().add(venta);
                fkCliente = em.merge(fkCliente);
            }
            for (DetalleVenta detalleVentaListDetalleVenta : venta.getDetalleVentaList()) {
                Venta oldIdVentaOfDetalleVentaListDetalleVenta = detalleVentaListDetalleVenta.getIdVenta();
                detalleVentaListDetalleVenta.setIdVenta(venta);
                detalleVentaListDetalleVenta = em.merge(detalleVentaListDetalleVenta);
                if (oldIdVentaOfDetalleVentaListDetalleVenta != null) {
                    oldIdVentaOfDetalleVentaListDetalleVenta.getDetalleVentaList().remove(detalleVentaListDetalleVenta);
                    oldIdVentaOfDetalleVentaListDetalleVenta = em.merge(oldIdVentaOfDetalleVentaListDetalleVenta);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Venta venta) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Venta persistentVenta = em.find(Venta.class, venta.getId());
            Administrador fkAdminOld = persistentVenta.getFkAdmin();
            Administrador fkAdminNew = venta.getFkAdmin();
            Cliente fkClienteOld = persistentVenta.getFkCliente();
            Cliente fkClienteNew = venta.getFkCliente();
            List<DetalleVenta> detalleVentaListOld = persistentVenta.getDetalleVentaList();
            List<DetalleVenta> detalleVentaListNew = venta.getDetalleVentaList();
            List<String> illegalOrphanMessages = null;
            for (DetalleVenta detalleVentaListOldDetalleVenta : detalleVentaListOld) {
                if (!detalleVentaListNew.contains(detalleVentaListOldDetalleVenta)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain DetalleVenta " + detalleVentaListOldDetalleVenta + " since its idVenta field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (fkAdminNew != null) {
                fkAdminNew = em.getReference(fkAdminNew.getClass(), fkAdminNew.getUsuario());
                venta.setFkAdmin(fkAdminNew);
            }
            if (fkClienteNew != null) {
                fkClienteNew = em.getReference(fkClienteNew.getClass(), fkClienteNew.getId());
                venta.setFkCliente(fkClienteNew);
            }
            List<DetalleVenta> attachedDetalleVentaListNew = new ArrayList<DetalleVenta>();
            for (DetalleVenta detalleVentaListNewDetalleVentaToAttach : detalleVentaListNew) {
                detalleVentaListNewDetalleVentaToAttach = em.getReference(detalleVentaListNewDetalleVentaToAttach.getClass(), detalleVentaListNewDetalleVentaToAttach.getIdDetalle());
                attachedDetalleVentaListNew.add(detalleVentaListNewDetalleVentaToAttach);
            }
            detalleVentaListNew = attachedDetalleVentaListNew;
            venta.setDetalleVentaList(detalleVentaListNew);
            venta = em.merge(venta);
            if (fkAdminOld != null && !fkAdminOld.equals(fkAdminNew)) {
                fkAdminOld.getVentaList().remove(venta);
                fkAdminOld = em.merge(fkAdminOld);
            }
            if (fkAdminNew != null && !fkAdminNew.equals(fkAdminOld)) {
                fkAdminNew.getVentaList().add(venta);
                fkAdminNew = em.merge(fkAdminNew);
            }
            if (fkClienteOld != null && !fkClienteOld.equals(fkClienteNew)) {
                fkClienteOld.getVentaList().remove(venta);
                fkClienteOld = em.merge(fkClienteOld);
            }
            if (fkClienteNew != null && !fkClienteNew.equals(fkClienteOld)) {
                fkClienteNew.getVentaList().add(venta);
                fkClienteNew = em.merge(fkClienteNew);
            }
            for (DetalleVenta detalleVentaListNewDetalleVenta : detalleVentaListNew) {
                if (!detalleVentaListOld.contains(detalleVentaListNewDetalleVenta)) {
                    Venta oldIdVentaOfDetalleVentaListNewDetalleVenta = detalleVentaListNewDetalleVenta.getIdVenta();
                    detalleVentaListNewDetalleVenta.setIdVenta(venta);
                    detalleVentaListNewDetalleVenta = em.merge(detalleVentaListNewDetalleVenta);
                    if (oldIdVentaOfDetalleVentaListNewDetalleVenta != null && !oldIdVentaOfDetalleVentaListNewDetalleVenta.equals(venta)) {
                        oldIdVentaOfDetalleVentaListNewDetalleVenta.getDetalleVentaList().remove(detalleVentaListNewDetalleVenta);
                        oldIdVentaOfDetalleVentaListNewDetalleVenta = em.merge(oldIdVentaOfDetalleVentaListNewDetalleVenta);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = venta.getId();
                if (findVenta(id) == null) {
                    throw new NonexistentEntityException("The venta with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws IllegalOrphanException, NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Venta venta;
            try {
                venta = em.getReference(Venta.class, id);
                venta.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The venta with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<DetalleVenta> detalleVentaListOrphanCheck = venta.getDetalleVentaList();
            for (DetalleVenta detalleVentaListOrphanCheckDetalleVenta : detalleVentaListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Venta (" + venta + ") cannot be destroyed since the DetalleVenta " + detalleVentaListOrphanCheckDetalleVenta + " in its detalleVentaList field has a non-nullable idVenta field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Administrador fkAdmin = venta.getFkAdmin();
            if (fkAdmin != null) {
                fkAdmin.getVentaList().remove(venta);
                fkAdmin = em.merge(fkAdmin);
            }
            Cliente fkCliente = venta.getFkCliente();
            if (fkCliente != null) {
                fkCliente.getVentaList().remove(venta);
                fkCliente = em.merge(fkCliente);
            }
            em.remove(venta);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Venta> findVentaEntities() {
        return findVentaEntities(true, -1, -1);
    }

    public List<Venta> findVentaEntities(int maxResults, int firstResult) {
        return findVentaEntities(false, maxResults, firstResult);
    }

    private List<Venta> findVentaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Venta.class));
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

    public Venta findVenta(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Venta.class, id);
        } finally {
            em.close();
        }
    }

    public int getVentaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Venta> rt = cq.from(Venta.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
