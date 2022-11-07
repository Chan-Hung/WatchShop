package com.wepr.watchshop.dao;

import com.wepr.watchshop.model.Category;
import com.wepr.watchshop.model.Product;
import com.wepr.watchshop.util.ConnectionUtil;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class CategoryDAO {
    public Category getCategoryById(Long categoryId){
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        Category category;
        try {
            category = em.find(Category.class, categoryId);
            if (category == null )
                category = null;
        } finally {
            em.close();
        }
        return category;
    }
}
