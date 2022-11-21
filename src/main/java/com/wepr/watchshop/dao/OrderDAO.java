package com.wepr.watchshop.dao;

import com.wepr.watchshop.model.Order;
import com.wepr.watchshop.util.ConnectionUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class OrderDAO {
    public void insertOrder(Order order) {
        EntityManager em;
        em = ConnectionUtil.getEMF().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(order);
            trans.commit();
        }catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        finally {
            em.close();
        }
    }
}
