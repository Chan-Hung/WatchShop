package com.wepr.watchshop.dao;

import com.wepr.watchshop.model.Category;
import com.wepr.watchshop.util.ConnectionUtil;

import javax.persistence.EntityManager;

public class CategoryDAO {
    public Category getCategoryById(Long categoryId){
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        Category category;
        try {
            category = em.find(Category.class, categoryId);
        } finally {
            em.close();
        }
        return category;
    }
}
