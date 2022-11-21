package com.wepr.watchshop.dao;

import com.wepr.watchshop.model.Address;
import com.wepr.watchshop.util.ConnectionUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class AddressDAO {
    public void insertAddress(Address address) {
        EntityManager em;
        em = ConnectionUtil.getEMF().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(address);
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
