package com.wepr.watchshop.dao;

import com.wepr.watchshop.model.Category;
import com.wepr.watchshop.model.Product;
import com.wepr.watchshop.util.ConnectionUtil;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class CategoryDAO {
    public Category getCategoryById(Long categoryId) {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        Category category;
        try {
            category = em.find(Category.class, categoryId);
        } finally {
            em.close();
        }
        return category;
    }

    public List<Category> getAllCategoryPaging() {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        String qString = "from Category u";
        TypedQuery<Category> q = em.createQuery(qString, Category.class);
        List<Category> categories;
        try {
            categories = q.getResultList();
            if (categories == null || categories.isEmpty())
                categories = null;
        } finally {
            em.close();
        }
        return categories;
    }
}