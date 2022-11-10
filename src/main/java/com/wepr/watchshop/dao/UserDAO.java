package com.wepr.watchshop.dao;

import com.wepr.watchshop.model.User;
import com.wepr.watchshop.util.ConnectionUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

public class UserDAO {

    public void insertUser(User user) {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(user);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public User selectUser(String email) {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        String query = "SELECT u from User u " + "WHERE u.email = :email";

        TypedQuery<User> q = em.createQuery(query, User.class);
        q.setParameter("email", email);
        User user = null;        
        try {
            user = q.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            em.close();
        }
        return user;
    }

}
