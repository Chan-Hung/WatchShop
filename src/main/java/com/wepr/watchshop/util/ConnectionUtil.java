package com.wepr.watchshop.util;


import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionUtil {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("group15");

    public static EntityManagerFactory getEMF() {
        return emf;
    }
}
