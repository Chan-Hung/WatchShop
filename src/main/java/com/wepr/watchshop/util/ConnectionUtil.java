package com.wepr.watchshop.util;


import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.HashMap;
import java.util.Map;

public class ConnectionUtil {
    public static Map<String, Object> getConfigOverrides(){
        Map<String, String> env = System.getenv();
        Map<String, Object> configOverrides = new HashMap<>();
        for (String envName : env.keySet()) {
            if (envName.equals("DB_PASSWORD"))
                configOverrides.put("javax.persistence.jdbc.password", env.get(envName));
            if(envName.equals("DB_USERNAME"))
                configOverrides.put("javax.persistence.jdbc.user", env.get(envName));
            if(envName.equals("JDBC_URL"))
                configOverrides.put("javax.persistence.jdbc.url", env.get(envName));
        }
        return configOverrides;
    }
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("group15", getConfigOverrides());
    public static EntityManagerFactory getEMF() {
        return emf;
    }
}
