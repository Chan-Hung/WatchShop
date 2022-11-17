package com.wepr.watchshop.util;


import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ConnectionUtil {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("watchshop");

    public static EntityManagerFactory getEMF() {
        return emf;
    }
}
