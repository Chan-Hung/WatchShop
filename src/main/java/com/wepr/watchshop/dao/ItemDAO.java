package com.wepr.watchshop.dao;

import com.wepr.watchshop.model.Item;
import com.wepr.watchshop.util.ConnectionUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class ItemDAO {
    public void insertItem(Item item) {
        EntityManager em;
        em = ConnectionUtil.getEMF().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(item);
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
