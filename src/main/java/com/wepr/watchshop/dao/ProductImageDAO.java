package com.wepr.watchshop.dao;

import com.wepr.watchshop.model.Product;
import com.wepr.watchshop.model.ProductImage;
import com.wepr.watchshop.util.ConnectionUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class ProductImageDAO {
    public void insertProductImage( ProductImage productImage) {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(productImage);
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
