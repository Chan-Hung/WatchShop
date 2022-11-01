package com.wepr.watchshop.dao;

import com.wepr.watchshop.model.Product;
import com.wepr.watchshop.util.ConnectionUtil;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public List<Product> getAllProduct() {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        String qString =
                "SELECT u from Product u";
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

//    public static void main(String[] args) {
//        ProductDAO productDAO = new ProductDAO();
//        List<Product> products = productDAO.getAllProduct();
//        for (Product product : products) {
//            System.out.println(product.getId());
//            System.out.println(product.getTitle());
//            System.out.println(product.getDescription());
//            System.out.println(product.getSize());
//            System.out.println(product.getColor());
//            System.out.println(product.getImage());
//        }
//    }
}
