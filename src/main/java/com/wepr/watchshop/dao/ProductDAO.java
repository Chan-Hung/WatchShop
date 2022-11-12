package com.wepr.watchshop.dao;

import com.wepr.watchshop.model.Product;
import com.wepr.watchshop.util.ConnectionUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.util.List;

public class ProductDAO {
        public List<Product> getAllProductPaging(int page, int maxResults) {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        String qString = "from Product u";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        List<Product> products;
        try {
            products = q
                    .setMaxResults(maxResults)
                    .setFirstResult((page-1)*maxResults)
                    .getResultList();
            if (products == null || products.isEmpty())
                products = null;
        } finally {
            em.close();
        }
        return products;
    }

    public List<Product> getAllProductPagingByCategory(int page, Long id) {
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

    public List<Product> getRelatedProductsByBrand(int maxResults, Product product){
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        String qString = "SELECT e FROM Product e where e.brand=:brand and not e.id=:id";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        q.setParameter("brand", product.getBrand());
        q.setParameter("id", product.getId());
        List<Product> products;
        try {
            products = q
                    .setMaxResults(maxResults)
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
        } finally {
            em.close();
        }
        return product;
    }

    public void insertProduct(Product product) {
        EntityManager em;
        em = ConnectionUtil.getEMF().createEntityManager();
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

    public void updateProduct(Product product) {
        EntityManager em;
        em = ConnectionUtil.getEMF().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(product);
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
