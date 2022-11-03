package com.wepr.watchshop.dao;

import com.wepr.watchshop.model.Product;
import com.wepr.watchshop.util.ConnectionUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public List<Product> getAllProduct() {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        String qString = "from Product u";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        List<Product> products;
        try {
            products = q.getResultList();
            if (products == null || products.isEmpty())
                products = null;
        } finally {
            em.close();
        }
        return products;
    }

    public Product getProductById(Long productId) {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        Product product;
        try {
            product = em.find(Product.class,productId);
            if (product == null)
                product = null;
        } finally {
            em.close();
        }
        return product;
    }

    public void insertProduct( Product product) {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(product);
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
