package com.wepr.watchshop.dao;

import com.wepr.watchshop.model.Order;
import com.wepr.watchshop.util.ConnectionUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class OrderDAO {
    public void insertOrder(Order order) {
        EntityManager em;
        em = ConnectionUtil.getEMF().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(order);
            trans.commit();
        }catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        finally {
            em.close();
        }
    }

    public List<Order> getAllOrderPaging(int page, int maxResults) {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        String qString = "SELECT u from Order u order by u.createdAt";
        TypedQuery<Order> q = em.createQuery(qString, Order.class);
        List<Order> orders;
        try {
            orders = q
                    .setMaxResults(maxResults)
                    .setFirstResult((page-1)*maxResults)
                    .getResultList();
            if (orders == null || orders.isEmpty())
                orders = null;
        } finally {
            em.close();
        }
        return orders;
    }
    public List<Order> getAllOrderPagingByDateTime(int page, Integer maxResults, String fromDate, String toDate) throws ParseException {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        String qString = "select u FROM Order u where cast(u.createdAt AS date) between :fromDate1  and :toDate1 order by u.createdAt";
        TypedQuery<Order> q = em.createQuery(qString, Order.class);
        Date fromDate1 =new SimpleDateFormat("yyyy-MM-dd").parse(fromDate);
        Date toDate1 =new SimpleDateFormat("yyyy-MM-dd").parse(toDate);
        q.setParameter("fromDate1", fromDate1);
        q.setParameter("toDate1", toDate1);
        List<Order> orders;
        try {
            if (maxResults == null)
                orders = q.getResultList();
            else orders = q
                    .setMaxResults(maxResults)
                    .setFirstResult((page-1)*maxResults)
                    .getResultList();
            if (orders == null || orders.isEmpty())
                orders = null;
        } finally {
            em.close();
        }
        return orders;
    }

    public Integer getAllOrders() {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        String qString = "FROM Order u";
        TypedQuery<Order> q = em.createQuery(qString, Order.class);
        List<Order> order;
        try {
            order = q.getResultList();
        } finally {
            em.close();
        }
        return order.size();
    }

    public Double getAverageOrderTotal() {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        String qString = "select avg (u.total) FROM Order u";
        TypedQuery<Double> q = em.createQuery(qString, Double.class);
        Double order = q.getSingleResult();
        return order;
    }

    public List<Order> getAllOrderPagingDesc(int page, int maxResults) {
        EntityManager em = ConnectionUtil.getEMF().createEntityManager();
        String qString = "SELECT u from Order u order by u.createdAt desc ";
        TypedQuery<Order> q = em.createQuery(qString, Order.class);
        List<Order> orders;
        try {
            orders = q
                    .setMaxResults(maxResults)
                    .setFirstResult((page-1)*maxResults)
                    .getResultList();
            if (orders == null || orders.isEmpty())
                orders = null;
        } finally {
            em.close();
        }
        return orders;
    }

}
