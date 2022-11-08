package com.wepr.watchshop.dao;

import com.wepr.watchshop.model.Product;
import com.wepr.watchshop.model.ProductImage;
import com.wepr.watchshop.util.ConnectionUtil;

import javax.persistence.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ProductDAO {
        public List<Product> getAllProductPaging(Integer page) {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        String qString = "from Product u";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        List<Product> products;
        try {
            products = q
                    .setMaxResults(9)
                    .setFirstResult((page-1)*9) //Position start at 0, 9, 18,...depending on input pages
                    .getResultList();
            if (products == null || products.isEmpty())
                products = null;
        } finally {
            em.close();
        }
        return products;
    }

    public List<Product> getAllProductPagingByCategory(Integer page, Long id) {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        String qString = "SELECT e FROM Product e INNER JOIN e.category t where t.id=:id";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        q.setParameter("id", id);
        List<Product> products;
        try {
            products = q
                    .setMaxResults(9)
                    .setFirstResult((page-1)*9) //Position start at 0, 9, 18,...depending on input pages
                    .getResultList();
            if (products == null || products.isEmpty())
                products = null;
        } finally {
            em.close();
        }
        return products;
    }

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

    public List<Product> getProductsFromBrand(String brand) {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        String qString = "from Product u WHERE u.brand =:brand";

        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        q.setParameter("brand", brand);
        List<Product> products;
        try {
            products = q
                    .setMaxResults(4)
                    .getResultList();
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

    public Product insertProduct( Product product) {
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
        return product;
    }
}
